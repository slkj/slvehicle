/**  
 *
 */
package cn.slkj.util;

import java.util.List;

/**
 * 
 * @Title: Pager.java
 * @Prject: 简单分页类
 * @Package: cn.sljk.wlsh.base.util
 * @Description: easyui 分页返回对象
 * @author: maxh
 * @date: 2014年6月23日 下午11:03:04
 * @version: V1.0
 */
public class ResultPager {
	/** 总记录数 */
	private int total;
	
	/** 获得分页内容*/
	private List rows;
	
	public ResultPager(){
		
	}
	public ResultPager(int total,List rows){
		this.total = total;
		this.rows = rows;
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	@Override
	public String toString() {
		//return "ResultPager [total=" + total + "totalPage=" + totalPage + ", rows=" + rows + "]";
		return "ResultPager [total=" + total + ", rows=" + rows + "]";
	}


}
