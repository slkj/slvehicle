$(function() {
	$('#pp').portal({
		border : false,
		fit : true
	});

	loadDW();
	loadEB();
	loadBX();
	loadXSZ();
	loadYSZ();
});
function add() {
	for (var i = 0; i < 3; i++) {
		var p = $('<div/>').appendTo('body');
		p.panel({
			title : 'Title' + i,
			content : '<div style="padding:5px;">Content' + (i + 1) + '</div>',
			height : 100,
			closable : true,
			collapsible : true
		});
		$('#pp').portal('add', {
			panel : p,
			columnIndex : i
		});
	}
	$('#pp').portal('resize');
}
function remove() {
	$('#pp').portal('remove', $('#pgrid'));
	$('#pp').portal('resize');
}
function loadDW() {
	$('#wxdw').datagrid(
			{
				width : 'auto',
				height : 'auto',
				url : 'global/getExpires',
				fit : true,
				nowrap : true, // false:折行
				rownumbers : true, // 行号
				striped : true, // 隔行变色
				singleSelect : true, // 只允许选择一行
				border : false,
				singleSelect : true,
				pagination : true,
				pageSize : 15,
				pageList : [ 1, 10, 15, 20, 30, 50 ],
				loadMsg : '数据加载中,请稍后……',
				columns : [ [
						{
							width : '150',
							title : '车牌号',
							field : 'carNumber',
							formatter : function(value, row) {
								return '<a id="' + row.id
										+ '" href="javascript:void(0);" onclick="view(\'' + row.vId
										+ '\')">' + value + '</a> ';
							}
						}, {
							title : '到期时间',
							field : 'endriqi'
						}, {
							title : '短信提醒',
							field : '_oper',
							formatter : function(value, row, index) {
								return '<a href="#" class="btn_tx" onclick="">提醒</a> ';
							}
						} ] ],
				onLoadSuccess : function() {
					$('#grid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					$('.btn_tx').linkbutton({
						text : '提醒 ',
						plain : true,
						iconCls : 'icons_48'
					});
				}
			});
	// 设置分页控件
	$('#wxdw').datagrid('getPager').pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
}
function loadEB() {
	$('#ejwh').datagrid(
			{
				width : 'auto',
				height : 'auto',
				url : 'second/getExpires',
				fit : true,
				nowrap : true, // false:折行
				rownumbers : true, // 行号
				striped : true, // 隔行变色
				singleSelect : true, // 只允许选择一行
				border : false,
				singleSelect : true,
				pagination : true,
				pageSize : 15,
				pageList : [ 1, 10, 15, 20, 30, 50 ],
				loadMsg : '数据加载中,请稍后……',
				columns : [ [
						{
							width : '150',
							title : '车牌号',
							field : 'viotureNumber',
							formatter : function(value, row) {
								return '<a id="' + row.id
										+ '" href="javascript:void(0);" onclick="view(\'' + row.vId
										+ '\')">' + value + '</a> ';
							}
						}, {
							title : '到期时间',
							field : 'nextriqi'
						}, {
							title : '短信提醒',
							field : '_oper',
							formatter : function(value, row, index) {
								return '<a href="#" class="btn_tx" onclick="">提醒</a> ';
							}
						} ] ],
				onLoadSuccess : function() {
					$('#grid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					$('.btn_tx').linkbutton({
						text : '提醒 ',
						plain : true,
						iconCls : 'icons_48'
					});
				}
			});
	// 设置分页控件
	$('#ejwh').datagrid('getPager').pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
}
function loadBX() {
	$('#clbx').datagrid(
			{
				width : 'auto',
				height : 'auto',
				url : 'insurance/getExpires',
				fit : true,
				nowrap : true, // false:折行
				rownumbers : true, // 行号
				striped : true, // 隔行变色
				singleSelect : true, // 只允许选择一行
				border : false,
				singleSelect : true,
				pagination : true,
				pageSize : 15,
				pageList : [ 1, 10, 15, 20, 30, 50 ],
				loadMsg : '数据加载中,请稍后……',
				columns : [ [
						{
							width : '150',
							title : '车牌号',
							field : 'viotureNumber',
							formatter : function(value, row) {
								return '<a id="' + row.id
										+ '" href="javascript:void(0);" onclick="view(\'' + row.vId
										+ '\')">' + value + '</a> ';
							}
						}, {
							title : '到期时间',
							field : 'endTime'
						}, {
							title : '短信提醒',
							field : '_oper',
							formatter : function(value, row, index) {
								return '<a href="#" class="btn_tx" onclick="">提醒</a> ';
							}
						} ] ],
				onLoadSuccess : function() {
					$('#grid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					$('.btn_tx').linkbutton({
						text : '提醒 ',
						plain : true,
						iconCls : 'icons_48'
					});
				}
			});
	// 设置分页控件
	$('#clbx').datagrid('getPager').pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
}
function loadXSZ() {
	$('#xsznj').datagrid(
			{
				width : 'auto',
				height : 'auto',
				url : 'driving/getExpires',
				fit : true,
				nowrap : true, // false:折行
				rownumbers : true, // 行号
				striped : true, // 隔行变色
				singleSelect : true, // 只允许选择一行
				border : false,
				singleSelect : true,
				pagination : true,
				pageSize : 15,
				pageList : [ 1, 10, 15, 20, 30, 50 ],
				loadMsg : '数据加载中,请稍后……',
				columns : [ [
						{
							width : '150',
							title : '车牌号',
							field : 'carNumber',
							formatter : function(value, row) {
								return '<a id="' + row.id
										+ '" href="javascript:void(0);" onclick="view(\'' + row.vId
										+ '\')">' + value + '</a> ';
							}
						}, {
							title : '到期时间',
							field : 'endDate'
						}, {
							title : '短信提醒',
							field : '_oper',
							formatter : function(value, row, index) {
								return '<a href="#" class="btn_tx" onclick="">提醒</a> ';
							}
						} ] ],
				onLoadSuccess : function() {
					$('#grid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					$('.btn_tx').linkbutton({
						text : '提醒 ',
						plain : true,
						iconCls : 'icons_48'
					});
				}
			});
	// 设置分页控件
	$('#xsznj').datagrid('getPager').pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
}
function loadYSZ() {
	$('#ysznj').datagrid(
			{
				width : 'auto',
				height : 'auto',
				url : 'transport/getExpires',
				fit : true,
				nowrap : true, // false:折行
				rownumbers : true, // 行号
				striped : true, // 隔行变色
				singleSelect : true, // 只允许选择一行
				border : false,
				singleSelect : true,
				pagination : true,
				pageSize : 15,
				pageList : [ 1, 10, 15, 20, 30, 50 ],
				loadMsg : '数据加载中,请稍后……',
				columns : [ [
						{
							width : '150',
							title : '车牌号',
							field : 'carNumber',
							formatter : function(value, row) {
								return '<a id="' + row.id
										+ '" href="javascript:void(0);" onclick="view(\'' + row.vId
										+ '\')">' + value + '</a> ';
							}
						}, {
							title : '到期时间',
							field : 'endDate'
						}, {
							title : '短信提醒',
							field : '_oper',
							formatter : function(value, row, index) {
								return '<a href="#" class="btn_tx" onclick="">提醒</a> ';
							}
						} ] ],
				onLoadSuccess : function() {
					$('#grid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					$('.btn_tx').linkbutton({
						text : '提醒 ',
						plain : true,
						iconCls : 'icons_48'
					});
				}
			});
	// 设置分页控件
	$('#ysznj').datagrid('getPager').pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
}