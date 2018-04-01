package cn.slkj.clgl.role.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.slkj.clgl.role.entity.Role;

/**
 * 
* @ClassName: RoleMapper 
* @Description: 角色mapper接口
* @author maxh
* @date 2014年12月14日 上午10:14:51 
*
 */
@Repository
public interface RoleMapper {
	/**
	 * 查询用户列表
	 * 
	 * @param map
	 * @return
	 */
	
	List<Role> queryList(HashMap<String, Object> map);
	int queryListCount(HashMap<String, Object> map);
	/**
	 * 
	* @Title: queryByMid 
	* @Description: 根据用户id查询角色信息
	* @param @param Role
	* @param @return    设定文件 
	* @return Role   返回类型 
	* @throws
	 */
	List<Role>  queryByMid(Role role);
	
	/**
	 * 
	 * @Title: saveMemberRole
	 * @Description: 保存角色资源关系
	 * @param @param member
	 * @param @return 设定文件
	 * @return int 返回类型
	 * @throws
	 */
	int saveRoleRes(HashMap<String, Object> map);
	/**
	 * 
	* @Title: deleteRoleRes 
	* @Description: 删除角色授权资源数据
	* @param @param map
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws
	 */
	int deleteRoleRes(HashMap<String, Object> map);
	/**
	 * 
	* @Title: deleteRole 
	* @Description: 删除角色数据
	* @param @param ids
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws
	 */
	int deleteRole(String[] ids);
	/**
	 * 
	* @Title: saveRole 
	* @Description: 添加角色
	* @param @param role
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws
	 */
	int saveRole(Role role);
	/**
	 * 
	* @Title: queryByid 
	* @Description: 根据角色id查询
	* @param @param id
	* @param @return    设定文件 
	* @return Role    返回类型 
	* @throws
	 */
	Role queryByid(Role role);
	/**
	 * 
	* @Title: editRole 
	* @Description: 编辑角色信息
	* @param @param role
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws
	 */
	int editRole(Role role);
	/**
	 * 
	* @Title: queryRoleListByMid 
	* @Description: 根据用户id查询拥有角色
	* @param @param map
	* @param @return    设定文件 
	* @return List    返回类型 
	* @throws
	 */
	List<Role> queryRoleListByUserId(HashMap<String, Object> map);
	/**
	 * 
	* @Title: saveMemRole 
	* @Description:  保存用户选择中角色数据
	* @param @param map
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws
	 */
	int saveMemRole(HashMap<String, Object> map);
	/**
	 * 
	* @Title: deleteMemRole 
	* @Description: 删除用户选择中角色数据
	* @param @param map
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws
	 */
	int deleteMemRole(HashMap<String, Object> map);
}
