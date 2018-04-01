package cn.slkj.clgl.xzqh.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.clgl.xzqh.entity.CareaXZQH;
import cn.slkj.clgl.xzqh.service.ComboboxService;
import cn.slkj.util.Tree;

/**
 * 
 * @ClassName: XzqhController
 * @Description: 行政区划
 * @author maxh
 * @date 2014年7月18日 上午8:55:47
 * 
 */
@Controller
@RequestMapping(value = "/xzqh")
public class ComboboxController {
	@Autowired
	private ComboboxService comboboxService;

	@ResponseBody
	@RequestMapping(params = "method=queryOne")
	public CareaXZQH queryOne(@RequestParam(required = false, defaultValue = "") String code) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		return comboboxService.queryOne(map);
	}

	// 查询全国行政区代码省
	@ResponseBody
	@RequestMapping(value = "/province.do")
	public List<CareaXZQH> provinceCombobox() {
		return comboboxService.findProvince();
	}

	// 查询全国行政区代码市
	@ResponseBody
	@RequestMapping(value = "/city.do")
	public List<CareaXZQH> cityCombobox(
			@RequestParam(required = false, defaultValue = "") String province) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", province.substring(0, 2));
		map.put("code", province);
		return comboboxService.findCity(map);
	}

	// 查询全国行政区代码县区
	@ResponseBody
	@RequestMapping(value = "/county.do")
	public List<CareaXZQH> countyCombobox(
			@RequestParam(required = false, defaultValue = "") String city) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", city.substring(0, 4));
		map.put("code", city);
		return comboboxService.findCounty(map);
	}

	// 查询全国行政区代码省
	@ResponseBody
	@RequestMapping(value = "/xzqh/province.do")
	public List<CareaXZQH> provinceCombobox1() {
		return comboboxService.findProvince();
	}

	// 查询全国行政区代码省
	@ResponseBody
	@RequestMapping(value = "/queryList")
	public List<Tree> queryList(String code) {
		List<CareaXZQH> list = comboboxService.queryList(code);
		return markTree(list,code);
	}
	private List<Tree> markTree(List<CareaXZQH> list,String str){
		List<Tree>  trees = new ArrayList<Tree>();
		for (CareaXZQH xzqh : list) {
			Tree tree = new Tree();
			tree.setId(xzqh.getCode());
			tree.setText(xzqh.getNote());
			if (str.equals(xzqh.getPid())) {
				tree.setChildren(markTree(list,xzqh.getCode()));
				trees.add(tree);
			}
		}
		return trees;
	}
}
