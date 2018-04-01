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

import cn.slkj.clgl.person.dao.UnitDao;
import cn.slkj.clgl.person.entity.Server_unit;
import cn.slkj.util.ResultPager;
@Service
public class UnitService{
	@Autowired
	private UnitDao dao;
	
	public ResultPager search(HashMap<String,Object> map){
		ResultPager p=new ResultPager();
		p.setRows(dao.list(map));
		p.setTotal(dao.total(map));
		return p;}
	public Server_unit One(Server_unit u){return dao.one(u);}
	public Server_unit OneByCard(HashMap<String,Object> map){return dao.onebycard(map);}
	public int add(Server_unit obj){
		try{return dao.insert(obj);}catch(Exception e){e.printStackTrace();return -1;}
		}
	public int remove(String ids[]){
		try{return dao.delete(ids);}catch(Exception e){e.printStackTrace();return -1;}
		}
	public int edit(Server_unit obj){
		try{return dao.update(obj);}catch(Exception e){e.printStackTrace();return -1;}
		}
}