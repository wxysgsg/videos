package com.app.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.app.entity.Cart;
import com.app.entity.Category;
import com.app.entity.Comment;
import com.app.entity.Fav;
import com.app.entity.Infocate;
import com.app.entity.Members;
import com.app.entity.Morder;
import com.app.entity.News;
import com.app.entity.Products;
import com.app.entity.Setting;
import com.app.func.map_mix;
import com.app.func.novelty;
import com.app.func.similarity;
import com.app.func.handle.sort;
import com.app.service.AdsService;
import com.app.service.CategoryService;
import com.app.service.CommentService;
import com.app.service.FavService;
import com.app.service.InfocateService;
import com.app.service.MembersService;
import com.app.service.MorderService;
import com.app.service.NewsService;
import com.app.service.ProductsService;
import com.app.service.SettingService;
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/app")
public class AppController {

	//自动注入MembersService、SettingService、CategoryService、AdsService、ProductsService对象
	@Resource
	MembersService ms;
	@Resource
	SettingService settingService;
	@Resource
	CategoryService categoryService;
	@Resource
	AdsService adsService;
	@Resource
	ProductsService productsService;

	//获取新闻页面信息
	@RequestMapping("/news")
	public String news(String cateId, String key, Model model) {

		//获取所有随机推荐的新闻信息
		List<News> blTj = nService.getNewsRand2();
		//获取所有新闻信息
		List<News> nList = nService.getAllNews();
		Infocate cate = null;

		if (cateId != null) {
			//获取指定分类id下的新闻信息
			nList = nService.getNewsByCateId(Integer.parseInt(cateId));
			// blTj = nService.getNewsRand(Integer.parseInt(cateId));
			//获取指定分类id的Infocate对象
			cate = cService.getInfocateById(Integer.parseInt(cateId));
		}

		if (key != null) {
			//将关键字进行编码
			// key = MainUtils.encode(key);
			//获取包含指定关键字的新闻信息
			key = "%" + key + "%";
			nList = nService.getNewsLike(key);
		}

		//为每个新闻对象设置其所属分类Infocate对象
		for (News news : nList) {
			news.setCate(cService.getInfocateById(Integer.parseInt(news
					.getUid())));
		}

		model.addAttribute("cate1", cate);
		model.addAttribute("cList", nList);

		//获取分类列表信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			//为每个分类对象设置其包含的产品、子分类等信息
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		//返回视图名，使DispatcherServlet能够找到对应的ViewResolver进行解析
		return "app/news";
	}

	/**
	 * 显示榜单详情页面
	 * @param session 当前用户session对象
	 * @param model 存储当前请求所需数据的容器
	 * @return 页面路径
	 */
	@RequestMapping("/suggest")
	public String rank(HttpSession session, Model model) {
		//获取网站全局设置信息，并添加到model中
		model.addAttribute("site", settingService.getSettingById(1));

		//获取一级分类列表，并为每个分类对象设置其包含的子分类信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		//获取所有产品列表
		List<Products> list = productsService.getAllProducts();

		//为每个产品对象设置其销量信息和价格信息
		for (Products products : list) {
			List<Morder> os = morderService.getMorder(products.getId() + "");
			List<Morder> os1 = new LinkedList<Morder>();
			int price = 0;

			// products.setPrice(price+"");
			products.setList(os);
		}

		//对所有产品进行排序，按照销量降序排列
		Collections.sort(list, new Comparator<Products>() {
			public int compare(Products o1, Products o2) {
				return o2.getList().size() - o1.getList().size();
			}
		});

		//将排序后的产品列表添加到model中，并返回页面路径，使DispatcherServlet能够找到对应的ViewResolver进行解析
		model.addAttribute("list", list);
		return "app/rank";
	}

	@Resource
	InfocateService cService;
	@Resource
	NewsService nService;

