package cn.slkj.clgl.user.entity;

import java.io.Serializable;

/**
 * 
 * @ClassName: User
 * @Description: 用户信息
 * @author maxh
 * @date 2014年12月10日 上午10:14:45
 *
 */
/**
 * @author plf
 *
 */
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String u_id;
	/**
	 * 帐号
	 */
	private String username;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 用户类型
	 * 1 企业用户  2运管用户
	 */
	private String type;
	/**
	 * 验证码
	 */
	private String vcode;
	/**
	 * 注册时间
	 */
	private String regtime;
	/**
	 * 用户名
	 */
	private String contacts;
	/**
	 * 联系电话
	 */
	private String telephone;
	/**
	 * QQ
	 */
	private String qq;
	/**
	 * email 邮箱
	 */
	private String email;

	/**
	 * 所在地区编码
	 */
	private String location;
	/**
	 * 所在地区名称
	 */
	private String localname;
	/**
	 * 公司名称
	 */
	private String companyid;
	/**
	 * 公司名称
	 */
	private String company;
	/**
	 * 部门编号
	 */
	private String departcode;
	/**
	 * 部门名称
	 */
	private String depart;
	/**
	 * 地址
	 */
	private String address;
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getVcode() {
		return vcode;
	}
	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLocalname() {
		return localname;
	}
	public void setLocalname(String localname) {
		this.localname = localname;
	}
	public String getCompanyid() {
		return companyid;
	}
	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDepartcode() {
		return departcode;
	}
	public void setDepartcode(String departcode) {
		this.departcode = departcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", username=" + username + ", password=" + password
				+ ", type=" + type + ", vcode=" + vcode + ", regtime=" + regtime + ", contacts="
				+ contacts + ", telephone=" + telephone + ", qq=" + qq + ", email=" + email
				+ ", location=" + location + ", localname=" + localname + ", companyid="
				+ companyid + ", company=" + company + ", departcode=" + departcode + ", depart="
				+ depart + ", address=" + address + "]";
	}
	
	

}
