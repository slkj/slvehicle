package cn.slkj.clgl.role.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.role.dao.RoleMapper;
import cn.slkj.clgl.role.entity.Role;
import cn.slkj.clgl.role.service.RoleService;
import cn.slkj.util.ResultPager;

/**
 * 
 * @ClassName: RoleServiceImpl
 * @Description: 角色管理实现类
 * @author maxh
 * @date 2014年12月14日 上午10:15:24
 *
 */
@Service
public class RoleServiceImpl implements RoleService {
	private static Logger log = LoggerFactory.getLogger(RoleServiceImpl.class);

	@Autowired
	private RoleMapper mapper;

	@Override
	public ResultPager queryList(HashMap<String, Object> map) {
		List<Role> list = mapper.queryList(map);
		return new ResultPager(list.size(), list);
	}

	@Override
	public Role queryByid(Role role) {
		return mapper.queryByid(role);
	}

	@Override
	public int editRole(Role role) {
		return mapper.editRole(role);
	}

	@Override
	public int saveRole(Role role) {
		return mapper.saveRole(role);
	}

	@Override
	public int deleteRole(String[] ids) {
		return mapper.deleteRole(ids);
	}

	@Override
	public List<Role> queryByMid(String id) {
		try {
			Role role = new Role();
			role.setRoleid(id);
			return mapper.queryByMid(role);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int saveRoleRes(String mid, String[] ids) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("ids", ids);
		return mapper.saveRoleRes(map);
	}

	@Override
	public int deleteRoleRes(String mid, String[] ids) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("ids", ids);
		return mapper.deleteRoleRes(map);
	}

	@Override
	public ResultPager queryRoleListByUserId(HashMap<String, Object> map) {
		ResultPager p = new ResultPager();
		log.info("根据条件查询 {}", map.toString());
		List<Role> roles = mapper.queryRoleListByUserId(map);
		List<Role> list = mapper.queryList(map);
		int total = mapper.queryListCount(map);
		p.setRows(analyRoles(list, roles));
		p.setTotal(total);
		return p;
	}

	/**
	 * 
	 * @Title: analyRoles
	 * @Description: 解析用户所选择中的角色
	 * @param @param list
	 * @param @param roles
	 * @param @return 设定文件
	 * @return List<Role> 返回类型
	 * @throws
	 */
	private List<Role> analyRoles(List<Role> list, List<Role> roles) {
		for (int i = 0; i < roles.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if (roles.get(i).getRoleid().equals(list.get(j).getRoleid())) {
					list.get(j).setChecked(true);
				}
			}
		}
		return list;
	}

	@Override
	public int saveMemRole(HashMap<String, Object> map) {
		return mapper.saveMemRole(map);
	}

	@Override
	public int deleteMemRole(String userid, String[] ids) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("ids", ids);
		return mapper.deleteMemRole(map);
	}

}
