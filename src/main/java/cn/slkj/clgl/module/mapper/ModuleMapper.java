package cn.slkj.clgl.module.mapper;

import java.util.HashMap;
import java.util.List;

import cn.slkj.clgl.module.bean.Module;


public interface ModuleMapper {
	/**
	 * 查询资源列表
	 */
	List<Module> getAll(HashMap<String, Object> map);
	
	/**
	 * 根据角色ID查询资源列表
	 * @param map
	 * @return
	 */
	List<Module> getModuleByRoleId(HashMap<String, Object> map);
	/**
	 * 根据用户ID查询资源列表
	 * @param map
	 * @return
	 */
	List<Module> getModuleByUserid(HashMap<String, Object> map);
	/**
	 * 添加资源
	 * @param module
	 * @return
	 */
	int insert(Module module);
	/**
	 * 编辑资源
	 * @param module
	 * @return
	 */
	int update(Module module);
	/**
	 * 删除资源
	 * @param id
	 * @return
	 */
	int delete(String id);
	/**
	 * 根据ID查询资源
	 * @param id
	 * @return
	 */
	Module queryOne(String id);
	/**
	 * 查询父id 下面子节点
	 * @param parentId
	 * @return
	 */
	List<Module> getByPid(String parentId);
}
