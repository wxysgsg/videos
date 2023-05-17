package com.app.controller;

import java.io.File;
import java.util.ArrayList;
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
@RequestMapping("/morder")
public class MorderController {
	@Resource
	MorderService morderService;

	//返回"admin/morder/add"页面的GET方法。
	@RequestMapping("/morder/add")
	public String morderAdd() {
		return "admin/morder/add";
	}

	//接收表单数据并将其存储为一个Morder对象，再通过调用MorderService的insert方法来将Morder对象插入数据库中，最后返回"admin/morder/add"页面的POST方法。
	@RequestMapping(value = "/morder/save", method = RequestMethod.POST)
	public String morderSave(String order_id, String price, String total,
			String uid, String pid, String cuid, String num, String content,
			String step, String updated, String created, String status,
			String buyer, String pname, String type, String saler,
			String shopid, String shopname, String ordersn, String y, String m,
			String d, Model model) {
		Morder modelX = new Morder();
		modelX.setOrder_id(order_id);
		modelX.setPrice(price);
		modelX.setTotal(total);
		modelX.setUid(uid);
		modelX.setPid(pid);
		modelX.setCuid(cuid);
		modelX.setNum(num);
		modelX.setContent(content);
		modelX.setStep(step);
		modelX.setUpdated(updated);
		modelX.setCreated(created);
		modelX.setStatus(status);
		modelX.setBuyer(buyer);
		modelX.setPname(pname);
		modelX.setType(type);
		modelX.setSaler(saler);
		modelX.setShopid(shopid);
		modelX.setShopname(shopname);
		modelX.setOrdersn(ordersn);
		modelX.setY(y);
		modelX.setM(m);
		modelX.setD(d);

		morderService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/morder/add";
	}

	//根据id参数删除指定的Morder对象，并重定向到/list路径。
	@RequestMapping("/morder/delete")
	public String morderDelete(int id) {
		morderService.delete(id);
		return "redirect:list";
	}

	//查询所有Morder对象，将结果添加到ModelAndView对象中，并返回"morder/list"页面。
	@RequestMapping("/list")
	public ModelAndView morderList() {
		List<Morder> morderList = morderService.getAllMorder();
		System.out.println(morderList.size());
		ModelAndView mav = new ModelAndView("morder/list");
		mav.addObject("list", morderList);
		return mav;
	}

	//查询所有Morder对象和Products对象，并按照一定规则将它们添加到List中，最后将结果添加到ModelAndView对象中，并返回"morder/list1"页面。
	@RequestMapping("/list1")
	public ModelAndView morderList1() {
		List<Morder> morderList = morderService.getAllMorder();
		int xl = 0;
		int xse = 0;
		for (Morder morder : morderList) {
			xl += Integer.parseInt(morder.getNum());
			xse += Integer.parseInt(morder.getTotal());
		}

		List<Products> list = productsService.getAllProducts();
		List<Products> list1 = new ArrayList<Products>();
		for (Products products : list) {

			List<Morder> lsx = morderService.getMorder(products.getId() + "");
			int tot = 0;
			int num = 0;
			for (Morder morder1 : lsx) {
				tot += Integer.parseInt(morder1.getTotal());
				num += Integer.parseInt(morder1.getNum());
			}
			products.setNum(num);
			products.setPrice(tot + "");

			list1.add(products);
		}

		System.out.println(morderList.size());
		ModelAndView mav = new ModelAndView("morder/list1");
		mav.addObject("list", list1);
		mav.addObject("xl", xl);
		mav.addObject("xse", xse);
		return mav;
	}

	@Resource
	ProductsService productsService;

	//查询所有Products对象和与之相关的Morder对象，将结果添加到List中，最后将结果添加到ModelAndView对象中，并返回"morder/report"页面。
	@RequestMapping("/report")
	public ModelAndView report(HttpSession sess) {
		List<Products> list = productsService.getAllProducts();
		List<Products> list1 = new ArrayList<Products>();
		for (Products products : list) {
			if (sess.getAttribute("usertype").toString().equals("2")) {
				if (!sess.getAttribute("userid").toString()
						.equals(products.getUid()))
					continue;
			}
			List<Morder> lsx = morderService.getMorder(products.getId() + "");
			int tot = 0;
			for (Morder morder1 : lsx) {
				tot += Integer.parseInt(morder1.getTotal());
			}
			products.setNum(lsx.size());
			products.setPrice(tot + "");

			list1.add(products);
		}
		ModelAndView mav = new ModelAndView("morder/report");
		mav.addObject("list", list1);
		return mav;
	}
	
