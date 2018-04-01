<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户信息</title>
<%@ include file="/common/taglibs.jsp"%>
</head>
<body>
	<form id="uform">
		<input name="id" type="hidden" />
		<input name="operatorId" type="hidden" value="${userSession.u_id }"/>
		<input name="operatorName" type="hidden" value="${userSession.username }"/>
		<input name="depId" type="hidden"/>
		<div id="tt" class="easyui-tabs" fit="true"
			data-options="border:false,fit:true">
			<div title="注册登记摘要信息">
				<table class="grid">
					<tr>
						<th>业户名称:</th>
						<td><input name="regCompanyName" class="easyui-validatebox"
							data-options="required:true" type="text" style="width: 200px;" /></td>
						<th>身份证明名称/号码：</th>
						<td><select class="easyui-combobox" id="regName"
							name="regName" editable="false" style="width: 150px;">
								<option value="1">组织机构代码证书</option>
								<option value="2">营业执照</option>
								<option value="3">身份证</option>
						</select> / <input id="regNum" name="regNum" class="easyui-validatebox"  type="text" style="width: 150px;" /></td>
					</tr>
					<tr>
						<th>联系人:</th>
						<td><input name="txtContactMenber" class="easyui-validatebox"
							data-options="required:true" type="text" style="width: 200px;" /></td>
						<th>联系方式：</th>
						<td><input name=txtContactWay class="easyui-validatebox"
							data-options="required:true" type="text" style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>登记机关：</th>
						<td><input id="regAuthority" name="regAuthority"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 200px;" /></td>
						<th>登记日期：</th>
						<td><input id="regDate" name="regDate" class="easyui-datebox"
							data-options="required:true" type="text" editable="false"
							style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>发证日期:</th>
						<td><input id="driCertDate" name="driCertDate"
							class="easyui-datebox" type="text" editable="false"
							style="width: 200px;" /></td>
						<th>车辆归属单位：</th>
						<td><input id="ownedId" name="ownedId" style="width: 200px;" data-options="required:true"/></td>
					</tr>
					<tr>
						<th>车辆彩色照片：</th>
						<td colspan="3">
							<div class="file-box">
								<input type='text' name='textfield' id='textfield' class='txt' />
								<input type='button' class='btn' value='浏览...' /> <input
									type="file" name="fileField" class="file" id="fileField"
									size="28" accept="image/jpeg,image/png,image/gif,image/jpeg"
									onchange="PreviewImage(this)" />
								<!-- 						<input type="button" name="button" class="btn" value="上传" />  -->
							</div> <!-- 							<div> --> <!-- 								<label>前 正 面</label><input id="img" type="hidden" name=carImg1><input -->
							<!-- 									id="pic" type="file" onChange=upload(1) name="picFile" -->
							<!-- 									style="width: 300px" /> --> <!-- 							</div> -->
							<!-- 							<div> --> <!-- 								<label>后 正 面</label><input id="img" type="hidden" name=carImg2><input -->
							<!-- 									id="pic" type="file" onChange=upload(1) name="picFile" -->
							<!-- 									style="width: 300px" /> --> <!-- 							</div> -->
							<!-- 							<div> --> <!-- 								<label>侧 面</label><input id="img" type="hidden" name=carImg2><input -->
							<!-- 									id="pic" type="file" onChange=upload(1) name="picFile" -->
							<!-- 									style="width: 300px" /> --> <!-- 							</div> -->
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3">
							<div id="imgPreview" style="width: 260px; height: 150px;">
								<!-- 					　　<img src=""/>  -->
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div title="注册登记机动车信息">
				<table class="grid">
					<tr>
						<th>车牌号(主)：</th>
						<td><input id="carNumber" name="carNumber"
							class="easyui-validatebox" type="text"
							data-options="required:true" style="width: 200px;" /></td>
						<th>车牌号(挂)：</th>
						<td><input id="carNumberTrailer" name="carNumberTrailer"
							class="easyui-validatebox" type="text" style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>车辆类型：</th>
						<td>
							<select class="easyui-combobox" name="classify" style="width:50px;">   
							    <option value="大型">大型</option> 
							    <option value="重型">重型</option> 
							    <option value="中型">中型</option> 
							    <option value="小型">小型</option> 
							    <option value="微型">微型</option> 
							    <option value="轻型">轻型</option> 
							</select>  
						<select id="carType" name="carType" class="easyui-combotree" style="width:200px;"
							 data-options="url:'vehicle/carcalss_data.json',required:true,lines:true"></select>  </td>
						<th>车辆品牌：</th>
						<td><input id="carBrand" name="carBrand"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>车辆型号：</th>
						<td><input id="carModel" name="carModel"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 200px;" /></td>
						<th>车身颜色：</th>
						<td><input id="carColor" name="carColor"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 200px;" /></td>
					</tr>

					<tr>
						<th nowrap="nowrap">车辆识别代号/车架号：</th>
						<td><input id="carVin" name="carVin"
							class="easyui-validatebox" type="text"
							data-options="required:true" style="width: 200px;" /></td>
						<th>国产/进口：</th>
						<td><input name="carProType" type="radio" value="国产"
							checked="checked" />国产 <input name="carProType" type="radio"
							value="进口" />进口</td>
					</tr>
					<tr>
						<th>发动机号：</th>
						<td><input id="carEngNum" name="carEngNum"
							class="easyui-validatebox" type="text"  style="width: 200px;" /></td>
						<th>发动机型号：</th>
						<td><input id="carEngModel" name="carEngModel"
							class="easyui-validatebox" type="text" style="width: 200px;" /></td>
					</tr>

					<tr>
						<th>燃料种类：</th>
						<td><select class="easyui-combobox" id="carFuelType"
							editable="false" name="carFuelType" style="width: 200px;">
								<option value="汽油">汽油</option>
								<option value="柴油">柴油</option>
								<option value="天然气">天然气</option>
								<option value="液化气">液化气</option>
								<option value="氧气">氧气</option>
								<option value="柴油">柴油</option>
								<option value="汽油">汽油</option>
						</select></td>
						<th>排量/功率：</th>
						<td><input id="carDisplacement" name="carDisplacement"
							class="easyui-validatebox" type="text" style="width: 100px;" />ml/
							<input id="carPower" name="carPower" class="easyui-validatebox"
							type="text" style="width: 100px;" />kw</td>
					</tr>
					<tr>
						<th>制造厂名称：</th>
						<td><input id="carManuName" name="carManuName"
							class="easyui-textbox" type="text" style="width: 200px;" /></td>
						<th>转向形式：</th>
						<td><input id="carModality" name="carModality"
							class="easyui-textbox" type="text" style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>轮距：</th>
						<td>前<input id="carTreadBe" name="carTreadBe"
							class="easyui-validatebox" type="text" style="width: 100px;" />
							后<input id="carTreadAfter" name="carTreadAfter"
							class="easyui-validatebox" type="text" style="width: 100px;" />mm
						</td>
						<th>轮胎数：</th>
						<td><input id="carTireNum" name="carTireNum"
							class="easyui-textbox" type="text" style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>轮胎规格：</th>
						<td><input id="carTireSpe" name="carTireSpe"
							class="easyui-textbox" type="text" style="width: 200px;" /></td>
						<th>钢板弹簧片数：</th>
						<td>后轴<input id="carNumOfSpring" name="carNumOfSpring"
							class="easyui-validatebox" type="text" style="width: 200px;" />片
						</td>
					</tr>
					<tr>
						<th>轴距：</th>
						<td><input id="carAxleDist" name="carAxleDist"
							class="easyui-validatebox" type="text" style="width: 200px;" />mm
						</td>
						<th>轴数：</th>
						<td><input id="carAxleNum" name="carAxleNum"
							class="easyui-textbox" type="text" style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>外廓尺寸：</th>
						<td>长<input id="carOutLength" name="carOutLength"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 70px;" /> 宽<input id="carOutWidth"
							name="carOutWidth" class="easyui-validatebox"
							data-options="required:true" type="text" style="width: 70px;" />
							高<input id="carOutHeight" name="carOutHeight"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 70px;" />mm
						</td>
						<th>货箱内部尺寸：</th>
						<td>长<input id="carContLength" name="carContLength"
							class="easyui-validatebox" type="text" style="width: 70px;" /> 宽<input
							id="carContWidth" name="carContWidth" class="easyui-validatebox"
							type="text" style="width: 70px;" /> 高<input id="carContHeight"
							name="carContHeight" class="easyui-validatebox" type="text"
							style="width: 70px;" />mm
						</td>
					</tr>
					<tr>
						<th>总质量：</th>
						<td><input id="carTotalmass" name="carTotalmass"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 200px;" />kg</td>
						<th>核定载质量：</th>
						<td><input id="carApproved" name="carApproved"
							class="easyui-validatebox" tyle="width: 200px;" />kg</td>
					</tr>
					<tr>
						<th>核定载客：</th>
						<td><input id="carApprGuest" name="carApprGuest"
							class="easyui-validatebox" style="width: 200px;" />人</td>
						<th>准牵引总质量：</th>
						<td><input id="carTrac" name="carTrac"
							class="easyui-validatebox" style="width: 200px;" />kg</td>
					</tr>
					<tr>
						<th>驾驶室载客：</th>
						<td><input id="carCabGuest" name="carCabGuest"
							class="easyui-validatebox" type="text" style="width: 200px;" />人</td>
						<th>使用性质：</th>
						<td><select class="easyui-combobox" name="carUseNatu"
							style="width: 200px;" data-options="required:true">
								<option value="001">公路客运</option>
								<option value="002">货运</option>
								<option value="003">公交客运</option>
								<option value="004">出租客运</option>
								<option value="005">旅游客运</option>
								<option value="006">非营运</option>
						</select></td>
					</tr>
					<tr>
						<th>车辆获取方式：</th>
						<td><select class="easyui-combobox" name="carObtWay"
							style="width: 200px;" data-options="required:true">
								<option value="购买" selected="selected">购买</option>
								<option value="仲裁裁决">仲裁裁决</option>
								<option value="继承">继承</option>
								<option value="赠予">赠予</option>
								<option value="协议抵偿债务">协议抵偿债务</option>
								<option value="资产重组">资产重组</option>
								<option value="资产整体买卖">资产整体买卖</option>
						</select></td>
						<th>车辆出厂日期：</th>
						<td><input id="carFacDate" name="carFacDate"
							class="easyui-datebox" editable="false" style="width: 200px;" /></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>