/**
 * 
 */
package cn.slkj.clgl.syslog.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.slkj.clgl.syslog.dao.SyslogMapper;
import cn.slkj.clgl.syslog.entity.Syslog;
import cn.slkj.clgl.syslog.service.SyslogService;
import cn.slkj.util.ResultPager;

/**
 * @author maxh
 *
 */
@Service
public class SyslogServiceImpl implements SyslogService {
	@Autowired
	private SyslogMapper mapper;
	@Override
	public ResultPager queryResultPager(HashMap<String, Object> map) {
		return new ResultPager(mapper.queryAllCount(map), mapper.queryAll(map));
	}
	@Override
	public int save(Syslog log) {
		// TODO Auto-generated method stub
		return mapper.save(log);
	}
}
