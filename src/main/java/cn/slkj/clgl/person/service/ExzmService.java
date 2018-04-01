package cn.slkj.clgl.person.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.person.dao.ExzmDao;
import cn.slkj.clgl.person.entity.Driver_exzm;
import cn.slkj.clgl.person.entity.Driver_record;
import cn.slkj.util.ResultPager;
@Service
public class ExzmService {
	@Autowired
	private ExzmDao dao;
	public ResultPager search(HashMap<String, Object> map){
		ResultPager p=new ResultPager();
		p.setRows(dao.list(map));
		p.setTotal(dao.total(map));
		return p;}
	public Driver_exzm One(Driver_exzm u){return dao.one(u);}
	public int add(Driver_exzm obj){
		try{return dao.insert(obj);}catch(Exception e){e.printStackTrace();return -1;}
		}
	public int remove(String ids[]){
		try{return dao.delete(ids);}catch(Exception e){e.printStackTrace();return -1;}
		}
	public int edit(Driver_exzm obj){
		try{return dao.update(obj);}catch(Exception e){e.printStackTrace();return -1;}
		}
}