	/**
	 * 显示新闻资讯的详细信息页面
	 * @param id 新闻资讯id
	 * @param model 存储当前请求所需数据的容器
	 * @return ModelAndView包含页面路径和数据
	 */
	@RequestMapping("/view")
	public ModelAndView view(int id, Model model) {
		//创建包含页面路径的ModelAndView对象
		ModelAndView mav = new ModelAndView("app/view");

		//获取指定id的新闻资讯对象，将其点击量加1，并更新到数据库中
		News article = nService.getNewsById(id);
		article.setClick((Integer.parseInt(article.getClick()) + 1) + "");
		nService.update(article);

		//将新闻资讯对象添加到model中
		model.addAttribute("art", article);

		//获取一级分类列表，并为每个分类对象设置包含的产品列表和子分类列表信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		//获取资讯分类列表，并添加到model中
		model.addAttribute("cates1", cService.getAllInfocate());

		return mav;
	}

	/**
	 * 显示网站首页
	 * @param session 当前用户session对象
	 * @param model 存储当前请求所需数据的容器
	 * @return 页面路径
	 */
	@RequestMapping("/index")
	public String index(HttpSession session, Model model) {
		//获取全局设置信息，并添加到model中
		model.addAttribute("site", settingService.getSettingById(1));

		//获取一级分类列表，并为每个分类对象设置包含的产品列表和子分类列表信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		//获取所有产品列表，并添加到model中
		model.addAttribute("all", productsService.getAllProducts());

		//获取所有广告列表，并添加到model中
		model.addAttribute("ads", adsService.getAllAds());

		return "app/index";
	}

	/**
	 * 显示公告列表页面
	 * @param session 当前用户session对象
	 * @param model 存储当前请求所需数据的容器
	 * @return 页面路径
	 */
	@RequestMapping("/notice")
	public String notice(HttpSession session, Model model) {
		//获取全局设置信息，并添加到model中
		model.addAttribute("site", settingService.getSettingById(1));

		//获取一级分类列表，并为每个分类对象设置包含的产品列表和子分类列表信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		//获取所有广告列表，并添加到model中
		model.addAttribute("ads", adsService.getAllAds());

		return "app/notice";
	}

	/**
	 * 显示商品分类列表页面
	 * @param session 当前用户session对象
	 * @param model 存储当前请求所需数据的容器
	 * @param id 商品分类id
	 * @return 页面路径
	 */
	@RequestMapping("/categoies")
	public String categoies(HttpSession session, Model model, Integer id) {
		//获取全局设置信息，并添加到model中
		model.addAttribute("site", settingService.getSettingById(1));

		//获取一级分类列表，并为每个分类对象设置包含的产品列表和子分类列表信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		//将所有产品对象添加到model中
		model.addAttribute("list", productsService.getAllProducts());

		//如果传入了商品分类id，则获取指定id的分类信息和该分类下的所有产品列表，并加入model中
		if(id != null) {
			model.addAttribute("cate", categoryService.getCategoryById(id));
			model.addAttribute("list", productsService.getProductsByCate(id));
		}

		return "app/categoies";
	}

	/**
	 * 显示精品推荐页面
	 * @param session 当前用户session对象
	 * @param model 存储当前请求所需数据的容器
	 * @param id 商品分类id
	 * @return 页面路径
	 */
	@RequestMapping("/best")
	public String best(HttpSession session, Model model, Integer id) {
		//获取全局设置信息，并添加到model中
		model.addAttribute("site", settingService.getSettingById(1));

		//获取一级分类列表，并为每个分类对象设置包含的产品列表和子分类列表信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		//获取随机商品列表，并添加到model中
		List<Products> ls = productsService.getRand();
		model.addAttribute("list", ls);

		return "app/best";
	}

