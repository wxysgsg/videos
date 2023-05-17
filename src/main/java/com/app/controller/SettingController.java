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
/**
 * 设置页面的控制器，使用了Spring MVC框架提供的@Controller注解和@RequestMapping注解进行请求映射。
 * 其中，@RequestMapping("/setting")注解表示这个控制器处理URL中包含"/setting"的请求。
 *
 * */
@Controller
@RequestMapping("/setting")
public class SettingController {
	@Resource
	SettingService settingService;

	//处理"/index"请求，返回"setting/index"视图，同时通过Model对象将取到的设置信息传递给模板页面。
	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("cfg", settingService.getSettingById(1));
		return "setting/index";
	}

	@RequestMapping(value = "/update2", method = RequestMethod.POST)
	public String update2(String copyright, String address, String url,
			String facebook, String tel, String email, String fax, String icp,
			String phone, String weibo, String count, String other,
			String master, String title, String keywords, String description,
			Model model) {

		Setting modelX = settingService.getSettingById(1);
		modelX.setTitle(title);
		modelX.setKeywords(keywords);
		modelX.setDescription(description);
		modelX.setCopyright(copyright);
		modelX.setAddress(address);
		modelX.setUrl(url);
		modelX.setFacebook(facebook);
		modelX.setTel(tel);
		modelX.setEmail(email);
		modelX.setFax(fax);
		modelX.setIcp(icp);
		modelX.setPhone(phone);
		modelX.setWeibo(weibo);
		modelX.setOther(other);
		modelX.setMaster(master);

		settingService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "更新信息成功");
		return "setting/index";
	}

	//处理"/setting/add"请求，返回"admin/setting/add"视图，即添加设置页面的模板。
	@RequestMapping("/setting/add")
	public String settingAdd() {
		return "admin/setting/add";
	}

	//处理"/setting/save"请求，从页面获取参数并创建新的Setting对象，通过调用SettingService对象的insert()方法将新建的对象插入到数据库中
	@RequestMapping(value = "/setting/save", method = RequestMethod.POST)
	public String settingSave(String title, String keywords,
			String description, String copyright, String address, String url,
			String facebook, String tel, String email, String fax, String icp,
			String phone, String weibo, String count, String other,
			String master, Model model) {
		Setting modelX = new Setting();
		modelX.setTitle(title);
		modelX.setKeywords(keywords);
		modelX.setDescription(description);
		modelX.setCopyright(copyright);
		modelX.setAddress(address);
		modelX.setUrl(url);
		modelX.setFacebook(facebook);
		modelX.setTel(tel);
		modelX.setEmail(email);
		modelX.setFax(fax);
		modelX.setIcp(icp);
		modelX.setPhone(phone);
		modelX.setWeibo(weibo);
		modelX.setCount(count);
		modelX.setOther(other);
		modelX.setMaster(master);

		settingService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/setting/add";
	}

	//处理"/setting/delete"请求，根据id参数调用SettingService对象的delete()方法删除设置信息。
	@RequestMapping("/setting/delete")
	public String settingDelete(int id) {
		settingService.delete(id);
		return "redirect:list";
	}

	//处理"/setting/list"请求，调用SettingService对象的getAllSetting()方法，获取所有设置信息，并将其传递给"admin/setting/list"模板页面
	@RequestMapping("/setting/list")
	public ModelAndView settingList() {
		List<Setting> settingList = settingService.getAllSetting();
		System.out.println(settingList.size());
		ModelAndView mav = new ModelAndView("admin/setting/list");
		mav.addObject("list", settingList);
		return mav;
	}

	//处理"/setting/edit"请求，根据id参数调用SettingService对象的getSettingById()方法获取特定id的设置信息，并将其传递给"admin/setting/edit"模板页面。
	@RequestMapping("/setting/edit")
	public String settingEdit(String id, Model model) {
		Setting setting = settingService.getSettingById(Integer.parseInt(id));
		model.addAttribute("model", setting);
		return "admin/setting/edit";
	}

	//处理"/setting/update"请求，获取页面参数并更新特定id的设置对象，最后通过调用SettingService对象的update()方法更新数据库中的信息。
	@RequestMapping(value = "/setting/update", method = RequestMethod.POST)
	public String settingUpdate(String title, String keywords,
			String description, String copyright, String address, String url,
			String facebook, String tel, String email, String fax, String icp,
			String phone, String weibo, String count, String other,
			String master, int id, Model model) {

		Setting modelX = settingService.getSettingById(id);
		modelX.setTitle(title);
		modelX.setKeywords(keywords);
		modelX.setDescription(description);
		modelX.setCopyright(copyright);
		modelX.setAddress(address);
		modelX.setUrl(url);
		modelX.setFacebook(facebook);
		modelX.setTel(tel);
		modelX.setEmail(email);
		modelX.setFax(fax);
		modelX.setIcp(icp);
		modelX.setPhone(phone);
		modelX.setWeibo(weibo);
		modelX.setOther(other);
		modelX.setMaster(master);

		settingService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/setting/edit";
	}
}
