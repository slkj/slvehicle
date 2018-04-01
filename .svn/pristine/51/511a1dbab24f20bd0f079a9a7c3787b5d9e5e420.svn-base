<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form id="form">
	<input type="hidden" name="id">
		<table class="grid">
			<tr>
				<th>公司名称：</th>
				<td><input name="gsmc" class="easyui-validatebox"
					data-options="required:true" type="text" style="width: 200px;"></td>
				<th>法人代表：</th>
				<td><input data-options="required:true" name="frdb"
					class="easyui-validatebox" type="text" style="width: 200px;"></td>
			</tr>
			<tr>
				<th nowrap="nowrap">身份证明名称/号码：</th>
				<td colspan="3"><select class="easyui-combobox" name="zjlx"
					style="width: 150px;">
						<option value="组织机构代码证书">组织机构代码证书</option>
						<option value="营业执照">营业执照</option>
						<option value="营业执照">身份证</option>
				</select> / <input data-options="required:true" name="zjbm"
					class="easyui-validatebox" type="text" style="width: 200px;" /></td>


			</tr>
			<tr>
				<th>联系人：</th>
				<td><input data-options="required:true" name="lxr"
					class="easyui-validatebox" type="text" style="width: 200px;"></td>
				<th>联系电话：</th>
				<td><input data-options="required:true" name="lxdh"
					class="easyui-validatebox" type="text" style="width: 200px;"></td>
			</tr>
			<tr>
				<th>经营许可证号：</th>
				<td><input name="jyxkzh" type="text" style="width: 200px;"></td>
				<th>经济类型：</th>
				<td><select class="easyui-combobox" id="jjlx" name="jjlx"
					style="width: 200px;">
						<option value="内资">内资</option>
						<option value="国有全资">国有全资</option>
						<option value="集体全资">集体全资</option>
						<option value="股份合作">股份合作</option>
						<option value="联营">联营</option>
						<option value="有限责任（公司）">有限责任（公司）</option>
						<option value="股份有限（公司）" selected="selected">股份有限（公司）</option>
						<option value="私有">私有</option>
						<option value="其他内资">其他内资</option>
						<option value="港、澳、台投资">港、澳、台投资</option>
						<option value="内地和港、澳、台合资">内地和港、澳、台合资</option>
						<option value="内地和港、澳、台合作">内地和港、澳、台合作</option>
						<option value="港、澳、台独资">港、澳、台独资</option>
						<option value="港、澳、台有限责任（公司）">港、澳、台有限责任（公司）</option>
						<option value="其他港澳台投资">其他港澳台投资</option>
						<option value="国外投资">国外投资</option>
						<option value="中外合资">中外合资</option>
						<option value="中外合作">中外合作</option>
						<option value="外资">外资</option>
						<option value="国外投资股份有限（公司）">国外投资股份有限（公司）</option>
						<option value="其他国外投资">其他国外投资</option>
						<option value="其他">其他</option>
				</select></td>
			</tr>
			<tr>
				<th>所属区县：</th>
				<td colspan="3"><input  type="text"  name="localname" ></input></td>
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
						<input type='text' name='zjimage' id='textfield' class='txt' /> 
						<input type='button' class='btn' value='浏览...' /> 
						<input type="file" name="fileField" class="file" id="fileField" size="28"  
						accept="image/jpeg,image/png,image/gif,image/jpeg"  onchange="PreviewImage(this)" /> 
<!-- 						<input type="button" name="button" class="btn" value="上传" />  -->
					</div>
				</td>
			</tr>
			<tr>
				<td></td><td colspan="3">
					<div id="imgPreview" style="width:260px; height:150px;"> 
					　　<img id="img" src=""/> 
					 </div> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>