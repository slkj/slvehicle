<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>年检记录信息</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="../js/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/global.js">
	
</script>
</head>
<body>
	<table id="grid"></table>
	<div id="toolbar" style="padding: 5px; height: auto">
		<form id="searchForm">
			<table>
				<tr>
					<td>车牌号:</td>
					<td><input id="sel" name="carnumber" style="width: 100px;" />
					</td>
					<td>车辆所在公司:</td>
					<td><input id="cc" name="companyid" style="width: 100px;" />
					</td>
					<td>安装日期:</td>
					<td><input class="Wdate" type="text" id="startDate"
						onClick="WdatePicker()" />至 <input class="Wdate" type="text"
						id="endDate" onClick="WdatePicker()" /></td>
					<td><a id="btn" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a>
				</tr>
			</table>
		</form>

		<table id="toolbars" cellspacing="0" cellpadding="0"></table>
		<div style="color: #F00">【①点击车牌号查询车辆详细信息，②红色标记是需要维保的车辆】</div>
	</div>
</body>
</html>