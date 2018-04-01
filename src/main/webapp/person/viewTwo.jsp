<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物流商汇</title>
<!-- 	引入通用js css -->
<%@ include file="/common/taglibs.jsp"%></head>
<link href="../css/default.css" rel="stylesheet" type="text/css" />

</head>
<body>
<form id="form" method="post" class="form" enctype="multipart/form-data">
	<div id="tt" class="easyui-tabs" data-options="border:false">
		<div title="基本信息" id="jiben">
			<table class="grid">
				
				<tr>
					<th>姓名：</th>
					<td><input name="name" class="easyui-validatebox" data-options="required:true" type="text" style="width: 200px;"></td>
					<th>身份证号：</th>
					<td><input class="easyui-validatebox" name="idcard_no" data-options="required:true,validType:'idcard_no'"  type="text" style="width: 200px;" ></td>
					
					<td rowspan="6">
					<div id="photo"><img id="userheadimg"
							onerror="noheadimg()" class="userheadimg" 
							src="images/icons/function_icon_set/user_48.png" /></div>
					</td>
				</tr>
				<tr>
					<th>民族：</th>
					<td> <input  name="nation" style="width:200px" /></td>
					<th>性别：</th>
					<td><input name="sex" type="radio" value="1" checked="checked" />男 <input name="sex" type="radio" value="2" />女</td>
				</tr>
				<tr>
					<th>出生年月日：</th>
					<td><input name="birth" type="text" style="width: 200px;" class="easyui-datebox"></td>
					<th>籍贯：</th>
					<td><input name="home" type="text" style="width: 200px;"></td>
				</tr>
				<tr>
					<th>电子邮件：</th>
					<td><input name="email" type="text" style="width: 200px;"></td>
					<th>联系电话：</th>
					<td><input name="telephone"  class="easyui-validatebox" data-options="required:true" type="text" style="width: 200px;"></td>
				</tr>
				<tr>
					<th>政治面貌：</th>
                    <td>	<input class="easyui-combobox" style="width: 200px;" id="political" name="political" />
					</td>
					<th>文化程度：</th>
					<td> 
					<input class="easyui-combobox" style="width: 200px;" id="education" name="education" />
					</td>
					
				</tr>
				<tr>
					<th>从业状态：</th>
					<td>
						<input class="easyui-combobox" style="width: 200px;"id="work_status" name="work_status" />
					</td>
					<th>现服务车辆：</th>
					<td>
						<input  class="easyui-textbox"  style="width: 200px;text-transform:uppercase;"name="fwcl" />
					</td>
				</tr>
				</table></div>
				
			<div title="从业资格证信息" id="congye">
				<table class="grid">
				<tr>
					<th colspan="6" style="text-align:center">从业资格证信息</th>
				</tr>
				<tr>
					<th>档案号：</th>
					<td><input name="quali_record_no" class="easyui-validatebox" type="text" style="width: 200px;"></td>
					<th>发证机关：</th>
					<td><input name="quali_authority" class="easyui-validatebox" type="text" style="width: 200px;"></td>
					</tr>
				<tr>
					<th>从业资格证号：</th>
					<td><input style="width: 200px;"  class="easyui-validatebox"   data-options="required:true"  name="qualification_no" type="text" style="width: 200px;"></td>
				
					<th>初次领证时间：</th>
					<td><input name="quali_certify_time" data-options="required:true" class="easyui-datebox" type="text" style="width: 200px;"></td>
					</tr>
				<tr>
					<th>从业资格证类别：</th>
					<td><select class="easyui-combobox" id="quali_kind"
							name="quali_kind" editable="false" style="width: 200px;">
								<option value="01001">客运驾驶员</option>
								<option value="02001">货运驾驶员</option>
								<option value="03001">危货驾驶员</option>
								<option value="03003">危货押运员</option>
								<option value="12002">客运乘务员</option>
						</select></td>
					<th>有效期限：</th>
					<td><input name="quali_begin_time"   data-options="required:true"  class="easyui-datebox" type="text" style="width: 200px;">至
					<input name="quali_end_time"  data-options="required:true"  class="easyui-datebox" type="text" style="width: 200px;"></td>
				</tr>
					
				
			</table>
		</div>
		
		<div title="服务记录" id="fuwu">
			<div data-options="region:'center'">
						<table id="unitgrid" data-options="border:false">
						
						</table>
						</div>
		</div>
		</div>
	</form>
	
</body>
</html>