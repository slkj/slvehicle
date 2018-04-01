package cn.slkj.clgl.insurance.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.insurance.dao.InsuranceMapper;
import cn.slkj.clgl.insurance.entity.Insurance;
import cn.slkj.clgl.insurance.entity.InsuranceCompany;
import cn.slkj.clgl.insurance.entity.InsuranceType;
import cn.slkj.clgl.insurance.entity.Mature;
import cn.slkj.util.ResultPager;


/**
 * 
 * @ClassName: InsuranceService
 * @Description: 保险年检方法
 * @author wangling
 * @date 2014年12月12日下午3:12:26
 */
@Service
public class InsuranceService {
	
private static Logger log = LoggerFactory.getLogger(InsuranceService.class);
	
	@Autowired
	private InsuranceMapper mapper;
	
	/**
	 * 根据条件获取保险年检实体
	 * @param Agent
	 * @return
	 */
	public Insurance queryOne(Insurance insurance) {
		log.info("查询单个信息，参数: {}", insurance.toString());
		if (insurance == null) {
			return null;
		}
		try {
			return mapper.queryOne(insurance);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 添加保险年检
	 * @param Agent
	 */
	public int save(Insurance insurance) {
		try {
			log.info("保存单个信息，参数: {}", insurance.toString());
			return mapper.save(insurance);
		} catch (Exception e) {e.printStackTrace();
			return -1;
		}
	}

	/**
	 * 编辑保险年检
	 * @param Agent
	 */
	public int edit(Insurance insurance) {
		try {
			log.info("编辑单个信息，参数: {}", insurance.toString());
			return mapper.edit(insurance);
		} catch (Exception e) {
			return -1;
		}
	}

	/**
	 * 根据ids批量删除保险年检记录
	 * @param ids
	 */
	public int deletes(String[] ids) {
		try {
			log.info("批量删除信息，参数: {}", ids);
			return mapper.deletes(ids);
		} catch (Exception e) {
			return -1;
		}
	}
	/**
	 * 根据id删除保险年检记录
	 * @param id
	 */
	public int delete(String id) {
		try {
			log.info("批量删除信息，参数: {}", id);
			return mapper.delete(id);
		} catch (Exception e) {
			return -1;
		}
	}
	
	
	/**
	 * 查询分页记录
	 * @param map
	 * @return
	 */
	public ResultPager queryResultPager(HashMap<String, Object> map) {
		log.info("查询分页类信息，参数: {}", map);
		return new ResultPager(mapper.queryListCount(map), mapper.queryList(map));
	}
	/**
	 * 查询分页记录
	 * @param map
	 * @return
	 */
	public ResultPager queryResultPager1(HashMap<String, Object> map) {
		log.info("查询分页类信息，参数: {}", map);
		return new ResultPager(mapper.queryListCount1(map), mapper.queryList1(map));
	}
	/**
	 * 查询保险类型
	 * @param map
	 * @return
	 */
	public List<InsuranceType> queryAllTypeList() {
		return  mapper.queryAllTypeList();
	}
	/**
	 * 查询承保单位
	 * @param map
	 * @return
	 */
	public List<InsuranceCompany> queryAllInsuranceCompanyList() {
		return  mapper.queryAllInsuranceCompanyList();
	}
	/**
	 * 查询到期记录
	 * 
	 * @param map
	 * @return
	 */
	public ResultPager getExpires(HashMap<String, Object> map) {
		log.info("查询分页类信息，参数: {}", map);
		return new ResultPager(mapper.getExpiresCount(map), mapper.getExpires(map));
	}
	/**
	 * 保险历史记录
	 * @param map
	 * @return
	 */
	public ResultPager listByVid(HashMap<String, Object> map) {
		return new ResultPager(mapper.listByVidCount(map), mapper.listByVid(map));
	}
}
