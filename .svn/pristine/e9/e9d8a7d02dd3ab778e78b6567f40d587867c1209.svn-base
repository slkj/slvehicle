var url = "../global/list";
$(function() {
	var Request = new Object();
	Request = GetRequest();
	moduleId = Request['moduleId'];
	toolbar();
	getData();
});
function getData() {
	$('#grid').datagrid(
			{
				width : 'auto',
				height : 'auto',
				url : url,
				fit : true,
				nowrap : true, // false:折行
				rownumbers : true, // 行号
				striped : true, // 隔行变色
				singleSelect : true, // 只允许选择一行
				pagination : true,
				pageSize : 15,
				pageList : [ 1, 10, 15, 20, 30, 50 ],
				loadMsg : '数据加载中,请稍后……',
				rowStyler : function(index, row) {
					var comDay = 20;
					if (row.endriqi != null ) {
						var curDate = DateUtil.curentTime();
						if(row.endriqi > curDate){
							return
						}
						var days = DateUtil.DiffLong(row.endriqi,curDate) ;
						if(days > comDay){
							return 'color:#FF4040;font-weight:bold;';
						}
					}
				},
				columns : [ [
						{
							title : '车牌号',
							field : 'carNumber',
							formatter : function(value, row) {
								return '<a id="' + row.id
										+ '" href="javascript:void(0);" onclick="view(\'' + row.vId
										+ '\')">' + value + '</a> ';
							}
						},
						{
							title : '运营商',
							field : 'facilitator'
						},
						{
							title : '终端ID',
							field : 'zdid'
						},
						{
							title : '终端型号',
							field : 'zdtype'
						},
						{
							title : 'SIM卡',
							field : 'facilitator'
						},
						{
							title : '安装单位',
							field : 'install'
						},
						{
							title : '安装人',
							field : 'installer'
						},
						{
							title : '安装日期',
							field : 'installriqi'
						},
						{
							title : '维保日期',
							field : 'endriqi'
						},
						{
							title : '安装证明编号',
							field : 'azzm'
						},
						{
							title : '证明编号',
							field : 'qzsyzm'
						},
						{
							title : '备注',
							field : 'remark'
						},
						{
							title : '操作',
							field : '_operate',
							align : 'center',
							formatter : function(value, row, index) {
								var s = "";
								if (row.installriqi != null) {
									s = '<a href="#" class="roleCls" onclick="view(\'' + row.vId
											+ '\')">详细</a> ';
								}
								return s;
							}
						} ] ],
				toolbar : "#toolbar",
				onLoadSuccess : function() {
					$('#grid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					$('.roleCls').linkbutton({
						text : '详细 ',
						plain : true,
						iconCls : 'icons_35'
					});
				}
			});
	// 设置分页控件
	$('#grid').datagrid('getPager').pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
	$("#btn").click(function() {
		$('#grid').datagrid("load", {
			"carNumber" : $("#carNumber").val(),
			"endDate" : $('#endDate').val(),
			"endDate1" : $('#endDate1').val(),
			"regCompanyId" : $('#regCompanyId').val()
		});
		// 清空表单
		$('#searchForm').form('clear');
	});
}

function toolbar() {
	$.ajax({
		url : "../module/toolbar?pid=" + moduleId + "&rnd=" + Math.random(),
		async : false,
		dataType : 'json',
		success : function(data) {
			getMenuItems(data);
		}
	});
}
// 初始化
function getMenuItems(data) {
	var str = "<tr>";
	$.each( data, function(i, o) {
		str += "<td><a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'"
				+ o.icon
				+ "',plain:true\" onclick=\""
				+ o.url
				+ "()\">"
				+ o.name
				+ "</a></td>";
	});
	str += "</tr>"
	var targetObj = $("#toolbars").append(str);
	$.parser.parse(targetObj);
}
//判断是否选择行，返回这一行数据 obj
function checkRows() {
	var selRow = $('#grid').datagrid("getSelections");// 返回选中多行
	if (selRow.length != 1) {
		top.$.messager.alert('提示', '请选择一行数据!', 'info');
		return false;
	}
	return selRow[0];
}
//删除操作
function delFun() { 
	if (!checkRows()) {
		return;
	}
	var obj = checkRows();
	if (obj.id == null) {
		return;
	}
	top.$.messager.confirm('提示', '将删除该车辆所有卫星安装信息，确认删除?', function(row) {
		if (row) {
			$.ajax({
				url : '../global/delete?id=' + obj.id,
				success : function(data) {
					if (data) {
						$('#grid').datagrid('load');
						top.max.sysSlideShow({
							msg : '成功删除!'
						});
					} else {
						top.$.messager.alert('提示', '删除失败，请联系管理员。');
					}
				}
			});
		}
	})
}

