$(function() {
	initDataGrid();
	$("#btn").click(function() {
		$('#grid').datagrid("load", {
			gsmc : $("#gsmc").val(),
			"location" : $("#cregicounty").val()
		});
		// 清空表单
		$('#searchForm').form('clear');
	});
});
function initDataGrid() {
	$('#grid').datagrid(
			{
				width : 'auto',
				height : 'auto',
				method : 'post',
				url : '../company/list',
				fit : true,
				nowrap : true, // false:折行
				rownumbers : true, // 行号
				striped : true, // 隔行变色
				singleSelect : true, // 只允许选择一行
				pagination : true,
				pageSize : 15,
				pageList : [ 1, 10, 15, 20, 30, 50 ],
				loadMsg : '数据加载中,请稍后……',
				columns : [ [
						{
							title : '单位名称',
							field : 'gsmc',
							formatter : function(value, row) {
								return '<a id="' + row.id
										+ '" href="javascript:void(0);" onclick="view(\'' + row.id
										+ '\')">' + value + '</a> ';
							}
						},
						{
							title : '联系人',
							field : 'lxr'
						},
						{
							title : '联系电话',
							field : 'lxdh'
						},
						{
							title : '所属区/县',
							field : 'localname'
						},
						{
							title : '法人代表',
							field : 'frdb'
						},
						{
							title : '证件类型',
							field : 'zjlx'
						},
						{
							title : '证件号',
							field : 'zjbm'
						},
						{
							title : '经济类型',
							field : 'jjlx'
						},
						{
							title : '经营许可证号',
							field : 'jyxkzh'
						},
						{
							title : '操作',
							field : '_operate',
							align : 'center',
							formatter : function(value, row, index) {
								var s = '<a href="#" class="roleCls" onclick="view(\'' + row.id
										+ '\')">详细</a> ';
								return s;
							}
						} ] ],
				toolbar : "#toolbar",
				onLoadSuccess : function() {
					$('#dg').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					$('.roleCls').linkbutton({
						text : '详细 ',
						plain : true,
						iconCls : 'icons icons_35'
					});
				}
			});
	// 设置分页控件
	$('#grid').datagrid('getPager').pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
}
// 弹出添加页面
function addFun() {
	top.max.showWindow({
		title : '添加公司信息',
		iconCls : 'icon-add',
		width : 700,
		height : 510,
		url : 'company/add.jsp',
		onLoad : function() {
			loadXZQH();
		},
		buttons : [ {
			text : '保存',
			iconCls : 'icons icons_45',
			handler : function() {
				saveCompany();
			}
		}, {
			text : '关闭',
			handler : function() {
				top.max.closedlg();
			}
		} ]
	});
};
// 保存公司信息
function saveCompany() {
	if (top.$("#form").form('enableValidation').form('validate')) {
		var data = getFormJson(top.$("#form"));
		var url = '../company/save';
		$.ajax({
			cache : false,
			type : "POST",
			url : url,
			data : data,
			async : false,
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					// top.$('#popWin').dialog('close');
					top.max.closeWindow();
					$('#grid').datagrid('load');
				} else {
					$.messager.alert('提示', '保存失败，请检查信息是否正确。');
				}
			}
		});
	}
}
function del(id, index) { // 删除操作
	var rows = $('#grid').datagrid('getSelected');
	// 判断是否选择行
	if (!rows) {
		$.messager.alert('提示', '请选择要删除的数据!', 'info');
		return;
	}
	$.messager.confirm('确认', '确认删除?', function(row) {
		if (row) {
			$.ajax({
				url : 'delete?id=' + rows.id,
				success : function(data) {
					var msg = "成功删除。";
					if (data.success) {
						$('#grid').datagrid('deleteRow', index);
					} else {
						msg = "删除失败了。";
					}
					top.max.sysSlideShow({
						msg : msg
					});
				}
			});
		}
	})
}
function edit(id) {
	var rows = $('#grid').datagrid('getSelected');
	// 判断是否选择行
	if (!rows) {
		$.messager.alert('提示', '请选择要编辑的数据!', 'info');
		return;
	}
	top.max.showWindow({
		title : '编辑公司信息',
		iconCls : 'icon-edit',
		width : 700,
		height : 500,
		closed : false,
		cache : false,
		modal : true,
		url : 'company/edit.jsp',
		onLoad : function() {
			loadXZQH();
			$.ajax({
				url : '../company/queryOne?id=' + rows.id,
				async : false,
				cache : false,
				success : function(data) {
					if (data) {
						top.$("#form").form('load', data);
						top.$("#localname").text(data.localname);
						top.$("#img").attr("src",data.zjimage);
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
					var url = '../company/editCompany';
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
								$('#grid').datagrid('load');
							} else {
								$.messager.alert('提示', '保存失败，请检查信息是否正确。');
							}
						}
					});
				}
			}
		}, {
			text : '关闭',
			handler : function() {
				top.max.closeWindow();
			}
		} ]
	});
};
function view(id) {
	top.max.showWindow({
		title : '公司/车队信息',
		iconCls : 'icon-search',
		width : 700,
		height : 500,
		closed : false,
		cache : false,
		modal : true,
		url : 'company/view.jsp',
		onLoad : function() {
			$.ajax({
				url : '../company/queryOne?id=' + id,
				async : false,
				cache : false,
				success : function(data) {
					if (data) {
						top.$('#form input').attr("readonly", "true");
						top.$('#jjlx').combobox("disable", "false");
						top.$('#zjlx').combobox("disable", "false");
						top.$("#form").form('load', data);
						top.$("#img").attr("src",data.zjimage);
					}
				}
			});
		},
		buttons : [ {
			text : '关闭',
			handler : function() {
				top.max.closeWindow();
			}
		} ]
	});
};