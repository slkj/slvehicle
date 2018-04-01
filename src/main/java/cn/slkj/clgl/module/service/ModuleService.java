package cn.slkj.clgl.module.service;

import java.util.List;

import cn.slkj.clgl.module.bean.Module;
import cn.slkj.util.Tree;

public interface ModuleService {

	List<Module> getAll(String parentId);

	List<Tree> getCombotree(String parentId);

	List<Tree> getModuleByRoleId(String roleId, String parentId);

	List<Module> getModuleByUserid(String userId, String parentId);

	public boolean havePermission(String url, String userid);

	int insert(Module module);

	int update(Module module);

	int delete(String id);

	Module queryOne(String id);

	List<Module> getByPid(String userId,String parentId);
}
