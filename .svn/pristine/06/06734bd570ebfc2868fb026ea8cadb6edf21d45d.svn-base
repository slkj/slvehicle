package cn.slkj.clgl.xzqh.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.xzqh.dao.ComboboxMapper;
import cn.slkj.clgl.xzqh.entity.CareaXZQH;



/**
 * 
 * @ClassName: ComboboxService
 * @Description: 行政区划
 * @author maxh
 * @date 2014年7月18日 上午8:59:43
 * 
 */
@Service
public class ComboboxService {
	@Autowired
	private ComboboxMapper mapper;
	
	/**
	 * 查询省市县
	 * @param map
	 * @return
	 */
	public CareaXZQH queryOne(HashMap<String, Object> map){
		try {
			return mapper.queryOne(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @Title: findProvince
	 * @Description: 查询省 直辖市
	 * @param @return 设定文件
	 * @return List<CareaXZQH> 返回类型
	 * @throws
	 */
	public List<CareaXZQH> findProvince() {
		try {
			return mapper.findProvince();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @Title: findCity
	 * @Description: 根据省 直辖市级id 查询子项
	 * @param @param map
	 * @param @return 设定文件
	 * @return List<CareaXZQH> 返回类型
	 * @throws
	 */
	public List<CareaXZQH> findCity(HashMap<String, Object> map) {
		try {
			return mapper.findCity(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @Title: findCounty
	 * @Description: 根据市级 id 查询子项
	 * @param @param map
	 * @param @return 设定文件
	 * @return List<CareaXZQH> 返回类型
	 * @throws
	 */
	public List<CareaXZQH> findCounty(HashMap<String, Object> map) {
		try {
			return mapper.findCounty(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据地区代码查询，该地区和下属地区
	 * @param map
	 * @return
	 */
	public List<CareaXZQH> queryList(String code) {
		try {
			return mapper.queryList(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
