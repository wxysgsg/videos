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
 *控制类，用于处理类目相关的请求
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

	@Resource
	CategoryService categoryService;

	/**
	 * 显示添加类目界面
	 * @param model 存储在视图中的数据模型
	 * @return 添加类目的视图名称
	 */
	@RequestMapping("/add")
	public String categoryAdd(Model model) {
		model.addAttribute("list", categoryService.getAllCategory()); // 查询所有类目信息并存储到模型中
		return "category/add"; // 跳转到添加类目的视图
	}

	/**
	 * 保存新添加的类目信息
	 * @param pid 父级类目ID
	 * @param title 类目标题
	 * @param thumb 类目缩略图
	 * @param description 类目描述
	 * @param created 创建时间
	 * @param updated 更新时间
	 * @param status 类目状态
	 * @param model 存储在视图中的数据模型
	 * @return 添加类目的视图名称
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String categorySave(String pid, String title, String thumb, String description, String created, String updated, String status, Model model) {
		Category modelX = new Category();
		modelX.setPid(pid);
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setDescription(description);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setStatus(status);

		categoryService.insert(modelX); // 插入新类目到数据库
		model.addAttribute("inpost", true);
		model.addAttribute("message", "类目新增成功!");
		return "category/add"; // 重定向到添加类目的页面
	}

	/**
	 * 根据ID删除类目信息
	 * @param id 要删除的类目ID
	 * @return 重定向到类目列表页面
	 */
	@RequestMapping("/delete")
	public String categoryDelete(int id) {
		categoryService.delete(id); // 删除指定ID的类目信息
		return "redirect:list"; // 重定向到类目列表页面
	}

	/**
	 * 显示所有类目列表
	 * @return 包含类目列表信息的ModelAndView对象
	 */
	@RequestMapping("/list")
	public ModelAndView categoryList() {
		List<Category> categoryList = categoryService.getAllCategory(); // 查询所有类目信息并存储到模型中
		System.out.println(categoryList.size());
		ModelAndView mav = new ModelAndView("category/list");
		mav.addObject("list", categoryList);
		return mav; // 返回包含类目列表信息的ModelAndView对象
	}

	/**
	 * 显示编辑指定ID类目的界面
	 * @param id 要编辑的类目ID
	 * @param model 存储在视图中的数据模型
	 * @return 编辑类目的视图名称
	 */
	@RequestMapping("/edit")
	public String categoryEdit(String id, Model model) {
		Category category = categoryService.getCategoryById(Integer.parseInt(id)); // 根据ID查询类目信息
		model.addAttribute("model", category); // 存储查询结果到模型中
		return "category/edit"; // 跳转到编辑类目的视图
	}

	/**
	 * 更新指定ID类目的信息
	 * @param pid 父级类目ID
	 * @param title 类目标题
	 * @param thumb 类目缩略图
	 * @param description 类目描述
	 * @param created 创建时间
	 * @param updated 更新时间
	 * @param status 类目状态
	 * @param id 要更新的类目ID
	 * @param model 存储在视图中的数据模型
	 * @return 编辑类目的视图名称
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String categoryUpdate(String pid, String title, String thumb, String description, String created, String updated, String status, int id, Model model) {
		Category modelX = categoryService.getCategoryById(id); // 根据ID查询类目信息
		// modelX.setPid(pid);
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setDescription(description);

		categoryService.update(modelX); // 更新类目信息到数据库
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX); // 存储更新后的类目信息到模型中
		model.addAttribute("message", "更新类目成功");
		return "category/edit"; // 跳转到编辑类目的视图
	}
}