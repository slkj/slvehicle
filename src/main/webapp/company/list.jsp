<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公司信息</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="../js/company.js"></script>
<script type="text/javascript" src="../js/city.js"></script>
<script type="text/javascript" src="../js/SL.common.js"></script>
</head>
<body>
	<table id="grid"></table>
	<div id="toolbar" style="padding: 5px; height: auto">
		<div>
			<form id="searchForm">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td>单位名称:</td>
						<td><input id="gsmc" class="easyui-textbox"
							style="width: 150px"></td>
						<td>所在地区:</td>
						<td><input name="province" id="province"
							style="width: 120px;" /> <input name="city" id="city"
							style="width: 120px;" /> <input name="county" id="county"
							style="width: 120px;" /> <input type="hidden" name="location"
							id="cregicounty" /></td>
						<td><a id="btn" class="easyui-linkbutton"
							data-options="iconCls:'icon-search',plain:'true'">查询</a></td>

					</tr>
				</table>
				<table>
				
					<tr>
						<td><a href="javascript:void(0)" class="easyui-linkbutton"
							data-options="iconCls:'icons icons_11',plain:true"
							onclick="addFun()">添加</a></td>
						<td>
							<div class="datagrid-btn-separator"></div>
						</td>
						<td><a href="javascript:void(0)" class="easyui-linkbutton"
							data-options="iconCls:'icons icons_24',plain:true"
							onclick="edit()">编辑</a></td>
						<td>
							<div class="datagrid-btn-separator"></div>
						</td>
						<td><a href="javascript:void(0)" class="easyui-linkbutton"
							data-options="iconCls:'icons icons_12',plain:true"
							onclick="del()">删除</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>