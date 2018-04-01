package cn.slkj.clgl.company.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.company.bean.Company;
import cn.slkj.clgl.company.mapper.CompanyMapper;
import cn.slkj.util.ResultPager;

/**
 * @ClassName: AgentService
 * @Description: 公司/车队信息
 * @author maxh
 * @date 2014年10月24日 下午2:47:33
 * 
 */
@Service
public class CompanyService {

	private static Logger log = LoggerFactory.getLogger(CompanyService.class);

	@Autowired
	private CompanyMapper mapper;

	/**
	 * 查询公司/车队列表
	 * 
	 * @param map
	 * @return
	 */
	public List<Company> queryComList(HashMap<String, Object> map) {
		return mapper.queryComList(map);
	}

	/**
	 * 查询分页记录
	 * 
	 * @param map
	 * @return
	 */
	public ResultPager queryResultPager(HashMap<String, Object> map) {
		log.info("查询分页类信息，参数: {}", map);
		return new ResultPager(mapper.queryListCount(map), mapper.queryList(map));
	}

	/**
	 * 添加公司/车队
	 * 
	 * @param Agent
	 */
	public int save(Company company) {
		try {
			log.info("保存单个信息，参数: {}", company.toString());
			return mapper.save(company);
		} catch (Exception e) {
			return -1;
		}
	}

	/**
	 * 编辑公司/车队
	 * 
	 * @param Agent
	 */
	public int edit(Company company) {
		try {
			log.info("编辑单个信息，参数: {}", company.toString());
			return mapper.edit(company);
		} catch (Exception e) {
			return -1;
		}
	}

	/**
	 * 根据ids批量删除公司/车队记录
	 * 
	 * @param ids
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
	 * 根据id查询公司信息
	 * @param id
	 * @return
	 */
	public Company queryOne(String id) {
		return mapper.queryOne(id);
	}

}
