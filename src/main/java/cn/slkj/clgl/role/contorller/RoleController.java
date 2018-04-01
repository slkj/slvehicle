package cn.slkj.clgl.role.contorller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.clgl.role.entity.Role;
import cn.slkj.clgl.role.service.impl.RoleServiceImpl;
import cn.slkj.util.JsonResult;
import cn.slkj.util.ResultPager;

/**
 * 
 * @ClassName: RoleController
 * @Description: 角色管理控制类
 * @author maxh
 * @date 2014年12月14日 上午10:16:51
 *
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController {
	private static Logger log = LoggerFactory.getLogger(RoleController.class);
	@Resource
	private RoleServiceImpl roleServiceImpl;

	@ResponseBody
	@RequestMapping(value = "/queryRoleList")
	public ResultPager queryMemberList(@RequestParam(required = false, defaultValue = "1") Integer page,// 第几页
			@RequestParam(required = false, defaultValue = "20") Integer rows,// 每页显示多少行
			@RequestParam(required = false, defaultValue = "") String roleName) {
		ResultPager p = new ResultPager();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(roleName)) {
			map.put("roleName", roleName);
		}
		map.put("endNum", page * rows);
		map.put("startNum", (page - 1) * rows);

		return roleServiceImpl.queryList(map);

	}

	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public JsonResult add(Role role) {
		try {
			int i = -1;
			if (role.getRoleid().length() > 0) {
				i = roleServiceImpl.editRole(role);
			} else {
				i = roleServiceImpl.saveRole(role);
			}
			if (i != -1) {
				return new JsonResult(true, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new JsonResult(false, "保存失败！");

	}

	@ResponseBody
	@RequestMapping(value = "/queryOne")
	public Role getRoleById(String id) {
		Role role = new Role();
		role.setRoleid(id);
		return roleServiceImpl.queryByid(role);
	}
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public JsonResult delete(@RequestParam(value = "ids[]") String[] ids) {
		int i = roleServiceImpl.deleteRole(ids);
		if (i > 0) {
			return new JsonResult(true, "");
		}
		return new JsonResult(false, "删除失败！");

	}

	/**
	 * 保存角色和资源之间的关系
	 * 
	 * @param member
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/saveRoleRes", method = RequestMethod.POST)
	private JsonResult intoRole(
			@RequestParam(required = false, defaultValue = "") String roleid,
			@RequestParam(value = "ids[]") String[] ids) {
		if (StringUtils.isNotBlank(roleid)) {
			roleServiceImpl.deleteRoleRes(roleid, ids);
			int i = roleServiceImpl.saveRoleRes(roleid, ids);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		}
		log.debug("{}，角色id为空");
		return new JsonResult(false, "操作失败！");
	}
	
	@ResponseBody
	@RequestMapping(value = "/queryRoleListByUserId", method = RequestMethod.POST)
	public ResultPager queryRoleListByUserId(
			@RequestParam(required = false, defaultValue = "1") Integer page,// 第几页
			@RequestParam(required = false, defaultValue = "20") Integer rows,// 每页显示多少行
			@RequestParam(required = false, defaultValue = "") String userid) {
		ResultPager p = new ResultPager();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isBlank(userid)) {
			return null;
		}
		map.put("userid", userid);
		map.put("endNum", page * rows);
		map.put("startNum", (page - 1) * rows);
		return roleServiceImpl.queryRoleListByUserId(map);

	}
	@ResponseBody
	@RequestMapping(value = "/saveUserRoles", method = RequestMethod.POST)
	private JsonResult saveUserRoles(
			@RequestParam(required = false, defaultValue = "") String userid,
			@RequestParam(value = "ids[]") String[] ids) {
		if (StringUtils.isNotBlank(userid)) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userid", userid);
			map.put("ids", ids);
			//先清除所选项角色列表，防止从多变少，数据不清楚。
			roleServiceImpl.deleteMemRole(userid, ids);
			int i = roleServiceImpl.saveMemRole(map);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		}
		return new JsonResult(false, "操作失败！");
	}
}
