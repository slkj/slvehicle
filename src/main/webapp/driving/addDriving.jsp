<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加车辆行驶证信息</title>
<%-- <%@ include file="/common/taglibs.jsp"%> --%>
</head>
<body>
	<div id="aa" class="easyui-tabs" data-options="border:false">
		<div title=车辆信息>
			<!-- 车辆信息 开始-->
			<form id="form" method="post">
				<table class="grid">
					<tr>
						<th width="100px">号牌号码：</th>
						<td width="150px"><label id="carNumber"></label></td>
						<th width="100px">车辆类型：</th>
						<td width="150px"><label id="cllx"></label></td>
					</tr>
					<tr>
						<th>业户名称：</th>
						<td colspan="3"><label id="regCompanyName"></label></td>
					</tr>
					<tr>
						<th>地址：</th>
						<td colspan="3"><label id="address"></label></td>
					</tr>
					<tr>
						<th>使用性质：</th>
						<td><select class="easyui-combobox" name="carUseNatu"
							data-options="readonly:true" style="width: 120px">
								<option></option>
								<option value="001">公路客运</option>
								<option value="002">货运</option>
								<option value="003">公交客运</option>
								<option value="004">出租客运</option>
								<option value="005">旅游客运</option>
								<option value="006">非营运</option>
						</select></td>
						<th>品牌型号：</th>
						<td><label id="ppxh"></label></td>
					</tr>
					<tr>
						<th>车辆识别代号：</th>
						<td><label id="carVin"></label></td>

						<th>发动机号：</th>
						<td><label id="carEngNum"></label></td>
					</tr>
					<tr>
						<th>核定人数：</th>
						<td><label id="carApprGuest"></label>人</td>
						<th>总质量：</th>
						<td><label id="carTotalmass"></label>kg</td>
					</tr>
					<tr>
						<th>外廓尺寸：</th>
						<td><label id="wkcc" type="text"></label>&nbsp;&nbsp;mm</td>
						<th>准牵引总质量：</th>
						<td><label id="carTrac"></label>kg</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 车辆信息 结束-->
		<div title="行驶证信息" selected="true">
			<form id="dform" method="post">
				<input id="vId" name="vId" type="hidden" /> <input id="carNumbers"
					name="carNumber" type="hidden" />
				<!-- 行驶证信息 开始-->
				<table class="grid" id="drivingtab">
					<tr>
						<th width="100px">档案编号：</th>
						<td width="150px"><input name="fileNumber" class="easyui-validatebox"
							editable="false" type="text" data-options="required:true" /></td>
						<th width="100px">注册日期：</th>
						<td width="150px">
							<input name="driRegDate" class="easyui-datebox" editable="false" type="text" data-options="required:true" />
						</td>
					</tr>
					<tr>
						<th>发证日期：</th>
						<td><input name="driCertDate" class="easyui-datebox"
							editable="false" type="text" data-options="required:true" /></td>
						<th>强制报废期止：</th>
						<td><input id="baoFeiDate" name="baoFeiDate"
							class="easyui-datebox" editable="false" /></td>
					</tr>
					<tr>
						<th>检测机关：</th>
						<td><input name="testOrgan" class="easyui-textbox" /></td>
						<th>到期日期：</th>
						<td><input name="endDate" class="easyui-datebox"
							data-options="required:true" editable="false" /></td>
					</tr>
					<tr>
						<th>备注：</th>
						<td colspan="3"><textarea id="introd" name="introd" cols="20"
								rows="2" style="width: 100%"> </textarea></td>
					</tr>

				</table>
				<!-- 行驶证信息 结束-->
			</form>
		</div>
	</div>
</body>
</html>