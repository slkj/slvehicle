package cn.slkj.clgl.insurance.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.slkj.clgl.driving.bean.Driving;
import cn.slkj.clgl.global.bean.Global;
import cn.slkj.clgl.insurance.entity.Insurance;
import cn.slkj.clgl.insurance.entity.InsuranceCompany;
import cn.slkj.clgl.insurance.entity.InsuranceType;
import cn.slkj.clgl.insurance.entity.Mature;

/**
 * 
 * @ClassName: InsuranceMapper
 * @Description: 保险年检接口
 * @author wangling
 * @date 2014年12月12日下午2:39:34
 */
@Repository
public interface InsuranceMapper {
	
	/**
	 * 根据条件获取保险实体
	 * @param Insurance
	 * @return
	 */
	public Insurance queryOne(Insurance insurance);
	
	/**
	 * 保存保险
	 * @param Insurance
	 */
	public int save(Insurance insurance);
	
	/**
	 * 编辑保险
	 * @param Insurance
	 */
	public int edit(Insurance insurance);
	
	/**
	 * 根据ids批量删除保险记录
	 * @param ids
	 */
	public int deletes(String[] ids);
	/**
	 * 根据id删除保险记录
	 * @param id
	 */
	public int delete(String id);

	/**
	 * 查询保险列表
	 * @param map
	 * @return
	 */
	public List<Insurance> queryList(HashMap<String, Object> map);
	
	/**
	 * 查询保险总记录数
	 * @param map
	 * @return
	 */
	public int queryListCount(HashMap<String, Object> map);
	/**
	 * 查询保险列表
	 * @param map
	 * @return
	 */
	public List<Insurance> queryList1(HashMap<String, Object> map);
	
	/**
	 * 查询保险总记录数
	 * @param map
	 * @return
	 */
	public int queryListCount1(HashMap<String, Object> map);
	
	/**
	 * 查询保险类型列表
	 * @param map
	 * @return
	 */
	public List<InsuranceType> queryAllTypeList();
	/**
	 * 查询承保单位列表
	 * @param map
	 * @return
	 */
	public List<InsuranceCompany> queryAllInsuranceCompanyList();
	/**
	 * 查询到期车辆
	 * @param map
	 * @return
	 */
	public List<Insurance> getExpires(HashMap<String, Object> map);

	public int getExpiresCount(HashMap<String, Object> map);
	/**
	 * 查询单个车辆保险记录
	 * 
	 * @param map
	 * @return
	 */
	public List<Insurance> listByVid(HashMap<String, Object> map);
	public int listByVidCount(HashMap<String, Object> map);
}
