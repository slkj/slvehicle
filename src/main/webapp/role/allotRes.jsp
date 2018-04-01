<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 	引入通用js css -->
<%@ include file="/common/taglibs.jsp"%>
<link href="../css/input.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	var tree;
	var mid;
	var Request = new Object();
	$(function() {
		Request = GetRequest();
		id = Request['id'];
		// 	alert(id);
		tree = $('#tt').tree({
			url : '../module/getCheckCombotree?roldId=' + id,
			method : 'GET',
			border : false,
			animate : true,
			checkbox : true,
			loadMsg : '正在加载请稍候...'
		});
	});
	function getChecked() {
		var nodes = $('#tt').tree('getChecked', [ 'checked', 'indeterminate' ]);
		var ids = [];
		for (var i = 0; i < nodes.length; i++) {
			ids.push(nodes[i].id);
		}
		if (ids.length > 0) {
			saveInfo(ids);
		} else {
			$.messager.alert('提示', '请选择分配资源!', 'warning');
		}
	}

	function saveInfo(ids) {
		var param = {
			roleid : id,
			ids : ids
		};
		$.ajax({
			url : "../role/saveRoleRes",
			type : "POST",
			data : param,
			async : false,
			dataType : "json",
			cache : false,
			success : function(data) {
				if (data.success) {
					top.max.sysSlideShow({
						msg : "授权成功"
					});
					parent.max.closedlg();
				} else {
					top.max.sysSlideShow({
						msg : "授权失败"
					});
				}
			}
		});
	}
</script>
</head>
<body>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icons icons_11',plain:true" onclick="getChecked()">保存</a> 
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="javascript:window.parent.max.closedlg();">关闭</a>
	</div>
	<div class="easyui-panel" style="height: 370px">
		<ul id="tt" class="easyui-tree"></ul>
	</div>
</body>
</html>