	/**
	 * 显示商品详细信息页面
	 * @param session 当前用户session对象
	 * @param model 存储当前请求所需数据的容器
	 * @param id 商品id
	 * @return 页面路径
	 */
	@RequestMapping("/detail")
	public String detail(HttpSession session, Model model, Integer id) {
		//获取全局设置信息，并添加到model中
		model.addAttribute("site", settingService.getSettingById(1));

		//获取一级分类列表，并为每个分类对象设置包含的产品列表和子分类列表信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		//检查当前用户是否已收藏该商品
		boolean faved = false;
		if (session.getAttribute("userid") != null) {
			String uid = session.getAttribute("userid").toString();
			Fav f = new Fav();
			f.setPid(id.toString());
			f.setUid(uid);
			List<Fav> list = favService.getFav2(f);
			if (list.size() > 0)
				faved = true;
		}
		model.addAttribute("faved", faved);

		//获取商品信息对象，将其点击量加1，并更新到数据库中
		Products p = productsService.getProductsById(id);
		if(p.getClick()==null) p.setClick("0");
		p.setClick((Integer.parseInt(p.getClick())+1)+"");
		productsService.update(p);

		//将商品对象和随机商品列表添加到model中
		model.addAttribute("g", p);
		model.addAttribute("list", productsService.getProductsRand());

		return "app/detail";
	}

	@Resource
	FavService favService;

	/**
	 * 取消收藏，从用户收藏列表中删除指定商品
	 * @param session 当前用户session对象
	 * @param id 商品id
	 * @return 重定向到商品详细信息页面
	 */
	@RequestMapping("/fav1")
	public String favDelete(Integer id, HttpSession session) {
		String uid = session.getAttribute("userid").toString();
		Fav f = new Fav();
		f.setPid(id.toString());
		f.setUid(uid);
		List<Fav> list = favService.getFav2(f);
		favService.delete(list.get(0).getId());
		return "redirect:detail?id=" + id;
	}

	/**
	 * 收藏商品
	 * @param session 当前用户session对象
	 * @param model 存储当前请求所需数据的容器
	 * @param id 商品id
	 * @return 商品详细信息页面路径
	 */
	@RequestMapping("/fav")
	public String fav(HttpSession session, Model model, Integer id) {
		String uid = session.getAttribute("userid").toString();

		Fav f = new Fav();
		f.setPid(id.toString());
		f.setUid(uid);
		List<Fav> list = favService.getFav2(f);

		if (list.size() > 0) {
			model.addAttribute("message", "你已经收藏过了");

		} else {
			Fav m = new Fav();
			m.setPid(id + "");
			m.setUid(uid + "");
			favService.insert(m);
			model.addAttribute("message", "收藏成功");
		}
		model.addAttribute("id", id);
		return "app/detail";
	}

	/**
	 * 显示购物车页面
	 * @param session 当前用户session对象
	 * @param model 存储当前请求所需数据的容器
	 * @return 购物车页面路径
	 */
	@RequestMapping("/cart")
	public String cart(HttpSession session, Model model) {
		//获取一级分类列表，并为每个分类对象设置包含的产品列表和子分类列表信息
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

		return "app/cart";
	}

	/**
	 * 为session添加购物车总价属性
	 * @param session 当前用户session对象
	 */
	public void setTotal(HttpSession session) {
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		int total = 0;
		for (Cart cart : list) {
			total += Integer.parseInt(cart.getP().getPrice()) * cart.getNum();
		}
		session.setAttribute("cartTotal", total);
	}

