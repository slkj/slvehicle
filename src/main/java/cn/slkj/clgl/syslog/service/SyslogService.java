package cn.slkj.clgl.syslog.service;

import java.util.HashMap;

import cn.slkj.clgl.syslog.entity.Syslog;
import cn.slkj.util.ResultPager;

/**
 * 
 * @author maxh
 *
 */

public interface SyslogService {
	public ResultPager queryResultPager(HashMap<String, Object> map);

	int save(Syslog log);
}
