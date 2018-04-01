<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="../js/city.js"></script>
<script type="text/javascript" src="../js/SL.common.js"></script>
<script type="text/javascript" src="department.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',split:false" style="height: 32px;">
		<div class="panel-header">
			<a href="#" title="展开所有" onclick="expandAll();">展开</a> <a href="#"
				title="关闭所有" onclick="collapseAll()">折叠</a>&nbsp;&nbsp; <a href="#"
				class="easyui-linkbutton"
				data-options="iconCls:'icons icons_12',plain:true"
				onclick="uiBtnOnClick(1)">删除</a> <a href="#"
				class="easyui-linkbutton"
				data-options="iconCls:'icons icons_11',plain:true"
				onclick="addData()">添加</a> <a href="#" class="easyui-linkbutton"
				data-options="iconCls:'icons icons_24',plain:true"
				onclick="uiBtnOnClick(3)">编辑</a>
		</div>
	</div>
	<div data-options="region:'west',title:'部门列表',split:false"
		style="width: 250px;">
		<ul id="comTree"></ul>
	</div>
	<div data-options="region:'center',title:'部门详细信息'">
		<form id="form">
			<table class="grid">
				<tr>
					<th style="width: 20%; height: 23px">部门名称：</th>
					<td><span id="Label1"></span></td>
				</tr>
				<tr>
					<th>负责人：</th>
					<td><span id="Label2"></span></td>
				</tr>
				<tr>

					<th>联系电话：</th>
					<td><span id="Label3"></span></td>
				</tr>
				<tr>
					<th>邮箱：</th>
					<td> 
						<span id="Label4"></span>
					</td>
				</tr>
				<tr>
					<th>传真：</th>
					<td><span id="Label5"></span></td>
				</tr>
				<tr>
					<th>地址：</th>
					<td><span id="Label6"></span></td>
				</tr>
				<tr>
					<th>描述：</th>
					<td><span id="Label7"></span></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>