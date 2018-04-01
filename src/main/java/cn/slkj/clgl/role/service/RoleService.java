package cn.slkj.clgl.role.service;

import java.util.HashMap;
import java.util.List;

import cn.slkj.clgl.role.entity.Role;
import cn.slkj.util.ResultPager;

public interface RoleService {
	/**
	 * 
	 * @Title: queryList
	 * @Description: 分页查询角色信息
	 * @param map
	 * @return ResultPager 返回类型
	 */
	public ResultPager queryList(HashMap<String, Object> map);

	/**
	 * 
	 * @Title: queryByid
	 * @Description: 根据角色id查询
	 * @param role
	 * @return Role 返回类型
	 */
	public Role queryByid(Role role);

	/**
	 * 
	 * @Title: editRole
	 * @Description: 编辑角色信息
	 * @param role
	 * @return int 返回类型
	 */
	public int editRole(Role role);

	/**
	 * 
	 * @Title: saveRole
	 * @Description: 保存角色信息
	 * @param role
	 * @return int 返回类型
	 */
	public int saveRole(Role role);

	/**
	 * 
	 * @Title: deleteRole
	 * @Description: 删除角色数据
	 * @param ids
	 * @return int 返回类型
	 */
	public int deleteRole(String[] ids);

	/**
	 * 
	 * @Title: queryByMid
	 * @Description: 根据用户id查询角色信息
	 * @param id
	 * @return List<Role> 返回类型
	 */
	public List<Role> queryByMid(String id);

	/**
	 * 
	 * @Title: saveRoleRes
	 * @Description: 保存角色资源关系
	 * @param mid
	 * @param ids
	 * @return int 返回类型
	 */
	public int saveRoleRes(String mid, String[] ids);

	/**
	 * 
	 * @Title: deleteRoleRes
	 * @Description: 删除数据
	 * @param mid
	 * @param ids
	 * @return int 返回类型
	 */
	public int deleteRoleRes(String mid, String[] ids);

	/**
	 * 
	 * @Title: queryRoleListByMid
	 * @Description: 根据用户id查询拥有角色
	 * @param map
	 * @return ResultPager 返回类型
	 */
	public ResultPager queryRoleListByUserId(HashMap<String, Object> map);

	/**
	 * 
	 * @Title: saveMemRole
	 * @Description: 保存用户选择中角色数据
	 * @param map
	 * @return int 返回类型
	 */
	public int saveMemRole(HashMap<String, Object> map);

	/**
	 * 
	 * @Title: deleteMemRole
	 * @Description: 删除用户选择中角色数据
	 * @param mid
	 * @param ids
	 * @return int 返回类型
	 */
	public int deleteMemRole(String mid, String[] ids);
}
