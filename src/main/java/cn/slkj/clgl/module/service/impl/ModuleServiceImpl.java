package cn.slkj.clgl.module.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.slkj.clgl.module.bean.Module;
import cn.slkj.clgl.module.mapper.ModuleMapper;
import cn.slkj.clgl.module.service.ModuleService;
import cn.slkj.util.Tree;

@Repository
public class ModuleServiceImpl implements ModuleService {
	@Autowired
	private ModuleMapper mapper;

	@Override
	public List<Module> getAll(String parentId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// map.put("parentId",parentId);
		List<Module> list = mapper.getAll(map);
		return makeTree(list);
	}

	private List<Module> makeTree(List<Module> list) {
		List<Module> parent = new ArrayList<Module>();
		// get parentId = null;
		for (Module e : list) {
			if (e.getParent_id().equals("0")) {
				e.setChildren(new ArrayList<Module>(0));
				parent.add(e);
			}
		}
		// 删除parentId = null;
		list.removeAll(parent);
		makeChildren(parent, list);
		return parent;
	}

	private void makeChildren(List<Module> parent, List<Module> children) {
		if (children.isEmpty()) {
			return;
		}
		List<Module> tmp = new ArrayList<Module>();
		for (Module c1 : parent) {
			for (Module c2 : children) {
				c2.setChildren(new ArrayList<Module>(0));
				if (c1.getId().equals(c2.getParent_id())) {
					c1.getChildren().add(c2);
					tmp.add(c2);
				}
			}
		}
		children.removeAll(tmp);
		makeChildren(tmp, children);
	}

	@Override
	public List<Tree> getCombotree(String parentId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Module> list = mapper.getAll(map);
		return toTree(list, "0");
	}
	
	/**
	 * 判断当前用户是否可以访问某资源
	 * @return
	 */
	@Override
	public boolean havePermission(String url,String userid) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("url", url);
		map.put("userid", userid);
		map.put("type", "功能");
		List<Module> list = mapper.getModuleByUserid(map);
		if(list != null && list.size() > 0){
			return true;
		}else{
			return false;
		}
		
	}
	
	@Override
	public List<Module> getModuleByUserid(String userId,String parentId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userId);
		List<Module> list = mapper.getModuleByUserid(map);
		return makeTree(list);
	}
	

	private List<Tree> toTree(List<Module> list, String code) {
		List<Tree> trees = new ArrayList<Tree>();
		for (Module m : list) {
			Tree t = new Tree();
			t.setId(m.getId() + "");
			t.setText(m.getName());
			// t.setState();
			// t.setChecked();
			if (code.equals(m.getParent_id())) {
				t.setChildren(toTree(list, m.getId()));
				trees.add(t);
			}

		}
		return trees;
	}

	@Override
	public int insert(Module module) {
		try {
			return mapper.insert(module);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}

	@Override
	public int update(Module module) {
		try {
			return mapper.update(module);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(String id) {
		try {
			return mapper.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}

	@Override
	public Module queryOne(String id) {
		return mapper.queryOne(id);
	}
	@Override
	public List<Tree> getModuleByRoleId(String roleId,String parentId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roleid", roleId);
		List<Module> allList = mapper.getAll(map);
		List<Module> checkList = mapper.getModuleByRoleId(map);
		return initCheckBoxTree(allList, "0", checkList);
	}
	// 将list转换为需要的json格式
	private List<Tree> initCheckBoxTree(List<Module> list, String code,
			List<Module> list1) {
		List<Tree> trees = new ArrayList<Tree>();
		for (Module m : list) {
			Tree t = new Tree();
			t.setId(m.getId() + "");
			t.setText(m.getName());
			t.setChecked(false);
			// t.setState();
			// t.setChecked();
			if (list1 != null) {
				// 循环判断该角色拥有的资源，如果拥有的话，设置为选择中
				for (int i = 0; i < list1.size(); i++) {
					String oid = list1.get(i).getId();
					String nid = m.getId();
					if (oid.equals(nid)) {
						t.setChecked(true);
					}

				}
			}
			if (code.equals(m.getParent_id())) {
				t.setChildren(initCheckBoxTree(list, m.getId(),list1));
				trees.add(t);
			}
		}
		return trees;
	}

	/**
	 * 查询父id 下面子节点
	 */
	@Override
	public List<Module> getByPid(String userId,String parentId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userId);
		map.put("parentId", parentId);
		return mapper.getModuleByUserid(map);
	}
}
