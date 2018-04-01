var title, carUseNatu,depId;
$(function() {
	
	var Request = new Object();
	Request = GetRequest();
	title = Request['title'];
	// 类型名称
	title = decodeURI(decodeURI(title));
	// 类型编码
	carUseNatu = Request['carUseNatu'];
	$("#ownedId").combobox({
		url : '../company/queryComList',
		editable : false, cache : false,
		valueField : 'id',textField : 'gsmc'
	});
	depId = Request['depId'];
	moduleId = Request['moduleId'];
	toolbar();
	// 初始化页面
	initDataGrid();
});
function toolbar() {
	$.ajax({
		url : "../module/toolbar?pid="+moduleId+"&rnd=" + Math.random(),
		async : false,
		dataType : 'json',
		success : function(data) {
			getMenuItems(data);
		}
	});
}
function getMenuItems(data){
	var str="<tr>";
	$.each(data, function(i, o) {
		str +="<td><a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icons "+o.icon+"',plain:true\" onclick=\""+o.url+"()\">"+o.name+"</a></td>";
	});
	str +="</tr>"
	var targetObj=$("#toolbar").append(str);
	$.parser.parse(targetObj);
}
function initDataGrid() {
	var url ="../vehicle/list?1=1";
	if(typeof(carUseNatu) != "undefined"){
		url +='&carUseNatu='+carUseNatu;
	}
	if(typeof(depId) != "undefined"){
		url +='&depId='+depId;
	}
	$('#dg').datagrid({
			width : 'auto',
			height : 'auto',
			method : 'post',
			url : url,
			fit : true,
			nowrap : true, // false:折行
			rownumbers : true, // 行号
			striped : true, // 隔行变色
			singleSelect:true, //只允许选择一行
			pagination : true,
			pageSize : 15,
			pageList : [ 1, 10, 15, 20, 30, 50 ],
			loadMsg : '数据加载中,请稍后……',
			fitColumns : true,
			frozenColumns : [ [
					{
						title : '车牌号(主)',
						field : 'carNumber',
						formatter : function(value, row) {
							return '<a id="' + row.id
									+ '" href="javascript:void(0);" onclick="view(\'' + row.id
									+ '\')">' + value + '</a> ';
						}
					}, ] ],
			columns : [ [
						{title:'车辆基本信息',colspan:7},
						{title:'车辆业务',colspan:6}
					],[
					   
						{title : '业户名称',field : 'regCompanyName'},
						{title : '车辆识别代号',field : 'carVin'},
						{title : '归属单位 ',field : 'ownedName',
							formatter : function(value, row, index) {
								return '<a href="javascript:void(0);" onclick="showCompany(\'' + row.id + '\')">'+value+'</a> ';
							}
						},
						{title : '联系人',field : 'txtContactMenber'},
						{title : '联系电话',field : 'txtContactWay'},
						{title : '状态',field : 'status'},
						{title : '登记日期',field : 'regDate'},
						{title : '行驶证',field : 'drivingDate'},
						{title : '运输证',field : 'transportDate'},
						{title : '二保',field : 'secondDate'},
						{title : '卫星定位',field : 'globalDate'},
						{title : '保险',field : 'personDate'},
						{title : '变更记录',field : 'transferDate'},
						{title : '录入人',field : 'entryName'},
						{title : '录入时间',field : 'entryTime'},
						{title : '操作', field : '_operate', align : 'center',
							formatter : function(value, row, index) {
								var s = '<a href="#" class="roleCls" onclick="view(\'' + row.id
										+ '\')">详细</a> ';
								// var e = '<a href="#" class="editCls"
								// onclick="edit(\''+ row.id + '\')">编辑</a> ';
								// var d = '<a href="#" class="delCls"
								// onclick="del(\''+ row.id
								// +'\',\''+index+'\')">删除</a> ';
								return s;
							}
						}
					]],
			toolbar : "#toolbar",
			onLoadSuccess : function() {
				$('#dg').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
//				$('.editCls').linkbutton({ text : '编辑', plain : true, iconCls : 'icons icons_24' });
				$('.roleCls').linkbutton({ text : '详细 ', plain : true, iconCls : 'icons icons_35' });
//				$('.delCls').linkbutton({ text : '删除 ', plain : true, iconCls : 'icons icons_12' });
			}
		});
	// 设置分页控件
	$('#dg').datagrid('getPager').pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
	$("#btn").click(function() {
		$('#dg').datagrid("load", {
			"carVin": $("#carVin").val(),
			"carNumber" : $("#carNumber").val(),
			"ownedId" : $('#ownedId').combobox('getValue'),
		});
		// 清空表单
		$('#searchForm').form('clear');
	});
}
function showCompany(id){
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
}
//弹出添加页面
function addFun() {
	 top.max.showWindow({
		title : '添加车辆信息',iconCls : 'icon-add',width : 1000,height : 640,
		url : 'vehicle/add.jsp',
		onLoad :function (){ 
			top.$('#carUseNatu').combobox('setValue',carUseNatu); 
			//加载所属单元列表
			loadCompany(top.$("#ownedId")); 
			
		},
		buttons : [{ text : '保存', iconCls : 'icons icons_45',handler : function() {saveVehicle();}},
		           {text : '关闭',handler : function() {top.max.closedlg();}} ]                                                                                                                                                                                                                      
	});
};

