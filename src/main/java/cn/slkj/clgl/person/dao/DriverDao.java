/**   
 * @Title: package-info.java 
 * @Package cn.slkj.clgl.driver.dao 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author zhangtc   
 * @date 2014年12月9日 下午2:40:43 
 */
/** 
 * @ClassName: package-info 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author zhangtc
 * @date 2014年12月9日 下午2:40:43 
 *  
 */
package cn.slkj.clgl.person.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.slkj.clgl.person.entity.Driver_record;
@Repository
public interface DriverDao{
	List<Driver_record> list(HashMap<String,Object> map);
	Driver_record one(Driver_record obj);
	int total(HashMap<String,Object> map);
	int insert(Driver_record obj);
	int delete(String ids[]);
	int update(Driver_record obj);
}