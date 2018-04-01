package cn.slkj.clgl.role.entity;

import java.io.Serializable;


/**
 * @ClassName: Role
 * @Description: 角色
 * @author maxh
 * @date 2014年12月7日 下午4:40:04
 * 
 */
public class Role implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * guid
	 */
	private String roleid;
	/**
	 *角色名称 
	 */
	private String rolename;
	/**
	 * 描述
	 */
	private String roledscript;
	/**
	 * 排序
	 */
	private int rolesort;
	/**
	 * 创建时间
	 */
	private String createdate;
	
	private boolean checked = false;
	
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getRoledscript() {
		return roledscript;
	}
	public void setRoledscript(String roledscript) {
		this.roledscript = roledscript;
	}
	public int getRolesort() {
		return rolesort;
	}
	public void setRolesort(int rolesort) {
		this.rolesort = rolesort;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	@Override
	public String toString() {
		return "Role [roleid=" + roleid + ", rolename=" + rolename + ", roledscript=" + roledscript + ", rolesort=" + rolesort + ", createdate=" + createdate + "]";
	}
	
}
