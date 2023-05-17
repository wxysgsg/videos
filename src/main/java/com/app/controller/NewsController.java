package com.app.controller;

import java.io.File;
import java.util.LinkedList;
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

// 使用@Controller注释来标识该类作为控制器类
@Controller
// 使用@RequestMapping("/news")注释为该类中的所有映射请求提供基础路径
@RequestMapping("/news")
public class NewsController {
	@Resource
	NewsService newsService;
	@Resource
	InfocateService cateService;

	// 映射路径为/news/add的GET请求，用于返回添加新闻页面
	@RequestMapping("/news/add")
	public String newsAdd(Model model) {
		model.addAttribute("list", cateService.getAllInfocate());
		return "admin/news/add";
	}

	// 映射路径为/news/save的POST请求，用于接收表单数据并将其存储为一个News对象
	@RequestMapping(value = "/news/save", method = RequestMethod.POST)
	public String newsSave(String uid, String title, String thumb,
						   String description, String bodytext, String created, String click,
						   String support, String tags, HttpSession sess, Model model) {
		News modelX = new News();
		modelX.setUid(uid);
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setClick("0");
		modelX.setTags(tags);
		modelX.setSupport(sess.getAttribute("userid").toString());
		modelX.setDescription(description);
		modelX.setBodytext(bodytext);
		modelX.setCreated(MainUtils.getTime());

		// 调用NewsService的insert方法将News对象插入数据库中
		newsService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/news/add";
	}

	// 映射路径为/news/delete的GET请求，用于根据id参数删除指定的News对象
	@RequestMapping("/news/delete")
	public String newsDelete(int id, Model model, String ret) {
		newsService.delete(id);
		model.addAttribute("message", "Success!");
		return "redirect:" + ret;
	}

	// 映射路径为/news/list的GET请求，用于查询所有News对象，并将结果添加到ModelAndView对象中，最后返回"admin/news/list"页面
	@RequestMapping("/news/list")
	public ModelAndView newsList() {
		List<News> newsList = newsService.getAllNews();
		List<News> newsList1 = new LinkedList<News>();
		if (newsList.size() > 0) {
			for (News n : newsList) {
				n.setCate(cateService.getInfocateById(Integer.parseInt(n.getUid())));
				newsList1.add(n);
			}
		}

		System.out.println(newsList.size());
		ModelAndView mav = new ModelAndView("admin/news/list");
		mav.addObject("list", newsList1);
		return mav;
	}

	// 映射路径为/news/my的GET请求，用于查询指定用户的所有News对象，并将结果添加到ModelAndView对象中，最后返回"admin/news/my"页面
	@RequestMapping("/news/my")
	public ModelAndView my(HttpSession sess) {
		List<News> newsList = newsService.getAllNews();
		List<News> newsList1 = new LinkedList<News>();
		if (newsList.size() > 0) {
			for (News n : newsList) {
				n.setCate(cateService.getInfocateById(Integer.parseInt(n.getUid())));
				if (sess.getAttribute("userid").toString().equals(n.getSupport())) {
					newsList1.add(n);
				}
			}
		}

		System.out.println(newsList.size());
		ModelAndView mav = new ModelAndView("admin/news/my");
		mav.addObject("list", newsList1);
		return mav;
	}

	// 映射路径为/news/edit的GET请求，用于根据id参数查询指定的News对象并将其添加到Model对象中，最后返回"admin/news/edit"页面
	@RequestMapping("/news/edit")
	public String newsEdit(String id, Model model) {
		News news = newsService.getNewsById(Integer.parseInt(id));
		model.addAttribute("model", news);
		return "admin/news/edit";
	}

	// 映射路径为/news/update的POST请求，用于接收表单数据并将其存储为一个News对象
	@RequestMapping(value = "/news/update", method = RequestMethod.POST)
	public String newsUpdate(String uid, String title, String thumb,
							 String description, String bodytext, String created, String click,
							 String support, String tags, int id, Model model) {

		News modelX = newsService.getNewsById(id);
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setDescription(description);
		modelX.setBodytext(bodytext);
		modelX.setTags(tags);
		newsService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/news/edit";
	}
}
