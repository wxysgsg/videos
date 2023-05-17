package com.app.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.app.entity.Members;
import com.app.entity.Setting;
import com.app.service.MembersService;
import com.app.service.SettingService;
/**
 * 用户登录
 * */
@Controller
@RequestMapping("/manage")
public class ManageController {

	@Resource
	MembersService ms;  // 注入MembersService实例

	// 首页
	@RequestMapping("/index")
	public String index(HttpSession session) {
		// 判断用户是否已登录，如果已登录则跳转至首页，否则跳转至登录页面
		if (session.getAttribute("userid") != null)
			return "index";
		else
			return "login";
	}

	// 退出登录
	@RequestMapping("/quit")
	public String quit(HttpSession session) {
		// 清空session中的相关信息，并重定向至首页
		session.setAttribute("logined", null);
		session.setAttribute("userid", null);
		session.setAttribute("username", null);
		session.setAttribute("usertype", null);
		return "redirect:index";

	}

	@Resource
	SettingService settingService;  // 注入SettingService实例

	// 用户登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session,
						Model model) {
		System.out.println("Username:" + username);
		System.out.println("Password:" + password);
		Members entity = new Members();
		entity.setUsername(username);  // 将用户名存储到Members对象中
		entity.setPassword(password);  // 将密码存储到Members对象中
		List<Members> list = ms.login(entity);  // 调用MembersService的login方法进行登录验证
		if (list.size() > 0) {  // 如果验证通过
			Members loginUser = list.get(0);
			if (loginUser.getJf() == null) {  // 如果该用户积分为null
				loginUser.setJf("1");  // 将积分设为1
				ms.update(loginUser);  // 更新用户信息
			}
			Integer old = Integer.parseInt(loginUser.getJf());  // 获取用户原有的积分值

			// 更新用户的积分值
			loginUser.setJf((old + 1) + "");
			ms.update(loginUser);

			Setting modelX = settingService.getSettingById(1);  // 根据id获取Setting对象
			int count = Integer.parseInt(modelX.getCount());

			// 更新网站访问次数
			modelX.setCount((count + 1) + "");
			settingService.update(modelX);

			// 向session中存储相关信息，并在前端展示相关消息
			session.setAttribute("logined", loginUser);
			session.setAttribute("userid", loginUser.getId());
			session.setAttribute("username", loginUser.getUsername());
			session.setAttribute("usertype", loginUser.getType());
			session.setAttribute("avatar", loginUser.getThumb());
			//jsp中js会进行状态的判断
			model.addAttribute("state", 1);
			model.addAttribute("message", "登录成功!正在跳转");
		} else {  // 如果验证失败
			model.addAttribute("state", 0);
			model.addAttribute("message", "登录失败，未审核或账号密码错误");
		}
		return "login";  // 返回登录页面
	}
}
