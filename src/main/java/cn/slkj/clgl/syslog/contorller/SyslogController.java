package cn.slkj.clgl.syslog.contorller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.clgl.syslog.service.impl.SyslogServiceImpl;
import cn.slkj.util.ResultPager;

@Controller
@RequestMapping(value = "/log")
public class SyslogController {
	@Resource
	private SyslogServiceImpl impl;

	@ResponseBody
	@RequestMapping(value = "/all")
	public ResultPager list(@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "15") Integer rows, String id,
			String operate, String starttime, String endtime, String ip) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("operate", operate);
		map.put("starttime", starttime);
		map.put("endtime", endtime);
		map.put("ip", ip);
		
		map.put("endNum", page * rows);
		map.put("startNum", (page - 1) * rows);
		return impl.queryResultPager(map);

	}
}
