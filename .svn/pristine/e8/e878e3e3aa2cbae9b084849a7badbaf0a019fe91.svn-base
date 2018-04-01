<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- 	引入通用js css -->

<%@ include file="/common/taglibs.jsp"%>
<link href="../css/input.css" rel="stylesheet" type="text/css" />

<script src="../js/role/list.js" type="text/javascript"></script>

</head>
<body id="cc" class="easyui-layout" data-options="fit:true,border:false">
	<input type="hidden" id="u_id" value="${userSession.u_id } " />
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<td id="add"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_11',plain:true" onclick="addFun();">添加</a></td>
				<td id="addseparator"><div class="datagrid-btn-separator"></div></td>
				<td id="edit" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_24',plain:true" onclick="editFun();">编辑</a></td>
				<td id="editseparator"><div class="datagrid-btn-separator"></div></td>
				<td id="del"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_12',plain:true" onclick="delRow();">删除</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td id="allot"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_91',plain:true" onclick="allotRes();">操作权限</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center'">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>

</html>