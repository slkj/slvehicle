package cn.slkj.clgl.user.contorller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import cn.slkj.clgl.syslog.entity.Syslog;
import cn.slkj.clgl.syslog.service.impl.SyslogServiceImpl;
import cn.slkj.clgl.user.entity.User;
import cn.slkj.clgl.user.service.impl.UserServiceImpl;
import cn.slkj.util.JsonResult;
import cn.slkj.util.ResultPager;

/**
 * 
 * @ClassName: UserController
 * @Description: 用户信息
 * @author maxh
 * @date 2014年12月10日 上午10:23:40
 *
 */
@Controller
@RequestMapping(value = "/user")
@SessionAttributes("userSession")
public class UserController {
	private static Logger log = LoggerFactory.getLogger(UserController.class);
	@Resource
	private UserServiceImpl impl;
	@Resource
	private SyslogServiceImpl logiImpl;

	/**
	 * 个人用户type=3
	 * 
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/queryComboTreeOfUser")
	public List<User> queryTreeOfUser() {

		return impl.queryUser();
	}

	/**
	 * 统一登陆接口
	 * 
	 * @param user
	 * @param yzm
	 * @param session
	 * @param modelMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/login")
	public JsonResult login(User user, HttpSession session, ModelMap modelMap, HttpServletRequest request) {

		Syslog syslog = new Syslog();
		try {
			syslog.setIp(getIpAddr(request));
			syslog.setOperate(user.getUsername());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			syslog.setTime(df.format(new Date()));
			syslog.setType("用户登录");
//			String svcode = (String) session.getAttribute("rand");
//			if (!user.getVcode().toUpperCase().equals(svcode)) {
				User u2 = impl.queryOne(user);
				if (u2 != null) {
					modelMap.addAttribute("userSession", u2);
					log.info("用户" + u2.getUsername() + ",{}", "登录成功");
					syslog.setTitle("登录成功");
					logiImpl.save(syslog);
					return new JsonResult(true, "", u2);
				} else {
					syslog.setTitle("用户不存在！");
					logiImpl.save(syslog);
					return new JsonResult(false, "用户名或密码错误，请重新输入。");
				}
//			} else {
//				logiImpl.save(syslog);
//				return new JsonResult(false, "验证码错误！");
//			}

		} catch (Exception e) {
			e.printStackTrace();
			syslog.setTitle("登录异常");
			logiImpl.save(syslog);
			return new JsonResult(false, "登录异常！");
		}
	}

	private String getIpAddr(HttpServletRequest request) {
		String ipAddress = null;
		// ipAddress = this.getRequest().getRemoteAddr();
		ipAddress = request.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}

		}

		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
															// = 15
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		return ipAddress;
	}

	@ResponseBody
	@RequestMapping(value = "/logOffCms")
	public void logOffCms(HttpSession session) {
		try {
			if (session.getId() != null) {
				session.invalidate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		log.info("用户:{}", "退出后台管理系统");
	}

	/**
	 * 查询用户列表
	 * 
	 * @param page
	 * @param rows
	 * @param username
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/all")
	public ResultPager list(@RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "10") Integer rows, // 每页显示多少行
			String username, String cid, String local, String type, HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		// 判断 用户类型
		User user = (User) session.getAttribute("userSession");
		if (user.getType().equals("1")) {
			map.put("cid", user.getCompanyid());
		} else if (user.getType().equals("2")) {
			map.put("departcode", user.getDepartcode());
		}

		if (StringUtils.isNotBlank(type)) {
			map.put("type", type);
		}
		if (StringUtils.isNotBlank(username)) {
			map.put("username", username);
		}
		map.put("endNum", page * rows);
		map.put("startNum", (page - 1) * rows);
		return impl.queryResultPager(map);

	}

	/**
	 * 获取用户信息实体
	 * 
	 * @param classification
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryOne")
	public User queryOne(User user) {
		return impl.queryOne(user);
	}

	/** 保存用户信息 */
	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public JsonResult save(User user) throws Exception {
		try {
			int i = -1;
			if (user.getU_id().length() > 0) {
				i = impl.updata(user);
			} else {
				User u = impl.queryOne(user);
				if (u != null) {
					return new JsonResult(false, "用户已经存在，请重新填写。");
				} else {
					i = impl.save(user);
				}

			}
			if (i != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new JsonResult(false, "操作失败！");
	}

	/** 批量删除 */
	@ResponseBody
	@RequestMapping(value = "/deletes")
	public JsonResult deletes(@RequestParam(value = "ids[]") String[] ids) {
		int i = impl.deletes(ids);
		if (i > 0) {
			return new JsonResult(true, "");
		}
		return new JsonResult(false, "删除失败！");
	}

	@ResponseBody
	@RequestMapping(value = "/queryByRoleId")
	public ResultPager queryByRoleId(@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer rows, String roleid) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(roleid)) {
			map.put("roleid", roleid);

			map.put("endNum", page * rows);
			map.put("startNum", (page - 1) * rows);
			return impl.queryByRoleId(map);
		}
		return null;

	}

	@ResponseBody
	@RequestMapping(value = "/queryNotInRorle")
	public ResultPager queryNotInRorle(@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer rows, String roleid) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(roleid)) {
			map.put("roleid", roleid);

			map.put("endNum", page * rows);
			map.put("startNum", (page - 1) * rows);
			return impl.queryNotInRorle(map);
		}
		return null;

	}

	/** 批量删除 */
	@ResponseBody
	@RequestMapping(value = "/deletesByRole")
	public JsonResult deletesByRole(@RequestParam(value = "ids[]") String[] ids) {
		int i = impl.deletesByRole(ids);
		if (i > 0) {
			return new JsonResult(true, "");
		}
		return new JsonResult(false, "删除失败！");
	}

	/**
	 * 添加角色下用户
	 */
	@ResponseBody
	@RequestMapping(value = "/addUserRole")
	public JsonResult addUserRole(@RequestParam(required = false, defaultValue = "") String roleid,
			@RequestParam(value = "ids[]") String[] ids) throws Exception {
		try {
			int i = -1;
			HashMap<String, Object> map = new HashMap<String, Object>();
			if (StringUtils.isNotBlank(roleid)) {
				map.put("roleid", roleid);
				map.put("ids", ids);
				i = impl.addUserRole(map);
			}
			if (i != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new JsonResult(false, "操作失败！");
	}
}
