<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源管理</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	/* var grid;
	$(function() {
		var winSize = {
			width : $(window).width() - 4,
			height : $(window).height() - 40
		};
		grid = $('#tt')
				.treegrid(
						{
							url : '../module/list',
							loadMsg : '数据加载中....',
							title : '系统资源管理列表',
							width : winSize.width,
							height : winSize.height,
							nowrap : true, //false:折行
							// 							rownumbers : true, //行号
							striped : true, //隔行变色
							singleSelect : true, //单选
							checkOnSelect : true,
							idField : 'id',
							treeField : 'name',
							lines : true,
							animate : true,
							columns : [ [
									{
										field : 'name',
										title : '资源名称'
									},
									{
										field : 'icon',
										title : '图标',
										width : 100
									},
									{
										field : 'url',
										title : '资源路径'
									},
									{
										field : 'type',
										title : '资源类型'
									},
									{
										field : 'description',
										title : '描述'
									},
									{
										field : 'opt',
										title : '操作',
										width : 100,
										align : 'center',
										formatter : function(value, row) {
											var s = "";
											s += "<a class=\"editcls\" href=\"javascript:void(0)\" onclick=\"editRow('"
													+ row.id + "');\">编辑</a>";
											s += "|";
											s += "<a href=\"javascript:void(0)\" onclick=\"javaScript:deleteRow('"
													+ row.id + "');\"> 删除 </a>";
											if (row.parent_id == "0") {
												return "";
											}
											return s;
										}
									} ] ],
							toolbar : [ {
								text : '新增',
								iconCls : 'icon-add',
								handler : function() {
									addFun();
								}
							} ],
							onLoadSuccess : function(data) {
								$('.editcls').linkbutton({
									text : '编辑',
									plain : true,
									iconCls : 'icon-edit'
								});
							}
						});
	});

	function addFun() {
		max.modalDialog({
			title : '添加菜单信息',
			width : 700,
			height : 450,
			url : 'moduleAdd.jsp'
		});
	};
	
	function deleteRow(id) {
			
		
	}
	function editRow(id) {
		max.modalDialog({
			title : '编辑菜单信息',
			width : 700,
			height : 450,
			url : 'moduleEdit.jsp?id='+id
		});
	} **/

	var grid;
	
	var addFun = function() {
		max.modalDialog({
			title : '添加菜单信息',
			width : 700,
			height : 450,
			url : 'moduleAdd.jsp'
		});
	};
	var showFun = function(id) {
		var dialog = parent.sy.modalDialog({
			title : '查看资源信息',
			url : sy.contextPath + '/securityJsp/base/SyresourceForm.jsp?id=' + id
		});
	};
	var editFun = function() {
		var row = grid.treegrid("getSelected");
		if (row) {
			max.modalDialog({
				title : '编辑菜单信息',
				width : 700,
				height : 450,
				url : 'moduleEdit.jsp?id=' + row.id
			});
		} else {
			$.messager.alert("操作提示", "请选择行！", "warning");
			return false;
		}
	};
	var removeFun = function() {
		var row = grid.treegrid("getSelected");
		if (row) {
			$.messager.confirm("操作提示", "您确定要执行操作吗？", function(data) {
				if (data) {
					$.ajax({
						cache : false,
						type : "POST",
						url : '../module/deleteModule/' + row.id,
						async : false,
						success : function(data) {
							if (data) {
								max.sysSlideShow({
									msg : "删除成功"
								});
								grid.treegrid("reload"); // 重新加载
							} else {
								max.sysSlideShow({
									msg : "删除失败"
								});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert("操作提示", "请选择行！", "warning");
			return false;
		}
	};
	var redoFun = function() {
		var node = grid.treegrid('getSelected');
		if (node) {
			grid.treegrid('expandAll', node.id);
		} else {
			grid.treegrid('expandAll');
		}
	};
	var undoFun = function() {
		var node = grid.treegrid('getSelected');
		if (node) {
			grid.treegrid('collapseAll', node.id);
		} else {
			grid.treegrid('collapseAll');
		}
	};
	
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
		havePermission("module/addModule",'add');
		havePermission("module/editModule",'edit');
		havePermission("module/deleteModule",'del');
		var winSize = {
			width : $(window).width() - 4,
			height : $(window).height() - 40
		};
		grid = $('#grid').treegrid({
			url : '../module/list',
			loadMsg : '数据加载中....',
			title : '系统资源管理列表',
			width : winSize.width,
			height : winSize.height,
			nowrap : true, //false:折行
			// 							rownumbers : true, //行号
			striped : true, //隔行变色
			singleSelect : true, //单选
			checkOnSelect : true,
			idField : 'id',
			treeField : 'name',
			fit:true,
			lines : true,
			animate : true,
			columns : [ [
					{
						field : 'name',
						title : '资源名称'
					},
					{
						field : 'icon',
						title : '图标'
					},
					{
						field : 'url',
						title : '资源路径'
					},
					{
						field : 'type',
						title : '资源类型'
					},
					{
						field : 'description',
						title : '描述'
					} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function(data) {
				
				$('.editcls').linkbutton({
					text : '编辑',
					plain : true,
					iconCls : 'icons icons_24'
				});
				$('.delCls').linkbutton({
					text : '删除',
					plain : true,
					iconCls : 'icons icons_12'
				});
				
			}
		});
	});
	
	
	
</script>
</head>
<body>
	<input type="hidden" id="u_id" value="${userSession.u_id } " />
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<td id="add"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_11',plain:true" onclick="addFun();">添加</a></td>
				<td id="addseparator"><div class="datagrid-btn-separator"></div></td>
				<td id="edit" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_24',plain:true" onclick="editFun();">编辑</a></td>
				<td id="editseparator"><div class="datagrid-btn-separator"></div></td>
				<td id="del"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_12',plain:true" onclick="removeFun();">删除</a></td>
				<td id="delseparator"><div class="datagrid-btn-separator"></div></td>
				<td><a onclick="redoFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-redo'">展开</a>
					<a onclick="undoFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo'">折叠</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a onclick="grid.treegrid('reload');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a></td>
			</tr>
		</table>
	</div>
	
	<table id="grid" data-options="fit:true,border:false"></table>
	

</body>
</html>