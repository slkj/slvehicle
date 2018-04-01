<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- 	引入通用js css -->
<%@ include file="/common/taglibs.jsp"%></head>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function() {
	 var Request = new Object();
	Request = GetRequest();
	var idcard = Request['idcard'];
		$('#idcard_no').val(idcard);
		$('#grid')
		.datagrid(
				{
					url : '../driver/list?idcard_no='+idcard,
					width : 'auto',
					height : 'auto',
					nowrap : true,
					striped : true,
					border : true,
					collapsible : false,// 是否可折叠的
					//fit : true,// 自动大小
					remoteSort : false,
					// idField : 'id',
					// singleSelect : true,// 是否单选
					pagination : true,// 分页控件
					rownumbers : true,// 行号
					pageSize : 15,// 每页显示的记录条数，默认为10
					pageList : [ 1, 10, 15, 20, 30, 50 ],// 可以设置每页记录条数的列表
					columns : [ [
							{
								field : 'driver_record_id',
								checkbox : true
							},
							{
								title : '操作',
								field : '_operate',
								width : '120',
								formatter : function(value, row) {
									var btn = '<a class="rolecls" onclick="viewDriver(\'' + row.driver_record_id + '\')" href="#" >详细&nbsp;</a>';
									btn += '|<a class="editcls" onclick="editDriver(\'' + row.driver_record_id + '\')" href="javascript:void(0)">编辑</a>';
									return btn;
								}
							},
							{
								title : '违章信息',
								field : 'driver_info',
								width : 300
							},
							{
								title : '违章时间',
								field : 'driver_record_time',
								width : 150
							}] ],
							toolbar: [
							
							{
								iconCls: 'icons icons_12',
								plain:true,
								text:'删除',
								handler: function(){
									deleteDriver();
								}
							}],
					onLoadSuccess : function() {
						$('#grid').datagrid('clearSelections'); // 一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
						$('.editcls').linkbutton({
							text : '编辑',
							plain : true,
							iconCls : 'icons icons_24'
						});
						$('.rolecls').linkbutton({
							text : '详细 ',
							plain : true,
							iconCls : 'icons icons_35'
						});
					}
				});
	});
function back(){
	var Request = new Object();
	Request = GetRequest();
	type = Request['type'];
	BackList('../jiashi/listj.jsp?type='+type);
}

	function save() {
		var url;
		if($('#driver_record_id').val()==""){
			url='../driver/add';
		}
		else{
			url='../driver/save';
		}	
		 $('#form').form('submit', {
			url : url,
			onSubmit : function() {
				if ($("#form").form("validate"))
					return true;
				else
					return false;
			},
			success : function(data) {
				data = JSON.parse(data);
				if (data.success) {
					//parent.grid.datagrid("reload"); // 重新加载
					parent.max.sysSlideShow({
						msg : "保存成功！"
					});
					$('#grid').datagrid('load');
					$('#form').form('clear');
					//parent.$('#grid').datagrid('load');
					//closeWindow();
				} else {
					parent.max.sysSlideShow({
						msg : "保存失败！"
					});
				}
			}
		});
	}
	function editDriver(id){
		$("#saveButton").show();
		$.ajax({
			url : "../driver/one",
			type : "POST",
			data : "id=" + id,
			async : false,
			dataType : "json",
			cache : false,
	        success: function(data) { 
	        	 $("#form").form('load', data);
	        } 
		});
	}
	function viewDriver(id){
		$.ajax({
			url : "../driver/one",
			type : "POST",
			data : "id=" + id,
			async : false,
			dataType : "json",
			cache : false,
	        success: function(data) { 
	        	 $("#form").form('load', data);
	        	 $("#saveButton").hide();
	        } 
		});
	}
	function deleteDriver() {
		// 得到选中的行
		var selRow = $('#grid').datagrid("getSelections");// 返回选中多行
		if (selRow.length == 0) {
			alert("请至少选择一行数据!");
			return false;
		}
		var ids = [];
		var id;
		for (var i = 0; i < selRow.length; i++) {
			// 获取自定义table 的中的checkbox值
				id = selRow[i].driver_record_id;
			 // id这个是你要在列表中取的单个id
			ids.push(id); // 然后把单个id循环放到ids的数组中
		}
		var param = {
			ids : ids
		};
		if (confirm("确定要删除选中记录吗?")) {
			$.ajax({
				url : '../driver/deletes', //""
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
						$('#grid').datagrid('load'); // 重新加载
					} else {
						max.sysSlideShow({
							msg : "删除失败"
						});
					}
				}
			});
		}
	};
</script>

<body>
	<form id="form" method="post" class="form">
	<input hidden="true" id="driver_record_id" name="driver_record_id" value="" />
		<input hidden="true" id="idcard_no" name="idcard_no" value="" />
		<div id="dd">
			<table class="grid">
				<tr>
					<th align="right">车牌号:</th>
					<td><input id="carnumber" name="carnumber"  class="easyui-validatebox" data-options="required:true" style="width:200px"/></td>
				</tr>
				<tr>
					<th align="right">违章日期:</th>
					<td><input id="riqi"  data-options="required:true"   class="easyui-datebox" name="driver_record_time" editable="false" style="width:200px" ></td>
				</tr>
				<tr>
					<th align="right">违章信息:</th>
					<td><textarea name="driver_info" style="width: 500px;height:55px" /></textarea>
						</tr>
						<tr>
					<th align="right">处理结果:</th>
					<td><input name="result" type="radio" value="已处理"
							checked="checked" />已处理 <input name="result" type="radio"
							value="未处理" />未处理</td>
						</tr>
						
				<tr>
					<td colspan="4" style="text-align: center"><a id="saveButton" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="save()">保存</a> <a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel',plain:true" onclick="back()">返回</a></td>
				</tr>
			</table>
		</div>
		
	</form>

		<div data-options="region:'center'">
						<table id="grid" data-options="border:false"></table>
					</div>
</body>
</html>