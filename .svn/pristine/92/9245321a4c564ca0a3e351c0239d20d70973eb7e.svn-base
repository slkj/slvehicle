package cn.slkj.clgl.user.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.slkj.clgl.user.entity.User;

@Repository
public interface UserMapper {

	/**
	 * 查询用户是个人的信息 type=3
	 * 
	 * 
	 * @param map
	 * @return
	 */
	List<User> queryUser();
	/**
	 * 查询用户信息列表
	 * 
	 * @param map
	 * @return
	 */
	List<User> queryAll(HashMap<String, Object> map);
	int queryAllCount(HashMap<String, Object> map);
	/**
	 * 查询用户信息列表
	 * 
	 * @param map
	 * @return
	 */
	List<User> queryByRoleId(HashMap<String, Object> map);

	/**
	 * 根据角色id查询 没有在该角色下的用户
	 * 
	 * @param map
	 * @return
	 */
	List<User> queryNotInRorle(HashMap<String, Object> map);

	/**
	 * 添加用户信息
	 * 
	 * @param User
	 */
	int save(User user);

	User queryOne(User user);

	/**
	 * 根据ids批量删除用户信息记录
	 * 
	 * @param ids
	 */
	int deletes(String[] ids);

	/**
	 * 根据ids批量删除该角色下用户信息记录
	 * 
	 * @param ids
	 */
	int deletesByRole(String[] ids);

	/**
	 * 编辑用户信息
	 * 
	 * @param user
	 */
	int updata(User user);
	
	/**
	 * 添加角色下用户
	 * @param map
	 * @return
	 */
	int addUserRole(HashMap<String, Object> map);

}