	@Resource
	FavService favService;

	//查询所有Products对象和与之相关的Fav对象，将结果添加到List中，最后将结果添加到ModelAndView对象中，并返回"morder/report0"页面。
	@RequestMapping("/report0")
	public ModelAndView report0(HttpSession sess) {
		List<Products> list = productsService.getAllProducts();
		List<Products> list1 = new ArrayList<Products>();
		for (Products products : list) {
			
			List<Fav> lsx = favService.getAllFav();
			int tot = 0;
			for (Fav morder1 : lsx) {
				if(morder1.getPid().equals(products.getId()+"")) tot+=1;
			}
			products.setNum(lsx.size());
			

			list1.add(products);
		}
		ModelAndView mav = new ModelAndView("morder/report0");
		mav.addObject("list", list1);
		return mav;
	}

	//根据session中的userid参数查询指定用户的Morder对象，将结果添加到ModelAndView对象中，并返回"morder/my"页面。
	@RequestMapping("/my")
	public ModelAndView my(HttpSession session) {
		int uid = Integer.parseInt(session.getAttribute("userid").toString());
		List<Morder> morderList = morderService.getMorderByUid(uid);
		System.out.println(morderList.size());
		ModelAndView mav = new ModelAndView("morder/my");
		mav.addObject("list", morderList);
		return mav;
	}

	//根据id参数查询指定的Morder对象，并将其step属性更新为step参数，最后返回指定的ret页面。
	@RequestMapping("/state")
	public String state(Model model, HttpSession session, Integer id,
			String ret, int step) {
		Morder modelX = morderService.getMorderById(id);
		modelX.setStep(step + "");
		morderService.update(modelX);
		model.addAttribute("message", "操作成功");
		return "morder/" + ret;
	}

	//根据id参数查询指定的Morder对象，并将其step和ordersn属性更新为step和ordersn参数，最后返回指定的ret页面。
	@RequestMapping("/state2")
	public String state2(Model model, HttpSession session, Integer id,
			String ordersn, String ret, int step) {
		Morder modelX = morderService.getMorderById(id);
		modelX.setStep(step + "");
		modelX.setOrdersn(ordersn);
		morderService.update(modelX);
		model.addAttribute("message", "操作成功");
		return "morder/" + ret;
	}

	//根据id参数查询指定的Morder对象，并将其添加到Model对象中，最后返回"admin/morder/pay"页面。
	@RequestMapping("/pay")
	public String pay(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "admin/morder/pay";
	}

	//根据id参数查询指定的Morder对象，并将其添加到Model对象中，最后返回"morder/pj"页面。
	@RequestMapping("/pj")
	public String pj(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "morder/pj";
	}

	//根据id参数查询指定的Morder对象，并将其添加到Model对象中，最后返回"morder/fq"页面。
	@RequestMapping("/fq")
	public String fq(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "morder/fq";
	}

	//根据id参数查询指定的Morder对象，并将其添加到Model对象中，最后返回"admin/morder/edit"页面的GET方法。
	@RequestMapping("/morder/edit")
	public String morderEdit(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "admin/morder/edit";
	}

	//接收表单数据并将其存储为一个Morder对象，再通过调用MorderService的update方法来更新数据库中的Morder对象，最后返回"morder/pj"页面的POST方法。
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String morderUpdate(String order_id, String price, String total,
			String uid, String pid, String cuid, String num, String content,
			String step, String updated, String created, String status,
			String buyer, String pname, String type, String saler,
			String shopid, String shopname, String ordersn, String y, String m,
			String d, int id, Model model) {

		Morder modelX = morderService.getMorderById(id);

		modelX.setContent(content);

		morderService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "评价成功");
		return "morder/pj";
	}
}
