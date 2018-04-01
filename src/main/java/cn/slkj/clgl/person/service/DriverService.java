/**   
 * @Title: package-info.java 
 * @Package cn.slkj.clgl.driver.service 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author zhangtc   
 * @date 2014年12月9日 下午2:13:04 
 */
/** 
 * @ClassName: package-info 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author zhangtc
 * @date 2014年12月9日 下午2:13:04 
 *  
 */
package cn.slkj.clgl.person.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.person.dao.DriverDao;
import cn.slkj.clgl.person.entity.Driver_record;
import cn.slkj.util.ResultPager;
@Service
public class DriverService{
	@Autowired
	private DriverDao dao;
	
	public ResultPager search(HashMap<String, Object> map){
		ResultPager p=new ResultPager();
		p.setRows(dao.list(map));
		p.setTotal(dao.total(map));
		return p;}
	public Driver_record One(Driver_record d){return dao.one(d);}
	public int add(Driver_record obj){
		try{return dao.insert(obj);}catch(Exception e){e.printStackTrace();return -1;}
		}
	public int remove(String ids[]){
		try{return dao.delete(ids);}catch(Exception e){e.printStackTrace();return -1;}
		}
	public int edit(Driver_record obj){
		try{return dao.update(obj);}catch(Exception e){e.printStackTrace();return -1;}
		}
}