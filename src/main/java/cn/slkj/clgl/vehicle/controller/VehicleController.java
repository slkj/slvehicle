package cn.slkj.clgl.vehicle.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.clgl.user.entity.User;
import cn.slkj.clgl.vehicle.bean.Vehicle;
import cn.slkj.clgl.vehicle.service.VehicleService;
import cn.slkj.util.JsonResult;
import cn.slkj.util.ResultPager;

/**
 * 车辆管理VehicleController
 * 
 * @author maxh
 * 
 */
@Controller
@RequestMapping(value = "/vehicle")
public class VehicleController {
	private static Logger log = LoggerFactory.getLogger(VehicleController.class);

	@Resource
	private VehicleService vehicleService;

	/**
	 * 查询车辆管理列表
	 * 
	 * @param page
	 * @param rows
	 * @param username
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/list", method = { RequestMethod.POST })
	public ResultPager list(@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer rows, String carUseNatu,
			String ownedId, String carVin, String carNumber, String depId, String companyid,HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 判断用户类型，传的参数不同
		if (StringUtils.isBlank(depId)) {
			User user = (User) session.getAttribute("userSession");
			if (user.getType().equals("2")) { // 平台用户
				map.put("depId", user.getDepartcode());
			}
		}else{
			map.put("depId", depId);
		}
		if (StringUtils.isBlank(companyid)) {
			User user = (User) session.getAttribute("userSession");
			if (user.getType().equals("1")) { // 企业用户
				map.put("companyid", user.getCompanyid());
			}
		}else{
			map.put("companyid", companyid);
		}
		if (StringUtils.isNotBlank(carUseNatu)) {
			map.put("carUseNatu", carUseNatu);
		}
		if (StringUtils.isNotBlank(carUseNatu)) {
			map.put("carUseNatu", carUseNatu);
		}
		if (StringUtils.isNotBlank(ownedId)) {
			map.put("ownedId", ownedId);
		}
		if (StringUtils.isNotBlank(carVin)) {
			map.put("carVin", carVin);
		}
		if (StringUtils.isNotBlank(carNumber)) {
			map.put("carNumber", carNumber);
		}
		map.put("endNum", page * rows);
		map.put("startNum", (page - 1) * rows);
		return vehicleService.queryResultPager(map);
	}

	/**
	 * 保存车辆管理
	 * 
	 * @param vehicle
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public JsonResult save(Vehicle vehicle) throws Exception {
		try {
			int i = vehicleService.save(vehicle);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new JsonResult(false, "保存失败！");
	}

	/** 编辑保存 */
	@ResponseBody
	@RequestMapping(value = "/editVehicle", method = { RequestMethod.POST })
	public JsonResult editVehicle(Vehicle vehicle) {
		try {
			// FileUpload fileUpload = new FileUpload(Constant.path, request);
			// HashMap<String, String> mapFile = fileUpload.upload();
			// if(mapFile.get("carImgFile") != null){
			// voiture.setCarImg(mapFile.get("carImgFile"));
			// }
			int i = vehicleService.edit(vehicle);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new JsonResult(false, "编辑失败！");
	}

	@ResponseBody
	@RequestMapping(value = "/delete")
	public JsonResult delete(String id) {
		int i = vehicleService.delete(id);
		if (i > 0) {
			return new JsonResult(true, "");
		}
		return new JsonResult(false, "删除失败！");
	}

	/**
	 * 获取车辆管理实体
	 * 
	 * @param classification
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value = "/queryOne")
	public Vehicle queryOne(Vehicle vehicle) {
		return vehicleService.queryOne(vehicle);
	}
}
