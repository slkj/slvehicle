<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户信息</title>
<%-- <%@ include file="/common/taglibs.jsp"%> --%>
</head>
<body>
	<form id="uform" >
		<div id="tt" class="easyui-tabs"   data-options="border:false">
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
						</select> / <input id="regNum" name="regNum" class="easyui-validatebox"
							data-options="required:true" type="text" style="width: 150px;" /></td>
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
							class="easyui-datebox" type="text"  editable="false" style="width: 200px;" /></td>
						<th>车辆归属单位：</th>
						<td><input id="ownedId" name="ownedId"  type="text" style="width: 200px;" /></td>
					</tr>
					<tr height="110px">
						<th>车辆彩色照片：</th>
						<td colspan="3">
							<!-- 							<div> --> <!-- 								<label>前 正 面</label><input id="img" type="hidden" name=carImg1><input -->
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
							class="easyui-validatebox" type="text"
							data-options="required:true" style="width: 200px;" /></td>
						<th>发动机型号：</th>
						<td><input id="carEngModel" name="carEngModel"
							class="easyui-validatebox" type="text" style="width: 200px;" /></td>
					</tr>

					<tr>
						<th>燃料种类：</th>
						<td><select class="easyui-combobox" id="carFuelType"
							name="carFuelType" style="width: 200px;">
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
							class="easyui-validatebox" type="text" style="width: 200px;" />kg</td>
					</tr>
					<tr>
						<th>核定载客：</th>
						<td><input id="carApprGuest" name="carApprGuest"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 200px;" />人</td>
						<th>准牵引总质量：</th>
						<td><input id="carTrac" name="carTrac"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 200px;" />kg</td>
					</tr>
					<tr>
						<th>驾驶室载客：</th>
						<td><input id="carCabGuest" name="carCabGuest"
							class="easyui-validatebox" data-options="required:true"
							type="text" style="width: 200px;" />人</td>
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
							style="width: 200px;"  >
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
							class="easyui-datebox" editable="false"
							data-options="required:true" type="text" style="width: 200px;" /></td>
					</tr>
				</table>
			</div>
			<div title="行驶证">
			<!-- 行驶证信息 开始-->
				<table class="grid" id="drivingtab">
					<tr>
						<th colspan="4" style="text-align: center">行驶证信息</th>
					</tr>
					<tr>
						<th>注册日期：</th>
						<td><input id="driRegDate" name="driRegDate"
							class="easyui-datebox" editable="false" type="text"
							style="width: 200px;" /></td>
						<th>发证日期：</th>
						<td colspan="3"><input id="driCertDate" name="driCertDate"
							class="easyui-datebox" editable="false" type="text"
							style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>强制报废期止：</th>
						<td colspan="3"><input id="baoFeiDate" name="baoFeiDate"
							class="easyui-datebox" editable="false" type="text"
							style="width: 200px;" /></td>
					</tr>
					<tr>
						<th>备注：</th>
						<td colspan="3"><textarea id="introd" name="introd" cols="20" disabled="disabled"
								rows="2" style="width: 100%"> </textarea></td>
					</tr>
					
				</table>
				<!-- 行驶证信息 结束-->
				
				<!-- 检验记录管理 开始-->
				<div style="margin-top: 15px;"></div>
				<table class="grid" id="jianceTab" style="text-align: center">
					<tr>
						<th colspan="3" style="text-align: center">检验记录管理 ( <input
							type="button" onclick="jianceAdd('jianceTab', -2)" value="添加">
							<input type="button" onclick="delTr2()" value="删除" />)
						</th>
					</tr>
					<tr>
						<th style="text-align: center">
							
						</th>
						<th style="text-align: center">
							检测机关
						</th>
						<th style="text-align: center">
							检验有效期至
						</th>
					</tr>
					
					
				</table>
				<!-- 检验记录管理 结束-->
			</div>
			<div title="运输证">
				<!-- 运输证信息 开始-->
				<div style="margin-top: 15px;"></div>
				<table class="grid" id="drivingtab">
					<tr>
						<th colspan="4" style="text-align: center">道路运输证信息</th>
					</tr>
					<tr>
						<tr>
							<th>冀交运管:</th>
							<td>
								<input id="traWord" name="traWord" class="easyui-validatebox" type="text" style="width: 50px;" data-options="required:true"/>字
								<input id="traCode" name="traCode" class="easyui-validatebox" type="text" style="width: 200px;" data-options="required:true"/>号
							</td>
							<th>经济类型：</th>
							<td>
								<input id="traEcoType" name="traEcoType" class="easyui-validatebox" type="text" style="width: 200px;"/>
							</td>
						</tr>
					</tr>
					<tr>
						<th>经营许可证:</th>
						<td>
							<input id="traBusLicNo" name="traBusLicNo" class="easyui-validatebox" type="text" style="width: 200px;"/>
						</td>
						<th>经营许可证核发日期：</th>
						<td>
							<input id="traBusLicDate" name="traBusLicDate" class="easyui-datebox" type="text" style="width: 200px;" data-options="required:true"/>
						</td>
					</tr>
					<tr>
						<th>备注：</th>
						<td colspan="3">
							<textarea id="introd" name="introd" cols="20" rows="4" style="width: 100%">
							</textarea>
						</td>
					</tr>
				</table>
				<!-- 运输证信息 结束-->
				
				<!-- 检验记录管理 开始-->
				<div style="margin-top: 15px;"></div>
				<table class="grid" id="jianceTab" style="text-align: center">
					<tr>
						<th colspan="3" style="text-align: center">检验记录管理 ( <input
							type="button" onclick="jianceAdd('jianceTab', -2)" value="添加">
							<input type="button" onclick="delTr2()" value="删除" />)
						</th>
					</tr>
					<tr>
						<th style="text-align: center">
							
						</th>
						<th style="text-align: center">
							检测机关
						</th>
						<th style="text-align: center">
							检验有效期至
						</th>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center"><a href="#"
							class="easyui-linkbutton"
							data-options="iconCls:'icon-save',plain:true" onclick="save()">保存</a>
							<a href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-cancel',plain:true"
							onclick="closeWindow()">关闭</a></td>
					</tr>
				</table>
				<!-- 检验记录管理 结束-->
			</div>
			<div title="二级维护">
				<table class="grid">
					<tr>
						<th colspan="6" style="text-align: center;"><span
							style="font-size: 14pt; color: #000000; font-family: 隶书">二级维护</span>
						</th>
					</tr>
					<tr>
						<th align="right">二保单位:</th>
						<td><input name="keepaddress" style="width: 200px;" class="easyui-validatebox" data-options="required:true" /></td>
						<th align="right">上次维修日期:</th>
						<td><input id="lastriqi" class="easyui-datebox" name="lastriqi"
							editable="false" style="width: 200px" data-options="required:true"></td>
					 	<th align="right">维护日期:</th>
						<td><input id="riqi" class="easyui-datebox" name="riqi"
							editable="false" style="width: 200px" data-options="required:true"></td>
					</tr>
					
					<tr>
						<th align="right">下次维护日期:</th>
						<td><input id="nextriqi" class="easyui-datebox"
							name="nextriqi" editable="false" style="width: 200px" data-options="required:true"></td>
						<th align="right">使用年限(年):</th>
						<td><input id="life" name="life" style="width: 200px;"  class="easyui-validatebox" data-options="required:true" /></td>
						<th align="right">年检日期:</th>
						<td><input id="examine" class="easyui-datebox" name="examine"
							editable="false" style="width: 200px" data-options="required:true"></td>
					</tr>
					<tr>
						<th align="right">备注:</th>
						<td colspan="5"><textarea id="remark" name="remark"
								style="width: 100%;" rows="2"></textarea></td>
					</tr>
				</table>
			</div>
			<div title="卫星定位服务">
				<table class="grid">
					<tr>
						<th colspan="6" style="text-align: center;"><span
							style="font-size: 14pt; color: #000000; font-family: 隶书">定位服务</span>
						</th>
					</tr>
					<tr>
						<th align="right">服务商:</th>
						<td><input id="cc" name="facilitator" data-options="required:true" style="width: 200px;" /></td>
					
						<th align="right">终端型号:</th>
						<td><input name="terminaltype" style="width: 200px;" class="easyui-validatebox" data-options="required:true"  /></td>
					 	<th align="right">车载终端ID:</th>
						<td><input name="carterminalid" style="width: 200px;" class="easyui-validatebox" data-options="required:true"  /></td>
					</tr>
					
					<tr>
						<th align="right">SIM卡号:</th>
						<td><input name="simcard" style="width: 200px;"  class="easyui-validatebox" data-options="required:true" /></td>
					<th align="right">安装人员:</th>
						<td><input name="installer" style="width: 200px;"  class="easyui-validatebox" data-options="required:true" /></td>
					
						<th align="right">维修电话:</th>
						<td><input name="phone" style="width: 200px;"  class="easyui-validatebox" data-options="required:true" /></td>
					</tr>
					<tr>
						<th align="right">初装日期:</th>
						<td>
	 					<input name="installriqi" class="easyui-datebox" data-options="required:true" editable="false" style="width:200px"  /> 
	
						</td>
						<th align="right">维保日期:</th>
						<td>
	 						<input name="endriqi" class="easyui-datebox" data-options="required:true"  editable="false" style="width:200px"  /> 
	
						</td>
						<th></th><td></td>
					</tr>
					<tr>
						<th align="right">安装证明编号:</th>
						<td>
	 					<input name="azzm"  class="easyui-validatebox"  data-options="required:true" style="width:200px"  /> 
	
						</td>
						<th align="right">前置/使用 证明编号:</th>
						<td colspan="3">
							<label><input name=qzsy type=radio value="前置"/>前置</label>
							<label><input name=qzsy type=radio value="使用"/>使用</label>
	 						<input name="qzsyzm"  class="easyui-validatebox"  data-options="required:true" style="width:200px"  /> 
						</td>
					</tr>
					<tr>
						<th align="right">备注:</th>
						<td colspan="5"><textarea id="remark" name="remark"
								style="width: 100%;" rows="2"></textarea></td>
					</tr>
				</table>
			</div>
			<div title="车辆保险项目">
				<table class="grid">
					<tr>
						<th colspan="6" style="text-align: center;"><span
							style="font-size: 14pt; color: #000000; font-family: 隶书">投保项目</span>
						</th>
					</tr>
					<tr>
						<th>保单号：</th>
						<td><input type="text" name="policy" class="easyui-validatebox"
							style="width: 200px" data-options="required:true" /></td>
							<th align="right">投保类型:</th>
						<td><input id="insuranceType" name="insuranceType" style="width: 200px;" data-options="required:true" /></td>
					 	<th align="right">费用(元):</th>
						<td><input name="feiyong" style="width: 200px;" class="easyui-validatebox" data-options="required:true" /></td>
					</tr>
					
					<tr>
						<th align="right">保&nbsp;险&nbsp;期&nbsp;间:</th>
						<td colspan="3">自<input id="startTime" class="easyui-datebox"
							name="startTime" editable="false" style="width: 200px"
							data-options="required:true"> 零时起 至 <input id="endTime"
							class="easyui-datebox" name="endTime" editable="false"
							style="width: 200px" data-options="required:true">二十四时止
						</td>
						<th align="right">承保单位:</th>
						<td><input id="insuranceCompany" name="insuranceCompany"
							style="width: 200px;" data-options="required:true" /></td>
					</tr>
					<tr>
						<th align="right">投保日期:</th>
						<td><input id="riqi" class="easyui-datebox" name="riqi"
							editable="false" style="width: 200px" data-options="required:true"></td>
						<th align="right">核保人:</th>
						<td><input name="checkMan" style="width: 200px;"
							class="easyui-validatebox" data-options="required:true" /></td>
						<th align="right">制单人:</th>
						<td><input name="makeMan" style="width: 200px;"
							class="easyui-validatebox" data-options="required:true" /></td>
					</tr>
	
					<tr>
						<th align="right">备注:</th>
						<td colspan="5"><textarea id="remark" name="remark"
								style="width: 100%;" rows="2"></textarea></td>
					</tr>
				</table>
			</div>
			<div title="转移登记"></div>
		</div>
	</form>
</body>
</html>