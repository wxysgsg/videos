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
import com.app.utils.MainUtils;
/**
 * 该类是一个控制器类，使用@Controller注释来声明。
 * */
@Controller
//将该类下的所有RequestMapping注释映射到/catlog路径，即访问该类下的任何方法都需要在路径前加上/catlog。
@RequestMapping("/catlog")
public class CatlogController {
	//该注释用于指定需要注入的依赖关系对象。在这里，注入CatlogService。
	@Resource
	CatlogService catlogService;

	//将该方法映射到/catlog/add路径，该方法用于显示添加目录的视图
	@RequestMapping("/catlog/add")
	public String catlogAdd(Model model) {
		model.addAttribute("list", catlogService.getCatlogByPid(0));
		return "admin/catlog/add";
	}

	//将该方法映射到/catlog/save路径，并指定请求方法为POST，用于保存新添加的目录信息。
	@RequestMapping(value = "/catlog/save", method = RequestMethod.POST)
	public String catlogSave(String title, String thumb, String description,
			String created, String updated, String minval, String maxval,
			String pid, Model model) {
		Catlog modelX = new Catlog();
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setDescription(description);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setMinval(minval);
		modelX.setMaxval(maxval);
		modelX.setPid(pid);

		catlogService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/catlog/add";
	}

	//将该方法映射到/catlog/delete路径，用于根据id删除目录信息。
	@RequestMapping("/catlog/delete")
	public String catlogDelete(int id) {
		catlogService.delete(id);
		return "redirect:list";
	}

	//将该方法映射到/catlog/list路径，用于显示所有目录列表的视图。
	@RequestMapping("/catlog/list")
	public ModelAndView catlogList() {
		List<Catlog> catlogList = catlogService.getAllCatlog();
		for (Catlog catlog : catlogList) {
			catlog.setP(catlogService.getCatlogById(Integer.parseInt(catlog
					.getPid())));
		}
		System.out.println(catlogList.size());
		ModelAndView mav = new ModelAndView("admin/catlog/list");
		mav.addObject("list", catlogList);
		return mav;
	}

	//将该方法映射到/catlog/edit路径，用于显示编辑指定id目录的视图
	@RequestMapping("/catlog/edit")
	public String catlogEdit(String id, Model model) {
		Catlog catlog = catlogService.getCatlogById(Integer.parseInt(id));
		model.addAttribute("model", catlog);
		return "admin/catlog/edit";
	}

	//将该方法映射到/catlog/update路径，并指定请求方法为POST，用于更新指定id的目录信息。
	@RequestMapping(value = "/catlog/update", method = RequestMethod.POST)
	public String catlogUpdate(String title, String thumb, String description,
			String created, String updated, String minval, String maxval,
			String pid, int id, Model model) {

		Catlog modelX = catlogService.getCatlogById(id);
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setDescription(description);

		catlogService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/catlog/edit";
	}
}
