package cn.slkj.clgl.person.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.slkj.clgl.person.entity.Driver_exzm;
import cn.slkj.clgl.person.entity.Driver_record;

@Repository
public interface ExzmDao {
	List<Driver_exzm> list(HashMap<String,Object> map);
	Driver_exzm one(Driver_exzm obj);
	int total(HashMap<String,Object> map);
	int insert(Driver_exzm obj);
	int delete(String ids[]);
	int update(Driver_exzm obj);
}
