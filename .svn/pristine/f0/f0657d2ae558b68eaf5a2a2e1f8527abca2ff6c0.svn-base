var code;
var grid;

/**
 * 
 * @param btnName
 *            按钮名称
 * @param handler
 *            按钮事件名称
 * @param icon
 *            按钮图片
 */
var havePermission = function(url,name){
	$.ajax({
		cache : false,
		type : "POST",
		url : '../module/havePermission?url='+url +"&userid=" + $("#u_id").val(),
		async : false,
		success : function(data) {
			if(data){
				//alert(true);
				
			}else{
				//alert(false);
				$("#"+name).hide();
				$("#"+name +"separator").hide();
			}
		}
	});
}
$(function() {
	havePermission("user/add",'add');
	havePermission("user/edit",'edit');
	havePermission("user/deletes",'del');
	havePermission("user/allotRole",'allot');
	//loatoolbar(10);
	loadGrid();
});

function loadGrid() {
	
	grid = $('#grid').datagrid({
		url : '../user/all',
		width : 'auto',
		height : 'auto',
		nowrap : true,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		fit : true,// 自动大小
		remoteSort : false,
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		singleSelect : true,
		pageSize : 15,// 每页显示的记录条数，默认为10
		pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
		loadMsg : '正在努力加载...',
		columns : [ [ {
			field : 'id',
			checkbox : true
		}, {
			width : '120',
			title : '帐号',
			field : 'username'

		}, {
			width : '120',
			title : '联系人',
			field : 'contacts'

		}, {
			width : '120',
			title : '用户类型',
			field : 'type',
			formatter : function(value, row, index) {
				var str="";
				switch (value) {
				case "1":
					str = "企业用户";
					break;
				case "2":
					str = "平台用户";
					break;
				}
				return str;
			}

		}, {
			width : '200',
			title : '所属公司/单位',
			field : 'company',
			formatter : function(value, row, index) {
				var str="";
				switch (row.type) {
				case "1":
					str = value;
					break;
				case "2":
					str = row.depart;
					break;
				}
				return str;
			}
		}, {
			width : '250',
			title : '所在地区',
			field : 'localname'

		}, {
			width : '120',
			title : '电话',
			field : 'telephone'

		}, {
			width : '150',
			title : '注册时间',
			field : 'regtime'

		} ] ],
		toolbar : '#toolbar',
		/*toolbar : [ {
			text : '添加',
			iconCls : 'icons icons_11',
			handler : function() {
				addFun();
			}
		}, '-', {
			text : '编辑',
			iconCls : 'icons icons_24',
			handler : function() {
				editRow();
			}
		}, '-', {
			text : '删除',
			iconCls : 'icons icons_12',
			handler : function() {
				deleteFun();
			}
		}, '-', {
			text : '操作权限',
			iconCls : 'icons icons_91',
			handler : function() {
				allotRole();
			}
		} ],*/
		onLoadSuccess : function() {
			$('#grid').datagrid('clearSelections');
		}
	});
	var p = grid.datagrid('getPager');
	$(p).pagination({
		pageSize : 10,// 每页显示的记录条数，默认为10
		pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
	});
	$("#btn").click(function() {
		$('#grid').datagrid("load", {
			"username" :  $("#username").val(),
			//"type" : ('#type').combobox('getValue'),
		});
		// 清空表单
		$('#searchForm').form('clear');
	});
}
/**
 * 弹出添加页面
 */
function addFun() {
	max.modalDialog({
		title : '添加用户信息',
		width : 700,
		height : 450,
		url : 'add.jsp'
	});
};
function viewFun(id) {
	max.modalDialog({
		title : '用户信息',
		width : 700,
		height : 450,
		url : 'userinfo.jsp?id=' + id
	});
};

function editRow() {
	var rows = grid.datagrid('getSelections');
	if (!rows || rows.length != 1) {
		$.messager.alert('提示', '请选择一行数据!', 'info');
		return;
	} else {
		max.modalDialog({
			title : "编辑用户信息",
			width : 700,
			height : 450,
			url : "add.jsp?id=" + rows[0].u_id
		});
	}

}

function deleteFun() {
	$.messager.confirm("操作提示", "您确定要执行操作吗？", function(data) {
		if (data) {
			var rows = grid.datagrid('getSelections');
			if (!rows || rows.length == 0) {
				$.messager.alert('提示', '请选择要删除的数据!', 'info');
				return;
			}
			var ids = [];
			$.each(rows, function(i, n) {
				var id = rows[i].u_id; // id这个是你要在列表中取的单个id
				ids.push(id); // 然后把单个id循环放到ids的数组中

			});
			var param = {
				ids : ids
			};
			deleteData(param);
		}
	});
}
function deleteData(param) {
	$.ajax({
		url : "../user/deletes",
		type : "POST",
		data : param,
		async : false,
		dataType : "json",
		cache : false,
		success : function(data) {
			if (data) {
				max.sysSlideShow({
					msg : "删除成功"
				});
				$('#grid').datagrid('load'); // 重新加载
			} else {
				max.sysSlideShow({
					msg : "删除失败"
				});
			}
		}
	});
};



function allotRole() {
	var rows = grid.datagrid('getSelections');
	if (!rows || rows.length != 1) {
		$.messager.alert('提示', '请选择一行数据!', 'info');
		return;
	} else {
		max.modalDialog({
			title : "添加角色",
			width : 700,
			height : 450,
			url : "allotRole.jsp?id=" + rows[0].u_id
		});
	}
}