	/**
	 * 商品搜索
	 * @param model 存储当前请求所需数据的容器
	 * @param q 查询关键字
	 * @return 商品搜索结果页面路径
	 */
	@RequestMapping("/search")
	public String search(Model model, String q) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);
		// q = MainUtils.encode(q);
		model.addAttribute("list", productsService.search("%" + q + "%"));
		return "app/search";
	}

	@Resource
	MembersService membersService;

	/**
	 * 用户注册
	 * @param username 用户名
	 * @param password 密码
	 * @param sex 性别
	 * @param birthday 生日
	 * @param address 地址
	 * @param email 邮箱
	 * @param qq QQ号码
	 * @param tel 手机号码
	 * @param money 钱包余额
	 * @param thumb 头像
	 * @param grade 等级
	 * @param type 类型
	 * @param created 创建时间
	 * @param updated 修改时间
	 * @param status 状态
	 * @param jf 积分
	 * @param age 年龄
	 * @param maincontent 主要内容
	 * @param description 描述
	 * @param model 存储当前请求所需数据的容器
	 * @return 注册页面路径
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(String username, String password, String sex,
						 String birthday, String address, String email, String qq,
						 String tel, String money, String thumb, String grade, String type,
						 String created, String updated, String status, String jf,
						 String age, String maincontent, String description, Model model) {
		Members modelX = new Members();

		List<Members> ls = membersService.getAllMembers();
		boolean check = false;
		for (Members members : ls) {
			if (members.getUsername().equals(username))
				check = true;
		}
		if (!check) {
			modelX.setUsername(username);
			modelX.setPassword(password);
			modelX.setSex(sex);
			modelX.setBirthday(birthday);
			modelX.setAddress(address);
			modelX.setEmail(email);
			modelX.setQq(qq);
			modelX.setTel(tel);
			modelX.setMoney(money);
			modelX.setGrade(grade);
			modelX.setType(type);
			modelX.setCreated(MainUtils.getTime());
			modelX.setUpdated(updated);
			modelX.setStatus(status);
			modelX.setJf(jf);
			modelX.setAge(age);
			modelX.setMaincontent(maincontent);
			modelX.setDescription(description);

			membersService.insert(modelX);
			model.addAttribute("inpost", true);
			model.addAttribute("message", "账号注册成功!");
		} else {
			membersService.insert(modelX);
			model.addAttribute("inpost", true);
			model.addAttribute("message", "用户名被占用!");
		}
		return "app/sign";
	}

	//调用API接口将输入的字符串进行分词
	private List<String> getSplitFromApi(String str) {
		ArrayList<String> splitResult = new ArrayList<String>();
		str = URLEncoder.encode(str);
		String url = "http://api.yesapi.cn/?service=App.Scws.GetWords&text="
				+ str
				+ "&app_key=CEE4B8A091578B252AC4C92FB4E893C3&sign=CB7602F3AC922808AF5D475D8DA33302";
		url = "http://api.pullword.com/get.php?source=" + str
				+ "&param1=0&param2=1&json=0";
		String res = MainUtils.doGetStr1(url);
		if (res.trim().length() > 0) {
			String arr[] = res.split("\r\n");
			if (arr.length > 0) {
				for (String string : arr) {
					String realStr = string.substring(0,
							string.lastIndexOf(":"));
					splitResult.add(realStr);
				}
			}

		}
		return splitResult;
	}

	@RequestMapping("/foru")
	public String foru(Model model, HttpSession sess) throws Exception {
		Integer uid = Integer.parseInt(sess.getAttribute("userid").toString());
		similarity sim = new similarity();

		// 获取用户购买LIST<产品名称>
		ArrayList<String> userBuyedList = new ArrayList<String>();
	
		List<Fav> favList = favService.getFav1(uid);

		for (Fav fav : favList) {
			Products p = productsService.getProductsById(Integer.parseInt(fav.getPid()));
			String str = p.getProduct_name();
			userBuyedList.addAll(this.getSplitFromApi(str));
		}

		// 获取全部产品LIST<产品名称>
		Map<Integer, Double> simList = new HashMap<Integer, Double>();// 存放计算的相似值
		List<Products> productList = productsService.getAllProducts();
		// 把全部产品的name进行一个分词 为List 和用户已经购买的List<Name>进行相似度计算
		for (Products product : productList) {
			double real = 0f;
			List<String> arr = this.getSplitFromApi(product.getProduct_name());
			for (String string : arr) {
				ArrayList<String> compareItems = new ArrayList<String>();
				compareItems.add(string);
				real += sim.getSimilarDegree(compareItems, userBuyedList);
				;
				System.out.println("当前分词：" + string + ",相似度:" + real);

			}

			simList.put(product.getId(), real);
			System.out.println("项目：" + product.getProduct_name() + "最终相似度："
					+ real);
		}
		List<Map.Entry<Integer, Double>> sortList = new ArrayList<Map.Entry<Integer, Double>>(
				simList.entrySet());

		// 对value进行排序
		Collections.sort(sortList,
				new Comparator<Map.Entry<Integer, Double>>() {
					@Override
					public int compare(Map.Entry<Integer, Double> o1,
							Map.Entry<Integer, Double> o2) {
						return (o2.getValue()).toString().compareTo(
								o1.getValue().toString());
					}

				});
		//根据相似度排序  获取项目
		List<Products> list = new ArrayList<Products>();
		for (Map.Entry<Integer, Double> item : sortList) {
			if (item.getValue() > 0)
				list.add(productsService.getProductsById(item.getKey()));
		}

		
		//推荐项目传到视图
		model.addAttribute("list", list);
		//菜单栏
		model.addAttribute("cates", this.getMenu());
		
		return "app/categoies";
	}

	public List<Category> getMenu() {
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		return cates;
	}

	public void foru1() {
		// similarity sim=new similarity();
		// DisDAO disdao=new DisDAO();
		// SimDAO simdao=new SimDAO();

		int id = 1;

		similarity sim = new similarity();
		map_mix mix = new map_mix();

		// 已经购买的ID
		String likeId[] = new String[] {};// 表单传来的已选择的视频的ID

		ArrayList<String> likeList = new ArrayList<String>();// 转换成动态数据int型
		for (int i = 0; i < likeId.length; i++) {
			likeList.add(likeId[i] + "");
		}

		int userid = 1;// 表单传来的选择视频的用户的id
		Members me = membersService.getMembersById(userid);
		ArrayList<String> str1 = new ArrayList<String>();// 这个作为用户的向量空间.

		List<Products> productsList = productsService.getAllProducts();
		ArrayList<String> userLikes = new ArrayList<String>();
		ArrayList<String> allLists = new ArrayList<String>();
		for (Products p : productsList) {
			allLists.add(p.getId() + "");
		}

		// str1=simdao.getUserVector(userid);//得到这个用户的向量空间
		Map<String, double[]> vectorSpace = new HashMap<String, double[]>();
		vectorSpace = mix.mapMix(vectorSpace, sim.getVector(likeList, 0));

		Map<Integer, Double> simList = new HashMap<Integer, Double>();// 存放计算的相似值
		for (int i = 0; i < 1000; i++) {// 在这里修改总共对比的条数

			/*
			 * double res=sim.getSimilarDegree(vectorSpace,
			 * sim.getVector(allLists,1)); if(!Double.isNaN(res)) {
			 * simList.put((Integer) disdao.idlist.get(i), res); }
			 */
			// System.out.println(res);
		}

		/*
		 * 对map进行排序取前十
		 */
		List<Map.Entry<Integer, Double>> infoIds = new ArrayList<Map.Entry<Integer, Double>>(
				simList.entrySet());
		// 对value进行排序
		Collections.sort(infoIds, new Comparator<Map.Entry<Integer, Double>>() {
			@Override
			public int compare(Map.Entry<Integer, Double> o1,
					Map.Entry<Integer, Double> o2) {
				return (o2.getValue()).toString().compareTo(
						o1.getValue().toString());
			}

		});

		List<Map.Entry<Integer, Double>> novel = novelty.getRes(novelty
				.getNovelty(id));
		/*
		 * 给用户添加新颖度
		 */
		for (int i = 0; i < 20 - novel.size(); i++) {
			// / 。。 infoIds.add(infoId.get(i));
		}
		for (int i = 0; i < novel.size(); i++) {
			// infoIds.add(novel.get(i));
		}

	}

	public static List<Map.Entry<Integer, Double>> getRes(
			Map<Integer, Double> res) {
		return sort.sortRes(res);
	}

	public Map<Integer, Double> getNovelty(int id,
			ArrayList<Integer> userLikeList) {

		Map<Integer, Double> res = new HashMap<Integer, Double>();
		// ArrayList<Integer> userLikeList=likedao.queryLike(id);
		List<Products> idlist = productsService.getAllProducts();

		/*
		 * 用随机数生成 while循环判断,如果已经在用户喜欢列表里呢就重新生成一个 当生成了2个了就退出.
		 */
		int min = 0;

		int max = idlist.size();
		boolean flag = true;
		while (flag) {
			int num = min + (int) (Math.random() * (max - min + 1));
			int tmp = Integer.parseInt(idlist.get(num).toString());
			if (!userLikeList.contains(tmp)) {
				res.put(tmp, 0.0);
			}
			if (res.size() == 2)
				flag = false;
		}

		return res;
	}

	@RequestMapping("/sign")
	public String sign(Model model) {
// 获取网站设置并加入模型
		model.addAttribute("site", settingService.getSettingById(1));
// 获取所有一级分类及其商品，并加入模型
		List<Category> cates = categoryService.getCategoryByCate(0);
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
			category.setSubs(categoryService.getCategoryByCate(category.getId()));
		}
		model.addAttribute("cates", cates);

