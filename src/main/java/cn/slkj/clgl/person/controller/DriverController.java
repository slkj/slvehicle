package cn.slkj.clgl.person.controller;

import java.util.HashMap;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.clgl.person.entity.Driver_record;
import cn.slkj.clgl.person.entity.Person;
import cn.slkj.clgl.person.service.DriverService;
import cn.slkj.util.JsonResult;
import cn.slkj.util.ResultPager;
@Controller
@RequestMapping(value = "/driver")
public class DriverController {
	@Resource
	private DriverService service;
	
	@ResponseBody
	@RequestMapping(value = "/list")
	public ResultPager list( @RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer rows,String idcard_no)
			throws Exception {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("endNum", page * rows);
			map.put("startNum", (page - 1) * rows);
			if(StringUtils.isNotEmpty(idcard_no)){
				map.put("idcard_no", idcard_no);
			}
			return service.search(map);
		} catch (Exception e) {
			throw new Exception(
					"this is the detail of ajax exception information");
		}
	}
	@ResponseBody
	@RequestMapping(value = "/one")
	public Driver_record queryOne( String id)
			throws Exception {
		try {
			Driver_record d=new Driver_record();
			d.setDriver_record_id(id);
			return service.One(d);
		} catch (Exception e) {
			throw new Exception(
					"this is the detail of ajax exception information");
		}
	}
	/** 添加*/
	@ResponseBody
	@RequestMapping(value = "/add", method = { RequestMethod.POST })
	public JsonResult save(Driver_record d)
			throws Exception {
		try {
			d.setDriver_record_id(UUID.randomUUID().toString());
			int i = service.add(d);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		} catch (Exception e) {
			throw new Exception(
					"this is the detail of ajax exception information");
		}
		return new JsonResult(false, "保存失败！");
	}
	
	/** 编辑*/
	@ResponseBody
	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public JsonResult editSave(Driver_record p)
			throws Exception {
		try {

			int i = service.edit(p);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		} catch (Exception e) {
			throw new Exception(
					"this is the detail of ajax exception information");
		}
		return new JsonResult(false, "编辑失败！");
	}
	
	/** 批量删除*/
	@ResponseBody
	@RequestMapping(value = "/deletes", method = { RequestMethod.POST })
	public JsonResult deletes(@RequestParam(value = "ids[]") String[] ids) {
		int i = service.remove(ids);
		if (i > 0) {
			return new JsonResult(true, "");
		}
		return new JsonResult(false, "删除失败！");
	}
}
