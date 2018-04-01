<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<%@ include file="/common/taglibs.jsp"%>

<link href="../css/input.css" rel="stylesheet" type="text/css" />
<script src="../js/user/list.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
	<!-- <div id="toolbar"
		style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
		<div style="float: left;">
			<a href="#" class="easyui-linkbutton" plain="true"
				icon="icons icons_11" onclick="addFun()">新增</a>
		</div>
		<div class="datagrid-btn-separator"></div>
		<div style="float: left;">
			<a href="#" class="easyui-linkbutton" plain="true"
				icon="icons icons_12" onclick="editFun()">编辑</a>
		</div>
		<div class="datagrid-btn-separator"></div>
		<div style="float: left;">
			<a href="#" class="easyui-linkbutton" plain="true"
				icon="icons icons_24" onclick="deleteFun()">删除</a>
		</div>
		<div class="datagrid-btn-separator"></div>
		<div style="float: left;">
			<a href="#" class="easyui-linkbutton" plain="true"
				icon="icons icons_33">角色授权</a>
		</div>
		<div id="tb" style="float: right;">
			<input class="easyui-searchbox" prompt="请输入用户名"
				style="width: 300px; vertical-align: middle;" />
		</div>
	</div> -->
	<input type="hidden" id="u_id" value="${userSession.u_id } " />
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<td id="add"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_11',plain:true" onclick="addFun();">添加</a></td>
				<td id="addseparator"><div class="datagrid-btn-separator"></div></td>
				<td id="edit" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_24',plain:true" onclick="editRow();">编辑</a></td>
				<td id="editseparator"><div class="datagrid-btn-separator"></div></td>
				<td id="del"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_12',plain:true" onclick="deleteFun();">删除</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td id="allot"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icons icons_91',plain:true" onclick="allotRole();">操作权限</a></td>
			</tr>
		</table>
	</div>
	<div region="north" border="false" class="p-search">
		<fieldset>
			<legend>信息模糊搜索</legend>
			<form id="searchForm">
				<table>
					<tr>
						<td>用户帐号:</td>
						<td><input id="username" name="username" style="width: 100px;" /></td>
					<!-- 	<td>用户类型:</td>
						<td style="margin-top: -10px"> -->
						
<!-- 							<input name="type" type="radio" -->
<!-- 							value="2" checked="checked" />运管单位 <input name="type" -->
<!-- 							type="radio" value="1" />企业用户 -->
							<!-- <select id="type" class="easyui-combobox" name="type">   
							    <option value="1">企业用户</option>   
							    <option value="2">运管单位</option>   
							    <option value="3">个人用户</option>    -->
<!-- 						<!-- 	    <option value="0">管理员</option>    -->
							<!-- </select> 
						
						</td> -->

						<td><a id="btn" href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-search'">查询</a>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
	<div data-options="region:'center'">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>