//弹出添加页面
function addFun() {
	if (!checkRows()) {
		return;
	}
	var obj = checkRows();
	top.max.showWindow({
		title : '设备使用入网证明',
		iconCls : 'icon-add',
		width : 800,
		height : 550,
		url : 'global/addGlobal.jsp',
		onLoad : function() {
			// ajax查询单个信息，form回填数据
			$.ajax({
				url : '../vehicle/queryOne?id=' + obj.vId,
				async : false,
				cache : false,
				success : function(data) {
					if (data) {
						top.$("#form").form('load', data);
						top.$("#vId").val(data.id);
						top.$("#carNumber").text(data.carNumber);
						top.$("#regCompanyName").text(data.regCompanyName);
						top.$("#address").text(data.address);
						top.$("#wkcc").text(
								data.carOutLength + "*" + data.carOutWidth + "*"
										+ data.carOutHeight);
						top.$("#ppxh").text(data.carBrand + data.carModel);
						top.$("#cllx").text(data.classify + data.carType);
						top.$("#carVin").text(data.carVin);
						top.$("#carEngNum").text(data.carEngNum);
						top.$("#carApprGuest").text(data.carApprGuest);
						top.$("#carTotalmass").text(data.carTotalmass);
						top.$("#carTrac").text(data.carTrac);
						top.$("#carNumbers").text(data.carNumber);
					}
				}
			});
			//修改从后台获取数据
			top.$('#install').combotree({
				url : 'dep/getDepTree',
				valueField : 'id',
				textField : 'text'
			});
		},
		buttons : [ {
			text : '保存',
			iconCls : 'icons_45',
			handler : function() {
				var url = '../global/saveGlobal';
				saveAjax(url);
			}
		}, {
			text : '关闭',
			handler : function() {
				top.max.closedlg();
			}
		} ]
	});
};
// ajax 表单提交审验信息
function saveAjax(url) {
	if (top.$("#dform").form('enableValidation').form('validate')) {
		var data = getFormJson(top.$("#dform"));
		$.ajax({
			cache : false,
			type : "POST",
			url : url,
			data : data,
			async : false,
			dataType : 'json',
			success : function(data) {
				if (data) {
					top.max.closeWindow();
					$('#grid').datagrid('load');
					top.max.sysSlideShow({
						msg : '保存成功'
					});
				} else {
					top.$.messager.alert('提示', '保存失败，请检查信息是否正确。');
				}
			}
		});
	}
}
//编辑
function editFun() {
	if (!checkRows()) {
		return;
	}
	var obj = checkRows();
	if (obj.id == null) {
		top.$.messager.alert('提示', '该车辆没有行驶证信息，请录入行驶证信息。');
		return;
	}
	top.max.showWindow({
		title : '添加车辆行驶信息',
		iconCls : 'icon-edit',
		width : 800,
		height : 550,
		url : 'global/editGlobal.jsp',
		onLoad : function() {
			// ajax查询车辆单个信息，form回填数据
			$.ajax({
				url : '../vehicle/queryOne?id=' + obj.vId,
				async : false,
				cache : false,
				success : function(data) {
					if (data) {
						top.$("#form").form('load', data);
						top.$("#vId").val(data.id);
						top.$("#carNumber").text(data.carNumber);
						top.$("#regCompanyName").text(data.regCompanyName);
						top.$("#address").text(data.address);
						top.$("#wkcc").text(
								data.carOutLength + "*" + data.carOutWidth + "*"
										+ data.carOutHeight);
						top.$("#ppxh").text(data.carBrand + data.carModel);
						top.$("#cllx").text(data.classify + data.carType);
						top.$("#carVin").text(data.carVin);
						top.$("#carEngNum").text(data.carEngNum);
						top.$("#carApprGuest").text(data.carApprGuest);
						top.$("#carTotalmass").text(data.carTotalmass);
						top.$("#carTrac").text(data.carTrac);
//						top.$("#carNumbers").text(data.carNumber);
					}
				}
			});
			$.ajax({
				url : '../global/queryOne?id=' + obj.id,
				async : false,
				cache : false,
				success : function(data) {
					if (data) {
						top.$("#dform").form('load', data);
						top.$("#remark").innerText=data.remark;
					}
				}
			});

		},
		buttons : [ {
			text : '保存',
			iconCls : 'icons_45',
			handler : function() {
				var url = '../global/editGlobal';
				saveAjax(url);
			}
		}, {
			text : '关闭',
			handler : function() {
				top.max.closedlg();
			}
		} ]
	});
}

//安装记录
function sbaz() {
	if (!checkRows()) {
		return;
	}
	var obj = checkRows();
	if (obj.id == null) {
		top.$.messager.alert('提示', '该车辆没有安装定位信息。');
		return;
	}
	top.max.showWindow({
		title : '安装历史信息',
		iconCls : 'icons_26',
		width : 650,
		height : 400,
		url : 'global/record.jsp',
		onLoad : function() {
			top.$('#facdg').datagrid({
				url : 'global/listByVid?vId=' + obj.vId,
				width : 'auto',
				height : 'auto',
				fit : true,
				nowrap : true, // false:折行
				rownumbers : true, // 行号
				striped : true, // 隔行变色
				singleSelect : true, // 只允许选择一行
				pagination : true,
				pageSize : 15,
				pageList : [ 1, 10, 15, 20, 30, 50 ],
				loadMsg : '数据加载中,请稍后……',
				columns : [ [ {
					field : 'carNumber',
					title : '车牌号'
				}, {
					title : '运营商',
					field : 'facilitator'
				},
				{
					title : '终端ID',
					field : 'zdid'
				},
				{
					title : '终端型号',
					field : 'zdtype'
				},
				{
					title : 'SIM卡',
					field : 'facilitator'
				},
				{
					title : '安装单位',
					field : 'install'
				},
				{
					title : '安装人',
					field : 'installer'
				},
				{
					title : '安装日期',
					field : 'installriqi'
				},
				{
					title : '维保日期',
					field : 'endriqi'
				},
				{
					title : '安装证明编号',
					field : 'azzm'
				},
				{
					title : '证明编号',
					field : 'qzsyzm'
				}] ]
			});
			// 设置分页控件
			top.$('#facdg').datagrid('getPager').pagination({
				beforePageText : '第',// 页数文本框前显示的汉字
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});
		},
		buttons : [ {
			text : '关闭',
			handler : function() {
				top.max.closedlg();
			}
		} ]
	});
}