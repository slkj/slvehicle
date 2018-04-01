var grid = "";
var moduleId = "";
var qType = "";
$(function() {
	var Request = new Object();
	Request = GetRequest();
	moduleId = Request['moduleId'];
	qType = Request['qType'];
	toolbar();
	// 初始化页面
	initDataGrid();

});
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
function getMenuItems(data) {
	var str = "<tr>";
	$.each(data,function(i, o) {
		str += "<td><a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icons "
				+ o.icon
				+ "',plain:true\" onclick=\""
				+ o.url
				+ "()\">"
				+ o.name
				+ "</a></td>";
	});
	str += "</tr>"
	var targetObj = $("#toolbar").append(str);
	$.parser.parse(targetObj);
}
function initDataGrid() {
	grid = $('#persongrid').datagrid(
			{
				url : '../person/list?qualification_type=' + qType,
				width : 'auto',
				height : 'auto',
				nowrap : true,
				striped : true,
				border : true,
				collapsible : false,// 是否可折叠的
				singleSelect:true, //只允许选择一行
				fit : true,// 自动大小
				remoteSort : false,
				pagination : true,// 分页控件
				rownumbers : true,// 行号
				pageSize : 15,// 每页显示的记录条数，默认为10
				pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
				columns : [ [
						 {
							title : '姓名',
							field : 'name'
						}, {
							title : '联系电话',
							field : 'telephone'
						}, {
							title : '身份证号',
							field : 'idcard_no'
						}, {
							title : '驾驶证发证日期',
							field : 'driver_certify_time'
						}, {
							title : '从业资格证号',
							field : 'qualification_no'
						}, {
							title : '从业资格证发证日期',
							field : 'quali_certify_time'
						}, {
							title : '现服务车辆',
							field : 'fwcl'
						}, {
							title : '服务单位',
							field : 'unit_name'
						},{
							title : '操作',
							field : '_operate',
							formatter : function(value, row, index) {
								var btn = '<a class="rolecls" onclick="viewFun(\'' + row.per_id
										+ '\',\'' + row.idcard_no + '\')" href="#" >详细&nbsp;</a>';

								return btn;
							}
						}] ],
				toolbar : '#toolbar',
				onLoadSuccess : function() {
					$('#persongrid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					$('.rolecls').linkbutton({
						text : '详细 ',
						plain : true,
						iconCls : 'icons icons_35'
					});
				}
			});
	// 设置分页控件
	var p = grid.datagrid('getPager');

	$(p).pagination({
		pageSize : 10,// 每页显示的记录条数，默认为10
		pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
	});

	$("#btn").click(function() {
		$('#persongrid').datagrid("load", {
			"idcard_no" : $("#idcard_no").val(),
			"qualification_no" : $("#qualification_no").val(),
			"fwcl" : $("#fwcl").val()
		});
		// 清空表单
		$('#searchForm').form('clear');
	});
}
function viewFun(id, idcard) {
	var url ="";
	if(qType == "1"){
		url = "person/view.jsp";
	}else{
		url = "person/viewTwo.jsp";
	}
	top.max.showWindow({
		title : '驾驶信息',
		iconCls : 'icon-search',
		width : 1000,
		height : 640,
		closed : false,
		cache : false,
		modal : true,
		url : url,
		onLoad : function() {
			// ajax查询单个信息，form回填数据
			$.ajax({
				url : '../person/one?id=' + id,
				async : false,
				cache : false,
				success : function(data) {
					if (data) {
						iniDriver(idcard);
						iniExzm(idcard);
						iniUnit(idcard);
						var photo = '<img  src="../showPicture/load?imgPath=' + data.photo
								+ '" width="222" height="166"/>';
						$('#photo').html(photo);
						top.$("#form").form('load', data);
						top.$('#form input').attr("disabled", "disabled");

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
function addFun() {
	var url ="";
	if(qType == "1"){
		url = "person/add.jsp?type="+qType;
	}else{
		url = "person/addTwo.jsp?type="+qType;
	}
	top.max.showWindow({
		title : "添加人员",
		width : 1000,
		height : 640,
		url : url,
		onLoad : function() {
			loadPerson();
		},
		buttons : [{ text : '保存', iconCls : 'icons icons_45',handler : function() {addSave();}},
		           {text : '关闭',handler : function() {top.max.closedlg();}} ]  
	});
};
function addSave() {
	if (!top.$("#form").form("validate")){
		return ;
	}

	$.ajax({
		cache : false,
		type : "POST",
		url : '../person/add',
		data : top.$('#form').serialize(),// 你的formid
		async : false,
		success : function(data) {
			if (data.success) {
				parent.max.sysSlideShow({
					msg : "操作成功。"
				});
				top.max.closedlg();
				$('#persongrid').datagrid('load'); // 重新加载
			} else {
				parent.max.sysSlideShow({
					msg : "保存失败。"
				});
			}
		}
	});
}

function editFun() {
	if (!checkIdcard()) {
		return;
	}
	var selRow = $('#persongrid').datagrid("getSelections");// 返回选中多行
	var id=selRow[0].per_id;
	var url ="";
	if(qType == "1"){
		url = "person/edit.jsp?id="+id;
	}else{
		url = "person/editTwo.jsp?id="+id;
	}
	top.max.showWindow({
		title : "编辑人员",
		width : 1000,
		height : 640,
		url : url,
		onLoad:function(){
			$.ajax({
				url : "../person/one",
				type : "POST",
				data : "id=" + id,
				async : false,
				dataType : "json",
				cache : false,
		        success: function(data) { 
		         	var photo = '<img  src="../showPicture/load?imgPath='+data.photo+'" width="222" height="122"/>';
		         	top.$('#photo').html(photo);
		        	 top.$("#form").form('load', data);
		        	 top.$("#car_type").combobox('setValue',data.driver_car_type);
		        }  
				
			});
		},
		buttons : [{ text : '保存', iconCls : 'icons icons_45',handler : function() {editSave();}},
		           {text : '关闭',handler : function() {top.max.closedlg();}} ]  
	});
}
function editSave() {
	if (!top.$("#form").form("validate")){
		return ;
	}

	$.ajax({
		cache : false,
		type : "POST",
		url : '../person/save',
		data : top.$('#form').serialize(),// 你的formid
		async : false,
		success : function(data) {
			if (data.success) {
				parent.max.sysSlideShow({
					msg : "操作成功。"
				});
				top.max.closedlg();
				$('#persongrid').datagrid('load'); // 重新加载
			} else {
				parent.max.sysSlideShow({
					msg : "保存失败。"
				});
			}
		}
	});
}
function del(id, index) { // 删除操作
	$.messager.confirm('确认', '确认删除?', function(row) {
		if (row) {
			$.ajax({
				url : '../person/delete?id=' + id,
				success : function(data) {
					var msg = "成功删除。";
					if (data.success) {
						$('#persongrid').datagrid('deleteRow', index);
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
function deleteFun() {
	$.messager.confirm("操作提示", "您确定要执行操作吗？", function(data) {
		if (data) {
			var rows = grid.datagrid('getSelections');
			if (!rows || rows.length == 0) {
				top.$.messager.alert('提示', '请选择要删除的数据!', 'info');
				return;
			}
			var ids = [];
			$.each(rows, function(i, n) {
				var id = rows[i].per_id; // id这个是你要在列表中取的单个id
				ids.push(id); // 然后把单个id循环放到ids的数组中

			});
			var param = {
				ids : ids
			};
			deleteData(param);
		}
	});
}
function deleteData(param) {
	$.ajax({
		url : "../person/deletes",
		type : "POST",
		data : param,
		async : false,
		dataType : "json",
		cache : false,
		success : function(data) {
			if (data) {
				max.sysSlideShow({
					msg : "删除成功"
				});
				$('#persongrid').datagrid('load'); // 重新加载
			} else {
				max.sysSlideShow({
					msg : "删除失败"
				});
			}
		}
	});

};
function checkIdcard() {
	var selRow = $('#persongrid').datagrid("getSelections");// 返回选中多行
	if (selRow.length != 1) {
		top.$.messager.alert('提示', '请选择一行数据!', 'info');
		return false;
	}
	var idcard = selRow[0].idcard_no;
	if (idcard == "") {
		top.max.sysSlideShow({
			msg : "没有查到相关信息!"
		});
		return false;
	}
	return idcard;
}

function addDriver() {
	if (!checkIdcard()) {
		return;
	}
	var idcard = checkIdcard();
//	window.location.href = "../driver/add.jsp?idcard=" + idcard;
	top.max.modalDialog({
		title : "添加违章记录",
		width : 1000,
		height : 640,
		url : "driver/add.jsp?idcard=" + idcard
	});
}
function addExzm() {
	if (!checkIdcard()) {
		return;
	}
	var idcard = checkIdcard();

//	window.location.href = '../exzm/add.jsp?idcard=' + idcard;
	top.max.modalDialog({
		title : "添加违章记录",
		width : 1000,
		height : 640,
		url : "exzm/add.jsp?idcard=" + idcard
	});
}
function addUnit() {
	if (!checkIdcard()) {
		return;
	}
	var idcard = checkIdcard();

//	window.location.href = '../unit/add.jsp?idcard=' + idcard;
	top.max.modalDialog({
		title : "添加违章记录",
		width : 1000,
		height : 640,
		url : "unit/add.jsp?idcard=" + idcard
	});
}
function loadPerson(){
	top.$('#qualification_type').val(qType);
	top.$('#car_type').combobox({
		url : 'person/qtype.json',
		valueField : 'code',  //agentcode
		textField : 'code',
		multiple:true,
	});
	top.$('#upbtn').click(function(){
		   upload();
	});
}
function iniDriver(idcard) {
	top.$('#drivergrid').datagrid({
		url : 'driver/list?idcard_no=' + idcard,
		width : 'auto',
		height : 'auto',
		nowrap : true,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		remoteSort : false,
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		pageSize : 15,// 每页显示的记录条数，默认为10
		pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
		columns : [ [ {
			title : '车牌号',
			field : 'carnumber',
			width : 150
		}, {
			title : '违章时间',
			field : 'driver_record_time',
			width : 150
		}, {
			title : '违章信息',
			field : 'driver_info',
			width : 300
		}, {
			title : '处理结果',
			field : 'result',
			width : 150
		} ] ],

		onLoadSuccess : function() {
			$('#drivergrid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题

		}
	});
}
function iniExzm(idcard) {
	top.$('#exzmgrid').datagrid({
		url : 'exzm/list?idcard_no=' + idcard,
		width : 'auto',
		height : 'auto',
		nowrap : true,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		remoteSort : false,
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		pageSize : 15,// 每页显示的记录条数，默认为10
		pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
		columns : [ [ {
			title : '审验信息',
			field : 'exzm_info',
			width : 300
		}, {
			title : '审验时间',
			field : 'exzm_time',
			width : 150
		}, ] ],

		onLoadSuccess : function() {
			$('#exzmgrid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题

		}
	});
}
function iniUnit(idcard) {
	top.$('#unitgrid').datagrid({
		url : 'unit/list?idcard_no=' + idcard,
		width : 'auto',
		height : 'auto',
		nowrap : true,
		striped : true,
		border : true,
		collapsible : false,// 是否可折叠的
		remoteSort : false,
		pagination : true,// 分页控件
		rownumbers : true,// 行号
		pageSize : 15,// 每页显示的记录条数，默认为10
		pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
		columns : [ [ {
			title : '服务单位',
			field : 'unit_name',
			width : 150
		}, {
			title : '单位电话',
			field : 'unit_tel',
			width : 150
		}, {
			title : '单位地址',
			field : 'unit_address',
			width : 250
		}, {
			title : '服务日期',
			field : 'unit_time',
			width : 250
		} ] ],

		onLoadSuccess : function() {
			$('#unitgrid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题

		}
	});
}
function upload(){alert("js");
	if(top.$("#pic").val().length > 0){alert("1");
	$.ajaxFileUpload(  
            {  
         url:'../common/upload',            //需要链接到服务器地址  
         secureuri:false,  
         fileElementId:'pic',                        //文件选择框的id属性  
         dataType: 'json',                                     //服务器返回的格式，可以是json  
         success: function (data, status)            //相当于java中try语句块的用法  
         {      alert("2");
        	 data  =   data.replace(/^\s+|\s+$/g,"");
         	top.$('#img').val(data);
         	top.$('#photo').html('');
         		var photo = '<img  src="../showPicture/load?imgPath='+data+'" width="222" height="122"/>';
         		top.$('#photo').html(photo);
         	
         },  
         error: function (data, status, e)            //相当于java中catch语句块的用法  
         {  
        	 alert('图片上传失败');
         }  
     }  
)
	}else{
		alert('请选择图片');
	}
	alert("jss");
}
