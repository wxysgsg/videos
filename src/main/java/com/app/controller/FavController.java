package com.app.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.entity.*;
import com.app.service.*;

@Controller
@RequestMapping("/fav")
public class FavController {
	@Resource
	FavService favService;

	// 添加收藏页面
	@RequestMapping("/fav/add")
	public String favAdd() {
		return "admin/fav/add";
	}

	// 保存收藏数据
	@RequestMapping(value = "/fav/save", method = RequestMethod.POST)
	public String favSave(String uid, String pid, Model model) {
		Fav modelX = new Fav();
		modelX.setUid(uid);
		modelX.setPid(pid);

		favService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/fav/add";
	}

	// 删除收藏数据
	@RequestMapping("/delete")
	public String favDelete(int id) {
		favService.delete(id);
		return "redirect:list";
	}

	@Resource
	ProductsService productsService;

	// 获取收藏列表
	@RequestMapping("/list")
	public ModelAndView favList(HttpSession session) {
		Integer uid = Integer.parseInt(session.getAttribute("userid").toString());
		List<Fav> favList = favService.getFav1(uid);

		for (Fav fav : favList) {
			// 获取对应的商品信息
			fav.setP(productsService.getProductsById(Integer.parseInt(fav.getPid())));
		}

		ModelAndView mav = new ModelAndView("fav/list");
		mav.addObject("list", favList);
		return mav;
	}

	// 编辑收藏页面
	@RequestMapping("/fav/edit")
	public String favEdit(String id, Model model) {
		Fav fav = favService.getFavById(Integer.parseInt(id));
		model.addAttribute("model", fav);
		return "admin/fav/edit";
	}

	// 更新收藏数据
	@RequestMapping(value = "/fav/update", method = RequestMethod.POST)
	public String favUpdate(String uid, String pid, int id, Model model) {
		Fav modelX = favService.getFavById(id);
		modelX.setUid(uid);
		modelX.setPid(pid);

		favService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/fav/edit";
	}
}
