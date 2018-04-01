<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/common/taglibs.jsp"%>
</head>
<body>
	<form id="form">
		<table class="grid">
			<tr>

				<th>单位名称：</th>
				<td><input name="gsmc" class="easyui-validatebox"
					data-options="required:true" type="text" style="width: 80%"></td>
				<th>法人代表/负责人：</th>
				<td><input name="frdb" class="easyui-validatebox" type="text"></td>
			</tr>
			<tr>

				<th nowrap="nowrap">身份证明名称/号码：</th>
				<td nowrap="nowrap" colspan="3"><select class="easyui-combobox"
					name="zjlx" editable="false">
						<option value="营业执照">营业执照</option>
						<option value="组织机构代码证书">组织机构代码证书</option>
						<option value="身份证">身份证</option>
				</select> / <input name="zjbm" class="easyui-validatebox" type="text" /></td>


			</tr>
			<tr>
				<th>联系人：</th>
				<td><input data-options="required:true" name="lxr"
					class="easyui-validatebox" type="text"></td>
				<th>联系电话：</th>
				<td><input data-options="required:true" name="lxdh"
					class="easyui-validatebox" type="text"></td>
			</tr>
			<tr>
				<th nowrap="nowrap">经营许可证号：</th>
				<td><input name="jyxkzh" type="text"></td>
				<th>经济类型：</th>
				<td><select class="easyui-combobox" id="jjlx" name="jjlx"
					editable="false">
						<option value="有限责任（公司）">有限责任（公司）</option>
						<option value="私有">私有</option>
						<option value="其他">其他</option>
				</select></td>
			</tr>
			<tr>
				<th>所属区县：</th>
				<td colspan="3"><input name="province" id="province"
					style="width: 120px;" /> <input name="city" id="city"
					style="width: 120px;" /> <input name="county" id="county"
					style="width: 120px;" /> <input type="hidden" name="location"
					id="cregicounty" /></td>
			</tr>
			<tr>
				<th>公司地址：</th>
				<td colspan="3"><input name="address"
					class="easyui-validatebox" type="text" style="width: 500px;"></td>
			</tr>
			<tr>
				<th>证明照片：</th>
				<td colspan="3">
					<div class="file-box">
						<input type='text' name='textfield' id='textfield' class='txt' />
						<input type='button' class='btn' value='浏览...' /> <input
							type="file" name="fileField" class="file" id="fileField"
							size="28" accept="image/jpeg,image/png,image/gif,image/jpeg"
							onchange="PreviewImage(this)" />
						<!-- 						<input type="button" name="button" class="btn" value="上传" />  -->
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="3">
					<div id="imgPreview" style="width: 260px; height: 120px;">
						<!-- 					　　<img src=""/>  -->
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>