//保存车辆信息
function saveVehicle() {
	if (top.$("#uform").form('enableValidation').form('validate')) {
		var data = getFormJson(top.$("#uform"));
		var url = "";
		url = '../vehicle/save';
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
					$('#dg').datagrid('load');
				} else {
					top.$.messager.alert('提示', '保存失败，请检查信息是否正确。');
				}
			}
		});
	}
}
function view(id) {
	top.max.showWindow({
		title : '车辆信息',iconCls : 'icon-search',width :1000,height : 640,closed : false,cache : false,modal : true,
		url : 'vehicle/vehicleView.jsp',
		onLoad : function() {
			//ajax查询单个信息，form回填数据
			$.ajax({url : '../vehicle/queryOne?id=' + id, async : false, cache : false,
				success : function(data) {
					if (data) {
						top.$("#uform").form('load', data);
						top.$('#uform input').attr("disabled","disabled");
					}
				}
			});
		},
		buttons : [{text : '关闭',handler : function() {top.max.closeWindow();}} ]                                                                                                                                                                                                                      
	});
};
//判断是否选择行，返回这一行数据 obj
function checkRows() {
	var selRow = $('#dg').datagrid("getSelections");// 返回选中多行
	if (selRow.length != 1) {
		top.$.messager.alert('提示', '请选择一行数据!', 'info');
		return false;
	}
	return selRow[0];
}
function edit() {
	if (!checkRows()) {
		return;
	}
	var obj = checkRows();
	if (obj.id == null) {
		return;
	}
	top.max.showWindow({
		title : '车辆信息',iconCls : 'icon-search',width :1000,height : 640,closed : false,cache : false,modal : true,
		url : 'vehicle/vehicleEdit.jsp',
		onLoad : function() {
			top.$('#carUseNatu').combobox('setValue',carUseNatu); 
			loadCompany();
			//ajax查询单个信息，form回填数据
			$.ajax({url : '../vehicle/queryOne?id=' + obj.id, async : false, cache : false,
				success : function(data) {
					if (data) {
						top.$("#uform").form('load', data);
					}
				}
			});
			top.$('#tt').tabs({  border:false, onSelect:function(title,index){  } });
		},
		buttons : [{ text : '保存', iconCls : 'icons icons_45',handler : function() {
			if (top.$("#form").form('enableValidation').form('validate')) {
				var data = getFormJson(top.$("#uform"));
				var url = '../vehicle/editVehicle';
				$.ajax({ cache : false, type : "POST", url : url, data : data, async : false, dataType : 'json',
					success : function(data) {
						if (data.success) {
							$('#dg').datagrid('load');
							top.max.closeWindow();
						} else {
							top.$.messager.alert('提示', '保存失败，请检查信息是否正确。');
						}
					}
				});
			}
		}},
		           {text : '关闭',handler : function() {top.max.closedlg();}} ]                                                                                                                                                                                                        
	});
};
function del(id,index){  //删除操作  
 $.messager.confirm('确认','确认删除?',function(row){  
     if(row){  
         $.ajax({  url:'delete?id='+id,    
             success:function(){
            	 $('#dg').datagrid('deleteRow',index);  
            	 top.max.sysSlideShow({
 					msg : "成功删除。"
 				});
             }  
         });  
     }  
 })  
}  
