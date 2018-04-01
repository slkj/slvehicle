<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员信息</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="../js/person/person.js"></script>

</head>
<body class="easyui-layout">
	<table id="persongrid"></table>
	<div id="toolbar" style="padding: 5px; height: auto">
		<div>
			<form id="searchForm">
				<table>
					<tr>
						<td>身份证号:</td>
						<td><input id="idcard_no" name="idcard_no"
							style="width: 100px;" /></td>
						<td>从业资格证号:</td>
						<td><input id="qualification_no" name="qualification_no"
							style="width: 100px;" /></td>
						<td>现服务车辆:</td>
						<td><input id="fwcl" name="fwcl" style="width: 100px;" /></td>
						<td><a id="btn" href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-search'">查询</a></td>
					</tr>
				</table>
			</form>
		</div>
		<table id="toolbar" cellspacing="0" cellpadding="0"></table>
	</div>
</body>
</html>