// 获取随机商品列表并加入模型
		model.addAttribute("list", productsService.getProductsRand());
		return "app/sign";
	}

	@Resource
	CommentService commentService;

	@RequestMapping("/feedback")
	public String feedback(Model model) {
// 获取网站设置并加入模型
		model.addAttribute("site", settingService.getSettingById(1));
// 获取所有分类并加入模型
		List<Category> cates = categoryService.getAllCategory();
		model.addAttribute("cates", cates);

// 调用getAll方法获取所有评论列表并转换为HTML格式，存入模型
		List<Comment> ls = this.getAll(0);
		System.out.println("S:" + ls.size());
		model.addAttribute("html", this.getHtml(ls, 0));
		model.addAttribute("list", ls);
		return "app/feedback";
	}

	public static String[] arr = new String[] { "info", "primary", "danger",
			"success", "warning" };

	public String getHtml(List<Comment> ls, int level) {
		String html = "";
		for (Comment comment : ls) {
			Random r = new Random();
			String item = "<div style='margin-left:" + level
					+ "px' class='alert alert-" + arr[r.nextInt(4)] + "'>";
			item += "<h5><span class='label label-" + arr[r.nextInt(4)] + "'>"
					+ comment.getUpdated() + "</span>/" + comment.getCreated()
					+ "发布</h5>";
			item += "<p>" + comment.getContent() + "</p>";
			item += "<a class='btn btn-link' href='javascript:;' onclick=javascript:show("
					+ comment.getId() + ") >回复</a>";
			item += this.getHtml(comment.getSubs(), level * 30);
			item += "</div>";
			html += item;

		}
		return html;
	}

	public List<Comment> getAll(int mid) {
		List<Comment> ls = commentService.getCommentByPID(mid);
		for (Comment comment : ls) {
			comment.setSubs(this.getAll(comment.getId()));
		}
		return ls;
	}

	@RequestMapping("/comment")
	public String comment(HttpSession session, Model model, String content,
			String mid, HttpServletRequest req) {
		if (session.getAttribute("username") == null) {
			return "redirect:/manage/index";
		}
		if (!mid.equals("0")) {
			content = "<span style='color:#c00'>@回复：</span>" + content;
		}

		Comment modelX = new Comment();
		modelX.setUid(session.getAttribute("userid").toString());
		modelX.setContent(content);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(session.getAttribute("username").toString());
		modelX.setMid(mid);

		commentService.insert(modelX);
		model.addAttribute("message", "感谢您的留言，我们将尽快与您联系");
		return "app/feedback";

	}

	@Resource
	MorderService morderService;

	@RequestMapping("/submit")
	public String submit(HttpSession session, Model model, String q,
			HttpServletRequest req) {
		if (session.getAttribute("username") == null) {
			return "redirect:/manage/index";
		}
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		for (Cart cart : list) {
			Morder obj = new Morder();
			obj.setUid(session.getAttribute("userid").toString());
			obj.setBuyer(session.getAttribute("username").toString());
			obj.setPid(cart.getP().getId() + "");
			obj.setPname(cart.getP().getProduct_name());
			obj.setCreated(MainUtils.getTime());
			obj.setStep("1");
			obj.setNum(cart.getNum() + "");
			obj.setPrice(cart.getP().getPrice());
			obj.setTotal(cart.getTotal() + "");

			int uid = Integer.parseInt(cart.getP().getUid());
			Members sale = membersService.getMembersById(uid);
			obj.setShopid(sale.getId() + "");
			obj.setShopname(sale.getUsername() + "/" + sale.getAddress());
			Members loginUser = membersService.getMembersById(Integer
					.parseInt(session.getAttribute("userid").toString()));

			if (loginUser.getJf() == null) {
				loginUser.setJf("1");
				ms.update(loginUser);
			}
			Integer old = Integer.parseInt(loginUser.getJf());

			loginUser.setJf((old + 5) + "");
			ms.update(loginUser);
			session.setAttribute("logined", loginUser);

			morderService.insert(obj);
			model.addAttribute("message", "购物成功..");
		}
		session.setAttribute("cart", null);
		session.setAttribute("cartTotal", 0);
		return "app/cart";
	}

	/**
	 修改购物车中商品数量
	 @param session 存储用户会话信息的Session对象
	 @param model 存储在视图中的数据模型
	 @param index 商品在购物车集合中的索引
	 @param type 修改类型，1表示减少数量，2表示增加数量
	 @return 重定向到购物车页面
	 */
	@RequestMapping("/change")
	public String change(HttpSession session, Model model, Integer index,
			Integer type) {
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		int ix = 0;
		for (Cart cart : list) {
			if (index == ix) {
				if (type == 1) {
					int num = cart.getNum();
					num = num - 1;
					num = num > 0 ? num : 1;
					cart.setNum(num);
					cart.setTotal(num
							* Integer.parseInt(cart.getP().getPrice()));
				}
				if (type == 2) {
					int num = cart.getNum();
					num = num + 1;
					cart.setNum(num);
					cart.setTotal(num
							* Integer.parseInt(cart.getP().getPrice()));
				}
			}
			ix++;
		}
		session.setAttribute("cart", list);
		this.setTotal(session);
		return "redirect:cart";
	}

	/**
	 从购物车中删除商品
	 @param session 存储用户会话信息的Session对象
	 @param model 存储在视图中的数据模型
	 @param index 要被删除的商品在购物车集合中的索引
	 @return 重定向到购物车页面
	 */
	@RequestMapping("/remove")
	public String remove(HttpSession session, Model model, Integer index) {
		List<Cart> cartList = (List<Cart>) session.getAttribute("cart");
		List<Cart> newCartList = new LinkedList<Cart>();
		int pointer = 0;
		for (Cart cart : cartList) {
			if (index == pointer) {
				pointer++;
				continue;
			}
			pointer++;
			newCartList.add(cart);
		}
		session.setAttribute("cart", newCartList);
		this.setTotal(session);
		return "redirect:cart";
	}

	/**
	 添加商品到购物车
	 @param session 存储用户会话信息的Session对象
	 @param model 存储在视图中的数据模型
	 @param id 商品ID
	 @param num 购买数量
	 @return 重定向到购物车页面
	 */
	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
	public String addcart(HttpSession session, Model model, Integer id,
			Integer num) {
		if (session.getAttribute("usertype") != null) {
			String usertype = session.getAttribute("usertype").toString();
			if (!usertype.equals("3")) {

				List<Cart> list = (List<Cart>) session.getAttribute("cart");
				Integer total = (Integer) session.getAttribute("cartTotal");
				Products ps = productsService.getProductsById(id);
				Cart ct = new Cart();
				ct.setP(ps);
				ct.setNum(num);
				ct.setTotal(ct.getNum() * Integer.parseInt(ps.getPrice()));

				if (list == null) {
					list = new LinkedList<Cart>();
					list.add(ct);
					total = 0;
				} else {
					boolean exist = false;
					for (Cart cart : list) {
						if (cart.getP().getId() == id) {
							exist = true;
							cart.setNum(num + cart.getNum());
							cart.setTotal(Integer.parseInt(cart.getP()
									.getPrice()) * cart.getNum());
							total += Integer.parseInt(cart.getP().getPrice())
									* cart.getNum();
						}
					}
					if (!exist) {
						list.add(ct);
						total += ct.getNum()
								* Integer.parseInt(ct.getP().getPrice());
					}
				}

				session.setAttribute("cart", list);
				this.setTotal(session);
				return "redirect:cart";
			} else {
				model.addAttribute("message", "当前用户类型不许购买！");
				return "app/message";
			}
		} else {
			model.addAttribute("message", "请您登录！");
			return "app/message";
		}
	}

}
