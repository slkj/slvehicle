package cn.slkj.clgl.module.bean;

import java.io.Serializable;
import java.util.List;

public class Module implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 编号*/
	private String id;
	/** 上级菜单*/
	private String parent_id;
	/** 资源名称*/
	private String name;
	/** 资源类型*/
	private String type;
	/** 资源路径*/
	private String url;
	/** 顺序*/
	private int priority;
	/** 图标*/
	private String icon;
	/** 说明*/
	private String description;
	private List<Module> children;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Module> getChildren() {
		return children;
	}
	public void setChildren(List<Module> children) {
		this.children = children;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Module [id=" + id + ", name=" + name + ", url=" + url + ", parent_id=" + parent_id
				+ ", priority=" + priority + ", icon=" + icon + ", description=" + description
				+ ", children=" + children + "]";
	}

}
