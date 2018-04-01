<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 	引入通用js css -->
<%@ include file="/common/taglibs.jsp"%>

</head>
<body>
	<form id="form" method="post" class="form"
		enctype="multipart/form-data">
		<input name="uid" type="hidden" value="${userSession.u_id }" />
		<input hidden="true" id="qualification_type" name="qualification_type"/>
		<input hidden="hidden" name="per_id"/>
		<div id="tt" class="easyui-tabs" data-options="border:false">
			<div title="基本信息" id="jiben">
				<table class="grid">
					<tr>
						<th width="150px">姓名：</th>
						<td width="200px"><input class="easyui-validatebox"
							name="name" data-options="required:true" type="text"
							style="width: 200px;"></td>
						<th width="150px">身份证号：</th>
						<td width="200px"><input class="easyui-validatebox"
							id="idcard_no" name="idcard_no"
							data-options="required:true,validType:'idcard'" type="text"
							style="width: 200px;"></td>
						<!-- 						<th width="150px" rowspan="5">个人头像：</th> -->
						<td width="200px" rowspan="5"><img id="userheadimg"
							onerror="noheadimg()" class="userheadimg" 
							src="images/icons/function_icon_set/user_48.png" /></td>
					</tr>
					<tr>
						<th>民族：</th>
						<td><input name="nation" style="width: 200px" /></td>
						<th>性别：</th>
						<td><input name="sex" type="radio" value="1"
							checked="checked" />男 <input name="sex" type="radio" value="2" />女</td>
					</tr>
					<tr>
						<th>出生年月日：</th>
						<td><input name="birth" type="text" style="width: 200px;"
							data-options="required:true" class="easyui-datebox"></td>
						<th>籍贯：</th>
						<td><input name="home" type="text" style="width: 200px;"></td>
					</tr>
					<tr>
						<th>电子邮件：</th>
						<td><input name="email" type="text" style="width: 200px;"></td>
						<th>联系电话：</th>
						<td><input name="telephone" class="easyui-validatebox"
							data-options="required:true" type="text" style="width: 200px;"></td>
					</tr>
					<tr>
						<th>政治面貌：</th>
						<td>
							<select class="easyui-combobox" id="political"
							name="political" editable="false" style="width: 200px;">
								<option value="群众">群众</option>
								<option value="共青团员">共青团员</option>
								<option value="中共党员">中共党员</option>
						</select></td>
						<th>文化程度：</th>
						<td>
							<select class="easyui-combobox" id="education"
							name="education" editable="false" style="width: 200px;">
								<option value="初中及以下">初中及以下</option>
								<option value="高中">高中</option>
								<option value="中专/技校">中专/技校</option>
								<option value="大专">大专</option>
								<option value="本科">本科</option>
								<option value="硕士以上">硕士以上</option>
						</select></td>
					</tr>
					<tr>
						<th>从业状态：</th>
						<td>
							<select class="easyui-combobox" id="work_status"
							name="work_status" editable="false" style="width: 200px;">
								<option value="待业">待业</option>
								<option value="就业">就业</option>
						</select></td>
						<th>现服务车辆：</th>
						<td><input type="text"
							style="width: 200px; text-transform: uppercase;" name="fwcl" />
							<!-- value="
							冀H" 
						   onblur="if(value==''){value='冀H'}"
							onkeyup="this.value = this.value.toUpperCase();" /> --></td>
						 <td>
							<div style="text-align: center">
								
									<input id="pic" type="file" name="picFile"  style="width: 150px"/>
						<input id="upbtn" type="button" value="上传" onclick="upload()" />
						<input  id="img"  type="hidden" name="photo">
							</div>
						</td> 
					</tr>
				</table>
			</div>
			<div title="驾驶证信息" id="jiashi">
				<table class="grid">
					<tr>
						<th>档案编号：</th>
						<td><input name="driver_record_no" type="text"
							style="width: 200px;"></td>

						<th>驾驶证号：</th>
						<td><input class="easyui-validatebox" name="driver_no"
							type="text" data-options="required:true" style="width: 200px;"></td>
							</tr>
					<tr>
						<th>准驾车型：</th>
						<td><input id="car_type" data-options="required:true"
							class="easyui-combobox" name="driver_car_type"
							style="width: 200px;" /></td>
						<th>驾驶证初领时间：</th>
						<td><input name="driver_certify_time"
							data-options="required:true" class="easyui-datebox" type="text"
							style="width: 200px;"></td>
							</tr>
					<tr>
						<th>驾驶证有效起始日期：</th>
						<td><input name="driver_begin_time"
							data-options="required:true" class="easyui-datebox" type="text"
							style="width: 200px;"></td>
						<th>驾驶证有效期限(年)：</th>
						<td><input name="driver_years" type="text"
							 class="easyui-numberbox" data-options="required:true"
							style="width: 200px;"></td>
					</tr>
					<tr>
						<th>发证机关：</th>
						<td><input name="driver_authority" type="text"
							style="width: 200px;"></td>
						<th>经营许可证号：</th>
						<td><input name="bussiness_no" style="width: 200px;"
							type="text"></td>
					</tr>
					<tr>
						<th>联系地址：</th>
						<td colspan="4"><input name="address" type="text"
							style="width: 600px;"></td>
					</tr>
				</table>
			</div>
			<div title="从业资格证信息" id="congye">
				<table class="grid">
					<tr>
						<th>从业资格证号：</th>
						<td><input style="width: 200px;" class="easyui-validatebox"
							data-options="required:true" name="qualification_no" type="text"
							style="width: 200px;"></td>
						<th>从业资格证类别：</th>
						<td><select class="easyui-combobox" id="quali_kind"
							name="quali_kind" editable="false" style="width: 200px;">
								<option value="01001">客运驾驶员</option>
								<option value="02001">货运驾驶员</option>
								<option value="03001">危货驾驶员</option>
								<option value="03003">危货押运员</option>
								<option value="12002">客运乘务员</option>
						</select></td>
						</tr>
					<tr>
						<th>初次领证时间：</th>
						<td><input name="quali_certify_time"
							data-options="required:true" class="easyui-datebox" type="text"
							style="width: 200px;"></td>


						<th>有效期限：</th>
						<td><input name="quali_begin_time"
							data-options="required:true" class="easyui-datebox" type="text"
							style="width: 100px;">至 <input name="quali_end_time"
							data-options="required:true" class="easyui-datebox" type="text"
							style="width: 100px;"></td>
							</tr>
					<tr>
						<th>档案号：</th>
						<td><input name="quali_record_no" class="easyui-validatebox"
							type="text" style="width: 200px;"></td>
						<th>发证机关：</th>
						<td><input name="quali_authority"
							data-options="required:true" class="easyui-validatebox"
							type="text" style="width: 200px;"></td>

					</tr>
				
				</table>
			</div>
			<div title="服务单位" id="fuwu">
			<table class="grid">
				<tr>
					<th colspan="6" style="text-align:center" >服务单位</th>
				</tr>
				<tr>
					<th align="right">单位名称:</th>
					<td><input name="unit_name" style="width: 200px;" /></td>
					<th align="right">单位电话:</th>
					<td><input  name="unit_tel" style="width: 200px;" /></td>
					</tr>
					<tr>
					<th align="right">单位地址:</th>
					<td><input  name="unit_address" style="width: 200px;" /></td>
					
					<th align="right">服务日期:</th>
					<td colspan="5"><input id="riqi" class="easyui-datebox" name="unit_time" editable="false" style="width:200px" ></td>
				</tr>
				
			</table>
			</div>
		</div>
	</form>
</body>
</html>