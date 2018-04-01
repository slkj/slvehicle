<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆列表</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="../js/SL.common.js"></script>
<script type="text/javascript" src="../js/vehicle.js"></script>
</head>
<body>
	<table id="dg"></table>
	<div id="toolbar" style="padding: 5px; height: auto">
		<div>
			<form id="searchForm">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td>车牌号:</td>
						<td><input id="carNumber" class="easyui-textbox" style="width: 150px"></td>
						<td style="width: 10px;"></td>
						<td>车辆识别代号:</td>
						<td><input id="carVin" class="easyui-textbox" style="width: 150px"></td>
						<td style="width: 10px;"></td>
						<td>归属单位:</td>
						<td><input id="ownedId" name="ownedId" style="width: 200px;" /></td>
						<td style="width: 10px;"></td>
						<td><a id="btn" href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-search',plain:'true'">查询</a></td>
					</tr>
				</table>
			</form>
		</div>
		<table id="toolbar" cellspacing="0" cellpadding="0">
<!-- 			<tr> -->
<!-- 				<td><a href="javascript:void(0)" class="easyui-linkbutton" -->
<!-- 					data-options="iconCls:'icons icons_11',plain:true" -->
<!-- 					onclick="addFun()">添加</a></td> -->
<!-- 				<td><div class="datagrid-btn-separator"></div></td> -->
<!-- 				<td><a href="javascript:void(0)" class="easyui-linkbutton" -->
<!-- 					data-options="iconCls:'icons icons_24',plain:true" -->
<!-- 					onclick="edit()">编辑</a></td> -->
<!-- 				<td><div class="datagrid-btn-separator"></div></td> -->
<!-- 				<td><a href="javascript:void(0)" class="easyui-linkbutton" -->
<!-- 					data-options="iconCls:'icons icons_12',plain:true" -->
<!-- 					onclick="del()">删除</a></td> -->
<!-- 				<td><div class="datagrid-btn-separator"></div></td> -->
<!-- 				<td><a href="javascript:void(0)" class="easyui-linkbutton" -->
<!-- 					data-options="iconCls:'icons icons_91',plain:true" -->
<!-- 					onclick="auditFun(3)">审核</a></td> -->
<!-- 				<td><div class="datagrid-btn-separator"></div></td> -->
<!-- 				<td><a href="javascript:void(0)" class="easyui-linkbutton" -->
<!-- 					data-options="iconCls:'icons icons_91',plain:true" -->
<!-- 					onclick="auditFun(4)">驳回</a></td> -->
<!-- 			</tr> -->
		</table>
	</div>
</body>

</html>