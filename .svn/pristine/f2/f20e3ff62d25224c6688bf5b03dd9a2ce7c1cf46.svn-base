package cn.slkj.clgl.module.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.clgl.module.bean.Module;
import cn.slkj.clgl.module.service.impl.ModuleServiceImpl;
import cn.slkj.clgl.user.entity.User;
import cn.slkj.util.Tree;

@Controller
@RequestMapping("/module")
public class ModuleController {
	@Autowired
	private ModuleServiceImpl moduleServiceImpl;

	@RequestMapping(value = "/queryOne/{id}")
	@ResponseBody
	public Module queryOne(@PathVariable String id) {
		return moduleServiceImpl.queryOne(id);
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public List<Module> list() {
		return moduleServiceImpl.getAll("");
	}

	@RequestMapping(value = "/getCombotree")
	@ResponseBody
	public List<Tree> getCombotree() {
		return moduleServiceImpl.getCombotree("");
	}
	
	@RequestMapping(value = "/getCheckCombotree")
	@ResponseBody
	public List<Tree> getCheckCombotree(String roldId) {
		return moduleServiceImpl.getModuleByRoleId(roldId,"");
	}
	@RequestMapping(value = "/getModuleByUserid", method = { RequestMethod.POST })
	@ResponseBody
	public List<Module> getModuleByUserid(String userid) {
		return moduleServiceImpl.getModuleByUserid(userid,"");
	}

	@RequestMapping(value = "/addModule", method = { RequestMethod.POST })
	@ResponseBody
	public boolean addModule(Module module) {
		int i = moduleServiceImpl.insert(module);
		if (i > 0) {
			return true;
		} else {
			return false;
		}

	}

	@RequestMapping(value = "/editModule", method = { RequestMethod.POST })
	@ResponseBody
	public boolean editModule(Module module) {
		int i = moduleServiceImpl.update(module);
		if (i > 0) {
			return true;
		} else {
			return false;
		}

	}

	@RequestMapping(value = "/deleteModule/{id}")
	@ResponseBody
	public boolean deleteModule(@PathVariable String id) {
		int i = moduleServiceImpl.delete(id);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	/**
	 * 判断当前用户是否可以访问某资源
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/havePermission", method = { RequestMethod.POST })
	public boolean havePermission(String url,
			@RequestParam(required = false, defaultValue = "-1") String userid) {
		return moduleServiceImpl.havePermission(url, userid);
	}
	
	/**
	 * 查询父id 下面子节点
	 * @param pid
	 * @return
	 */
	@RequestMapping(value = "/toolbar")
	@ResponseBody
	public List<Module> toolbar(String pid,HttpSession session) {
		User user = (User) session.getAttribute("userSession");
		return moduleServiceImpl.getByPid(user.getU_id() ,pid);
	}
	
}
