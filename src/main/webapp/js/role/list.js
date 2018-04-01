var grid;


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
	havePermission("role/add",'add');
	havePermission("role/editModule",'edit');
	havePermission("role/delete",'del');
	havePermission("role/saveRoleRes",'allot');
	loadData();
});

function loadData() {
	grid = $('#grid').datagrid({
		url : '../role/queryRoleList',
		width : 'auto',
		height : 'auto',
		nowrap : true,
		striped : true,
		collapsible : false,// 是否可折叠的
		fit : true,// 自动大小
		loadMsg : '正在加载请稍候...',
		remoteSort : false,
		singleSelect : true,// 是否单选
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		pageSize : 10,// 默认选择的分页是每页5行数据
		pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以选择的分页集合
		columns : [ [ {
			title : '角色名称',
			field : 'rolename'
		}, {
			title : '资源描述',
			field : 'roledscript'
		}, {
			width : '150',
			title : '创建时间',
			field : 'createdate'
		}, {
			width : '50',
			title : '排序',
			field : 'rolesort'
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
				delRow();
			}
		}, '-', {
			text : '操作权限',
			iconCls : 'icons icons_91',
			handler : function() {
				allotRes();
			}
		} ],*/
		onLoadSuccess : function() {
			$('#grid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
		}

	});
	var p = $('#grid').datagrid('getPager');
	$(p).pagination(
			{
				// pageSize : 20,// 每页显示的记录条数，默认为10
				// pageList : [ 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
				beforePageText : '第',// 页数文本框前显示的汉字
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
				layout : [ 'list', 'sep', 'first', 'prev', 'links', 'next',
						'last', 'sep', 'refresh' ]
			});
}
function addFun() {
	max.modalDialog({
		title : "添加角色",
		width : 600,
		height : 450,
		url : "add.jsp"
	});
};
function editFun() {
	var row = grid.datagrid("getSelected");
	if (row) {
		max.modalDialog({
			title : "编辑信息",
			width : 600,
			height : 450,
			url : "add.jsp?id=" + row.roleid
		});
	} else {
		$.messager.alert("操作提示", "请选择行！", "warning");
		return false;
	}
}
function allotRes() {
	var row = grid.datagrid("getSelected");
	if (row) {
		max.modalDialog({
			title : "添加角色",
			width : 600,
			height : 450,
			url : "allotRes.jsp?id=" + row.roleid
		});
	} else {
		$.messager.alert("操作提示", "请选择行", "warning");
		return false;
	}
}
function allotUser() {
	var row = grid.datagrid("getSelected");
	if (row) {
		max.modalDialog({
			title : "选择用户",
			width : 700,
			height : 450,
			url : "allotUser.jsp?id=" + row.roleid
		});
	} else {
		$.messager.alert("操作提示", "请选择行", "warning");
		return false;
	}
}
function palert(){
	alert(" this on pange ");
}


function delRow() {
	var selRow = grid.datagrid("getSelections");// 返回选中多行
	if (selRow.length == 0) {
		$.messager.alert("操作提示", "请选择行", "warning");
		return false;
	}
	var ids = [];
	for (var i = 0; i < selRow.length; i++) {
		var id = selRow[i].roleid;
		ids.push(id);
	}
	var param = {
		ids : ids
	};

	$.messager.confirm("操作提示", "您确定要执行操作吗？", function(data) {
		if (data) {
			$.ajax({
				url : "../role/delete",
				type : "POST",
				data : param,
				async : false,
				dataType : "json",
				cache : false,
				success : function(data) {
					if (data.success) {
						max.sysSlideShow({
							msg : "删除成功"
						});
						grid.datagrid("reload"); // 重新加载
					} else {
						max.sysSlideShow({
							msg : "删除失败"
						});
					}

				}
			});
		}
	});
}
