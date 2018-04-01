package cn.slkj.clgl.user.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.user.dao.UserMapper;
import cn.slkj.clgl.user.entity.User;
import cn.slkj.clgl.user.service.UserService;
import cn.slkj.util.ResultPager;

/**
 * @ClassName: UserServiceImpl
 * @author maxh
 * @date 2014年10月23日 上午10:48:48
 * 
 */
@Service
public class UserServiceImpl implements UserService {

	private static Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserMapper mapper;

	@Override
	public User queryOne(User user) {
		return mapper.queryOne(user);
	}

	@Override
	public int save(User user) {
		return mapper.save(user);
	}

	@Override
	public int updata(User user) {
		return mapper.updata(user);
	}

	@Override
	public int deletes(String[] ids) {
		return mapper.deletes(ids);
	}
	@Override
	public int deletesByRole(String[] ids) {
		return mapper.deletesByRole(ids);
	}
	@Override
	public ResultPager queryResultPager(HashMap<String, Object> map) {
		return new ResultPager(mapper.queryAllCount(map), mapper.queryAll(map));
	}

	@Override
	public ResultPager queryByRoleId(HashMap<String, Object> map) {
		List<User> list = mapper.queryByRoleId(map);
		return new ResultPager(list.size(), list);
	}

	@Override
	public ResultPager queryNotInRorle(HashMap<String, Object> map) {
		List<User> list = mapper.queryNotInRorle(map);
		return new ResultPager(list.size(), list);
	}
	
	@Override
	public int addUserRole(HashMap<String, Object> map) {
		return mapper.addUserRole(map) ;
	}

	@Override
	public List<User> queryUser() {
		
		return mapper.queryUser();
	}
	
}
