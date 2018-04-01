package cn.slkj.clgl.company.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

import cn.slkj.clgl.company.bean.Company;
import cn.slkj.clgl.company.service.CompanyService;
import cn.slkj.clgl.xzqh.LocationUtil;
import cn.slkj.util.JsonResult;
import cn.slkj.util.ResultPager;
import cn.slkj.util.Tree;

/**
 * @ClassName: 公司/车队companyController
 * @author maxh
 * @date 2014年10月23日 上午10:52:39
 * 
 */
@Controller
@RequestMapping(value = "/company")
public class CompanyController {
	private static Logger log = LoggerFactory.getLogger(CompanyController.class);
	@Resource
	private CompanyService companyService;

	/**
	 * 
	 * @param page
	 * @param rows
	 * @param gsmc
	 * @param location
	 * @param session
	 * @return  返回easyUI datagrid 数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/list")
	public ResultPager list(@RequestParam(required = false, defaultValue = "1") Integer page,// 第几页
			@RequestParam(required = false, defaultValue = "10") Integer rows,// 每页显示多少行
			String gsmc,String location, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(gsmc)){
			map.put("gsmc", gsmc);	
		}
		if (StringUtils.isNotBlank(location)) {
			map.put("location", LocationUtil.toLocation(location));
		} 
		map.put("endNum", page * rows);
		map.put("startNum", (page - 1) * rows);
		return companyService.queryResultPager(map);
	}
	@ResponseBody
	@RequestMapping(value = "/queryComList")
	public List<Company> queryComList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		return companyService.queryComList(map);
	}
	
	/**
	 * 获取公司/车队实体
	 * 
	 * @param classification
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryOne")
	public Company queryOne(String id) {
		return companyService.queryOne(id);
	}
	/** 保存公司/车队 */
	@ResponseBody
	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public JsonResult save(Company company) throws Exception {
		try {
			int i = companyService.save(company);
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
	@RequestMapping(value = "/editCompany")
	public JsonResult editCompany(Company company) throws Exception {
		try {
			int i = companyService.edit(company);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new JsonResult(false, "编辑失败！");
	}

	/** 批量删除 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public JsonResult deletes(String id) {
		int i = companyService.delete(id);
		if (i > 0) {
			return new JsonResult(true, "");
		}
		return new JsonResult(false, "删除失败！");
	}
}
