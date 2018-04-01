package cn.slkj.clgl.user.service;

import java.util.HashMap;
import java.util.List;

import cn.slkj.clgl.user.entity.User;
import cn.slkj.util.ResultPager;

/**
 * 
 * @ClassName: UserService
 * @Description:用户实现接口
 * @author maxh
 * @date 2014年12月10日 上午10:30:44
 *
 */

public interface UserService {
	/**
	 * 根据个人用户 type=3的集合
	 * 
	 * @param User
	 * @return
	 */
	public List<User> queryUser();


	/**
	 * 根据条件获取用户信息实体
	 * 
	 * @param User
	 * @return
	 */
	public User queryOne(User user);

	/**
	 * 添加用户信息
	 * 
	 * @param User
	 */
	public int save(User user);

	/**
	 * 编辑用户信息
	 * 
	 * @param User
	 */
	public int updata(User user);

	/**
	 * 根据ids批量删除用户信息记录
	 * 
	 * @param ids
	 */
	public int deletes(String[] ids);

	/**
	 * 根据ids批量删除该角色下的用户信息记录
	 * 
	 * @param ids
	 */
	public int deletesByRole(String[] ids);

	/**
	 * 查询分页记录
	 * 
	 * @param map
	 * @return
	 */
	public ResultPager queryResultPager(HashMap<String, Object> map);

	/**
	 * 根据角色id查询对应的用户列表
	 * 
	 * @param map
	 * @return
	 */
	public ResultPager queryByRoleId(HashMap<String, Object> map);

	/**
	 * 根据角色id查询 没有在该角色下的用户
	 * 
	 * @param map
	 * @return
	 */
	public ResultPager queryNotInRorle(HashMap<String, Object> map);

	/**
	 * 添加角色下用户
	 * @param map
	 * @return
	 */
	public int addUserRole(HashMap<String, Object> map);

}
