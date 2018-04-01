package cn.slkj.clgl.secondInsurance.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.insurance.entity.Mature;
import cn.slkj.clgl.secondInsurance.dao.SecondInsuranceMapper;
import cn.slkj.clgl.secondInsurance.entity.SecondInsurance;
import cn.slkj.util.ResultPager;


/**
 * 
 * @ClassName: InsuranceService
 * @Description: 二保方法
 * @author wangling
 * @date 2014年12月12日下午3:12:26
 */
@Service
public class SecondInsuranceService {
	
private static Logger log = LoggerFactory.getLogger(SecondInsuranceService.class);
	
	@Autowired
	private SecondInsuranceMapper mapper;
	
	/**
	 * 根据条件获取二保实体
	 * @param Agent
	 * @return
	 */
	public SecondInsurance queryOne(SecondInsurance secondInsurance) {
		log.info("查询单个信息，参数: {}", secondInsurance.toString());
		if (secondInsurance == null) {
			return null;
		}
		try {
			return mapper.queryOne(secondInsurance);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 添加二保
	 * @param Agent
	 */
	public int save(SecondInsurance secondInsurance) {
		try {
			log.info("保存单个信息，参数: {}", secondInsurance.toString());
			return mapper.save(secondInsurance);
		} catch (Exception e) {
			return -1;
		}
	}

	/**
	 * 编辑二保
	 * @param Agent
	 */
	public int edit(SecondInsurance secondInsurance) {
		try {
			log.info("编辑单个信息，参数: {}", secondInsurance.toString());
			return mapper.edit(secondInsurance);
		} catch (Exception e) {
			return -1;
		}
	}

	/**
	 * 根据ids批量删除二保记录
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
	 * 根据id删除二保记录
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
