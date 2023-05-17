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
 * 存放控制器类，用于处理来自客户端的请求，调用相应的服务层处理业务逻辑，并返回处理结果给客户端。通常使用Spring MVC等框架实现。
 * */
@Controller
@RequestMapping("/ads")
public class AdsController {

	//自动注入AdsService对象
	@Resource
	AdsService adsService;

	//添加广告页面
	@RequestMapping("/add")
	public String adsAdd() {
		return "ads/add";
	}

	//保存广告信息
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String adsSave(String title, String url, String thumb,
						  String created, String updated, String status, String intro,
						  Model model) {
		//创建Ads对象，并设置其属性值
		Ads modelX = new Ads();
		modelX.setTitle(title);
		modelX.setUrl(url);
		modelX.setThumb(thumb);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setIntro(intro);

		//调用AdsService的insert()方法，将广告信息存入数据库中
		adsService.insert(modelX);

		//向model中添加属性值，用于在视图中输出信息
		model.addAttribute("inpost", true);
		model.addAttribute("message", "上传成功!");
		return "ads/add";
	}

	//删除广告信息
	@RequestMapping("/delete")
	public String adsDelete(int id) {
		//调用AdsService的delete()方法，从数据库中删除指定id的广告信息
		adsService.delete(id);
		//重定向到列表页面，使页面刷新
		return "redirect:list";
	}

	//获取所有广告信息
	@RequestMapping("/list")
	public ModelAndView adsList() {
		//调用AdsService的getAllAds()方法，获取所有广告信息
		List<Ads> adsList = adsService.getAllAds();
		System.out.println(adsList.size());
		ModelAndView mav = new ModelAndView("ads/list");
		//向modelAndView对象中添加属性值，用于在视图中输出信息
		mav.addObject("list", adsList);
		return mav;
	}

	//编辑指定的广告信息
	@RequestMapping("/edit")
	public String adsEdit(String id, Model model) {
		//调用AdsService的getAdsById()方法，获取指定id的广告信息
		Ads ads = adsService.getAdsById(Integer.parseInt(id));
		//向model中添加属性值，用于在视图中输出信息
		model.addAttribute("model", ads);
		return "ads/edit";
	}

	//更新已有的广告信息
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String adsUpdate(String title, String url, String thumb,
							String created, String updated, String status, String intro,
							int id, Model model) {

		//调用AdsService的getAdsById()方法，获取指定id的广告信息
		Ads modelX = adsService.getAdsById(id);
		//设置广告信息的各个属性值
		modelX.setTitle(title);
		modelX.setUrl(url);
		modelX.setThumb(thumb);
		modelX.setIntro(intro);

		//调用AdsService的update()方法，更新广告信息
		adsService.update(modelX);
		//向model中添加属性值，用于在视图中输出信息
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "更新成功");
		return "ads/edit";
	}
}
