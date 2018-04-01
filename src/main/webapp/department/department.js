var treeNode;
$(function() {
	// 页面初始化加载树
	$('#comTree').tree({
		url : '../dep/getDepTree',
		lines : true,
		onClick : function(node) {
			onClikeTreeNode(node);
		}
	});
});
// 点击树节点，将信息回填到左侧
function onClikeTreeNode(node) {
	clearForm();
	treeNode = node;
	queryOne(node.id);
}
// 查询单个信息
function queryOne(id) {
	$.ajax({
		url : '../dep/queryOneDep?id=' + id,
		async : false,
		cache : false,
		success : function(data) {
			if (data) {
				$("#Label1").text(data.d_name);
				$("#Label2").text(data.d_fuzeren);
				$("#Label3").text(data.d_tel);
				$("#Label4").text(data.d_email);
				$("#Label5").text(data.d_fax);
				$("#Label6").text(data.d_add);
				$("#Label7").text(data.d_miaoshu);
			}
		}
	});
}

function clearForm() {
	$("#Label1").text("");
	$("#Label2").text("");
	$("#Label3").text("");
	$("#Label4").text("");
	$("#Label5").text("");
	$("#Label6").text("");
	$("#Label7").text("");
}

function collapseAll() {
	$('#comTree').tree('collapseAll');
}
function expandAll() {
	$('#comTree').tree('expandAll');
}
function uiBtnOnClick(id) {
	if (treeNode != null) {
		switch (id) {
		case 1:
			delData();
			break;
		case 3:
			editData();
			break;
		}
	} else {
		top.$.messager.alert('友情提示', '请选择部门！');

	}
}
// 删除一条记录
function delData() {
	if (treeNode.children.length > 0) {
		top.$.messager.alert('友情提示', '含有下级部门，不允许删除');
	} else {
		top.$.messager.confirm('确认', '确认删除?', function(row) {
			if (row) {
				$.ajax({
					url : '../dep/delDep?id=' + treeNode.id,
					success : function(data) {
						var msg = "成功删除。";
						if (data.success) {
							$('#comTree').tree('reload');// 刷新树
						} else {
							msg = "删除失败了。";
						}
						top.max.sysSlideShow({
							msg : msg
						});
					}
				});
			}
		});
	}
}

function editData() {
	top.max.showWindow({
		title : '编辑信息',
		iconCls : 'icon-edit',
		width : 700,
		height : 510,
		closed : false,
		cache : false,
		modal : true,
		url : 'department/depEdit.jsp',
		onLoad : function() {
			top.$('#CCTree').combotree({
				url : 'dep/getDepTree',
				required : true
			});
			loadXZQH();
			$.ajax({
				url : '../dep/queryOneDep?id=' + treeNode.id,
				async : false,
				cache : false,
				success : function(data) {
					if (data) {
						top.$("#form").form('load', data);
					}
				}
			});
		},
		buttons : [ {
			text : '保存',
			iconCls : 'icons icons_45',
			handler : function() {
				if (top.$("#form").form('enableValidation').form('validate')) {
					var data = getFormJson(top.$("#form"));
					var url = '../dep/editDep';
					$.ajax({
						cache : false,
						type : "POST",
						url : url,
						data : data,
						async : false,
						dataType : 'json',
						success : function(data) {
							if (data.success) {
								top.max.closeWindow();
								$('#comTree').tree('reload');// 刷新树
							} else {
								top.$.messager.alert('提示', '保存失败，请检查信息是否正确。');
							}
						}
					});
				} else {
					top.$.messager.alert('提示', '请检查信息是否正确。');
				}
			}
		}, {
			text : '关闭',
			handler : function() {
				top.max.closeWindow();
			}
		} ]
	});
}
function addData() {
	top.max.showWindow({
		title : '添加部门信息',
		iconCls : 'icon-add',
		width : 700,
		height : 510,
		url : 'department/depAdd.jsp',
		onLoad : function() {
			top.$('#CCTree').combotree({
				url : 'dep/getDepTree'
			});
			loadXZQH();
		},
		buttons : [ {
			text : '保存',
			iconCls : 'icons icons_45',
			handler : function() {
				saveAjax();
			}
		}, {
			text : '关闭',
			handler : function() {
				top.max.closedlg();
			}
		} ]
	});
}
// 保存公司信息
function saveAjax() {
	if (top.$("#form").form('enableValidation').form('validate')) {
		var data = getFormJson(top.$("#form"));
		var url = '../dep/saveDep';
		$.ajax({
			cache : false,
			type : "POST",
			url : url,
			data : data,
			async : false,
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					top.max.closeWindow();
					$('#comTree').tree('reload');// 刷新树
				} else {
					top.$.messager.alert('提示', '保存失败，请检查信息是否正确。');
				}
			}
		});
	} else {
		top.$.messager.alert('提示', '请检查信息是否正确。');
	}
}
function showimgPreview() {

	var img = $("#zjimage").html();
	if (img.length > 0) {
		$('#imgPreview').dialog({
			title : '证件图片',
			width : 460,
			height : 360,
			closed : false,
			cache : false,
			modal : true
		});
		$("#img").attr("src", img);
	}
}