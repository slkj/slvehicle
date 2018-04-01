<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<%@ include file="common/taglibs.jsp"%>
<style type="text/css">
.title {
	font-size: 16px; font-weight: bold; padding: 20px 10px; background: #eee; overflow: hidden; border-bottom: 1px solid #ccc;
}

.t-list {
	
}
</style>
<script type="text/javascript" src="js/lib/jquery.portal.js"></script>
<script type="text/javascript" src="js/home.js"></script>
</head>
<body class="easyui-layout">
	<div region="north" class="title" border="false"  style="height: 80px">
		欢迎 ${userSession.username } 使用 神龙企业信息化平台管理系统 <br /> 选择车辆管理类录入保存车辆基本信息
		--> 车辆业务中录入保存车辆卫星定位服务、行驶证、运输证、二保等信息。
		<br /> *短信提醒暂未开放
	</div>
	<div region="center" border="false">
		<div id="pp" style="position: relative">
			<div style="width: 33%;">
				<div title="行驶证年检" collapsible="true" closable="true"
					style="height: 200px;">
					<table id="xsznj" class="easyui-datagrid"
						style="width: 650px; height: auto">
					</table>
				</div>
				<div title="卫星定位服务" collapsible="true" closable="true"
					style="height: 200px;">
					<table id="wxdw" class="easyui-datagrid"
						style="width: 650px; height: auto">
					</table>
				</div>
				
			</div>
			<div style="width: 33%;">
				<div title="车辆运输证检验" iconCls="icon-search" closable="true"
					style="height: 200px;">
					<table id="ysznj" class="easyui-datagrid"
						style="width: 650px; height: auto">
					</table>
				</div>
				<div title="车辆二级维护" iconCls="icon-search" closable="true"
					style="height: 200px;">
					<table id="ejwh" class="easyui-datagrid"
						style="width: 650px; height: auto">
					</table>
				</div>
			</div>

			<div style="width: 33%;">
				<div title="车辆保险" collapsible="true" closable="true"
					style="height: 200px;">
					<table id="clbx" class="easyui-datagrid"
						style="width: 650px; height: auto">
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>