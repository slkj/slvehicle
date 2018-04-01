<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<!-- 	引入通用js css -->
<%@ include file="/common/taglibs.jsp"%></head>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var id;
	$(function() {
		var Request = new Object();
		Request = GetRequest();
		id = Request['id'];
		loaddata();
	});
	function loaddata() {
		$.ajax({
			url : '../role/queryOne',
			data : 'id=' + id,
			success : function(data) {
				$("#form").form('load', data);
				if (data.success) {
					alert(data.username);
				}
			}
		});
	}
	function save() {
		if ($("#form").form("validate")) {
			$.ajax({
				type : "POST",
				url : '../role/add',
				data : $('#form').serialize(),// 你的formid
				async : false,
				success : function(data) {
					if (data.success) {
						parent.max.sysSlideShow({
							msg : "操作成功。"
						});
						parent.grid.datagrid('load');
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
	function closeWindow() {
		parent.max.closedlg();
	}
</script>

<body>
	<form id="form" method="post" class="form">
		<input type="hidden" name="roleid" /> <input type="hidden"
			name="createdate" />
		<div id="dd">
			<table class="grid">
				<tr>
					<th align="right">角色名称：</th>
					<td><input class="easyui-validatebox" type="text"
						name="rolename" style="width: 300px"
						data-options="required:true,validType:'length[1,32]'" /></td>
				</tr>
				<tr>
					<th align="right">角色排序：</th>
					<td><input name="rolesort" class="easyui-numberspinner"
						data-options="required:true,min:0,max:100000" value="20"
						style="width: 200px;"></td>
				</tr>
				<tr>
					<th align="right">角色描述：</th>
					<td><input name="roledscript" style="width: 300px;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center"><a href="#"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="save()">保存</a>
						<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel',plain:true"
						onclick="closeWindow()">关闭</a></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>