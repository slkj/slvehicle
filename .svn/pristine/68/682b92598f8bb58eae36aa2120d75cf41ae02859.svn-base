<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加模块</title>
<%@ include file="/common/taglibs.jsp"%>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

	$(function() {
		$('#cc').combotree({
			url : '../module/getCombotree',
			method : 'GET'
		});
		var Request = new Object();
		Request = GetRequest();
		id = Request['id'];
		loadData(id);
	});
	function loadData(id) {
		$.ajax({
			type : "POST",
			url : '../module/queryOne/' + id,
			async : false,
			cache : false,
			success : function(data) {
				if (data) {
					$("#form").form('load', data);
				}
			}
		});
	}
	function closeWindow() {
		parent.max.closedlg();
	}
	function save() {
		if ($("#form").form("validate")){
			$.ajax({
				type : "POST",
				url : '../module/editModule',
				data : $('#form').serialize(),// 你的formid
				async : false,
				success : function(data) {
					if (data) {
						parent.max.sysSlideShow({
							msg : "操作成功。"
						});
						parent.grid.treegrid('load');
						closeWindow();
					} else {
						parent.max.sysSlideShow({
							msg : "保存失败。"
						});
					}
				}
			});
		}
	}
</script>
</head>
<body>
	
	<form id="form" method="post" class="form">
		<div id="dd">
		<input id="id" name="id" type="hidden" />
		<table class="grid">
			<tr>
				<th style="width: 80px">资源名称：</th>
				<td><input name="name" style="width: 300px"
					class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			<tr>
				<th>资源路径：</th>
				<td><input class="easyui-textbox" name="url"
					style="width: 300px"></td>
			</tr>
			<tr>
				<th>资源类型：</th>
				<td>
					<select class="easyui-combobox" id="type" name="type" editable="false" style="width: 150px;">
							<option value="菜单">菜单</option>
							<option value="功能">功能</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>上级资源：</th>
				<td><input id="cc"  name="parent_id"
					style="width: 300px"></td>
			</tr>
			
			<tr>
				<th>图标：</th>
				<td><input class="easyui-textbox" name="icon"
					style="width: 300px"></td>
			</tr>
			<tr>
				<th>顺序：</th>
				<td><input type="text" name="priority" class="easyui-numberbox"
					value="99" data-options="min:0"></input></td>
			</tr>
			<tr>
				<th>描述：</th>
				<td><input class="easyui-textbox" name="description"
					data-options="multiline:true" style="height: 60px; width: 300px"></input></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="save()">保存</a> <a href="#" class="easyui-linkbutton"
					data-options="iconCls:'icon-cancel',plain:true" onclick="closeWindow()">关闭</a></td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>