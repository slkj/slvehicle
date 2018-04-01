<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<!-- 	引入通用js css -->
<%@ include file="/common/taglibs.jsp"%>
<link href="../css/input.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	var grid;
	var mid;
	var Request = new Object();
	$(function() {
		Request = GetRequest();
		mid = Request['id'];
		grid = $('#grid').datagrid({
			title : '',
			url : '../user/queryNotInRorle?roleid=' + mid,
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
				width : '200',
				title : '所属公司',
				field : 'company'
			}, {
				width : '120',
				title : '电话',
				field : 'telephone'
			} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function() {
				$('#grid').datagrid('clearSelections');
			}
		});
		var p = $('#grid').datagrid('getPager');
		$(p).pagination({
			beforePageText : '第',
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		});
	});
	function rightFun() {

		var selRow = grid.datagrid("getSelections");
		if (selRow.length == 0) {
			$.messager.alert("操作提示", "请选择行", "warning");
			return false;
		}
		saveMemRole(selRow);
	}
	function saveMemRole(selRow) {
		var ids = [];
		for (var i = 0; i < selRow.length; i++) {
			var id = selRow[i].u_id;
			ids.push(id);
		}
		var param = {
			roleid : mid,
			ids : ids
		};
		$.ajax({
			url : "../user/addUserRole",
			type : "POST",
			data : param,
			async : false,
			dataType : "json",
			cache : false,
			success : function(data) {
				if (data.success) {
					parent.max.sysSlideShow({
						msg : "操作成功！"
					});
					parent.$('#userGrid').datagrid("reload"); // 重新加载
					parent.max.closedlg();
				} else {
					parent.max.sysSlideShow({
						msg : "操作失败！"
					});
				}
			}
		});
	}
</script>

</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid"></table>
	</div>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icons icons_45',plain:true" onclick="rightFun()">选择</a> <input id="ss" class="easyui-searchbox" style="width: 300px" data-options="prompt:'请输入搜索的用户名'"></input>
	</div>
</body>
</html>