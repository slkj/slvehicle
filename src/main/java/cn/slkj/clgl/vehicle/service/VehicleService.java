package cn.slkj.clgl.vehicle.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.vehicle.bean.Vehicle;
import cn.slkj.clgl.vehicle.mapper.VehicleMapper;
import cn.slkj.util.ResultPager;

/**
 * 车辆管理Service
 * 
 * @author plf
 *
 */
@Service
public class VehicleService {

	private static Logger log = LoggerFactory.getLogger(VehicleService.class);
	@Autowired
	private VehicleMapper mapper;

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
	 * 根据条件获取车辆管理实体
	 * 
	 * @param vehicle
	 * @return
	 */
	public Vehicle queryOne(Vehicle vehicle) {
		log.info("查询单个信息，参数: {}", vehicle.toString());
		if (vehicle == null) {
			return null;
		}
		try {
			return mapper.queryOne(vehicle);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 添加车辆管理
	 * 
	 * @param vehicle
	 */
	public int save(Vehicle vehicle) {
		try {
			log.info("保存单个信息，参数: {}", vehicle.toString());
			return mapper.save(vehicle);
		} catch (Exception e) {
			return -1;
		}
	}

	/**
	 * 编辑车辆管理
	 * 
	 * @param vehicle
	 */
	public int edit(Vehicle vehicle) {
		try {
			log.info("编辑单个信息，参数: {}", vehicle.toString());
			return mapper.edit(vehicle);
		} catch (Exception e) {
			return -1;
		}
	}

	/**
	 * 根据ids批量删除车辆管理记录
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

}
