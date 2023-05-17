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

@Controller
@RequestMapping("/cates")
public class CatesController {

	@Resource
	CatesService catesService;

	/**
	 * 显示添加分类界面
	 * @param model 存储在视图中的数据模型
	 * @return 添加分类的视图名称
	 */
	@RequestMapping("/cates/add")
	public String catesAdd(Model model) {
		model.addAttribute("html", this.toOption(catesService.getByPid("0"), 0)); // 查询所有分类信息并存储到模型中
		return "admin/cates/add"; // 跳转到添加分类的视图
	}

	/**
	 * 将分类信息转换为下拉选项的HTML格式
	 * @param list 分类信息列表
	 * @param step 下拉选项的缩进级别
	 * @return 包含下拉选项的HTML代码
	 */
	public String toOption(List<Cates> list, int step) {
		String html = "";
		String str = "|";

		for (int i = 0; i < step; i++) {
			str += "--";
		}
		if (list.size() > 0) {
			for (Cates Cates : list) {
				if (Cates.getPid().equals("0"))
					step = 0;
				System.out.println(str + Cates.getTitle());
				html += "<option value='" + Cates.getId() + "'>";
				html += str + Cates.getTitle();
				html += "</option>";
				html += toOption(catesService.getByPid(Cates.getId() + ""), step += 5);
			}
		}

		return html;
	}

	/**
	 * 保存新添加的分类信息
	 * @param title 分类标题
	 * @param thumb 分类缩略图
	 * @param description 分类描述
	 * @param created 创建时间
	 * @param updated 更新时间
	 * @param maxval 最大值
	 * @param minval 最小值
	 * @param pid 父级分类ID
	 * @param model 存储在视图中的数据模型
	 * @return 添加分类的视图名称
	 */
	@RequestMapping(value = "/cates/save", method = RequestMethod.POST)
	public String catesSave(String title, String thumb, String description, String created, String updated, int maxval, int minval, String pid, Model model) {
		Cates modelX = new Cates();
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setDescription(description);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setMinval(minval);
		modelX.setMaxval(maxval);

		catesService.insert(modelX); // 插入新分类到数据库
		model.addAttribute("inpost", true);
		model.addAttribute("state", "success");
		model.addAttribute("url", "cates/cates/add");
		model.addAttribute("message", "操作成功");
		return "admin/cates/add"; // 重定向到添加分类的页面
	}

	/**
	 * 根据ID删除分类信息
	 * @param id 要删除的分类ID
	 * @param model 存储在视图中的数据模型
	 * @return 包含删除成功信息的视图名称
	 */
	@RequestMapping("/cates/delete")
	public String catesDelete(int id, Model model) {
		catesService.delete(id); // 删除指定ID的分类信息
		model.addAttribute("state", "success");
		model.addAttribute("url", "cates/cates/list");
		model.addAttribute("message", "操作成功");
		return "admin/cates/list"; // 返回包含删除成功信息的视图名称
	}

	/**
	 * 显示所有分类列表
	 * @return 包含分类列表信息的ModelAndView对象
	 */
	@RequestMapping("/cates/list")
	public ModelAndView catesList() {
		List<Cates> catesList = catesService.getAllCates(); // 查询所有分类信息并存储到模型中
		System.out.println(catesList.size());
		ModelAndView mav = new ModelAndView("admin/cates/list");
		mav.addObject("list", catesList);
		return mav; // 返回包含分类列表信息的ModelAndView对象
	}

	/**
	 * 显示编辑指定ID分类的界面
	 * @param id 要编辑的分类ID
	 * @param model 存储在视图中的数据模型
	 * @return 编辑分类的视图名称
	 */
	@RequestMapping("/cates/edit")
	public String catesEdit(String id, Model model) {
		Cates cates = catesService.getCatesById(Integer.parseInt(id)); // 根据ID查询分类信息
		model.addAttribute("model", cates); // 存储查询结果到模型中
		return "admin/cates/edit"; // 跳转到编辑分类的视图
	}

	/**
	 * 更新指定ID分类的信息
	 * @param title 分类标题
	 * @param thumb 分类缩略图
	 * @param description 分类描述
	 * @param created 创建时间
	 * @param updated 更新时间
	 * @param maxval 最大值
	 * @param minval 最小值
	 * @param pid 父级分类ID
	 * @param id 要更新的分类ID
	 * @param model 存储在视图中的数据模型
	 * @return 编辑分类的视图名称
	 */
	@RequestMapping(value = "/cates/update", method = RequestMethod.POST)
	public String catesUpdate(String title, String thumb, String description, String created, String updated, int maxval, int minval, String pid, int id, Model model) {

		Cates modelX = catesService.getCatesById(id); // 根据ID查询分类信息
		modelX.setTitle(title);
		modelX.setMinval(minval);
		modelX.setMaxval(maxval);
		modelX.setDescription(description);

		catesService.update(modelX); // 更新分类信息到数据库
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX); // 存储更新后的分类信息到模型中
		model.addAttribute("state", "success");
		model.addAttribute("url", "cates/cates/edit?id=" + id);
		model.addAttribute("message", "操作成功");
		return "admin/cates/edit"; // 跳转到编辑分类的视图
	}
}
