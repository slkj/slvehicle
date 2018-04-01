<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆管理系统平台</title>
<link rel="shortcut icon" href="common/sl_favicon.ico" />
<%@ include file="common/taglibs.jsp"%>
 <link rel="stylesheet" type="text/css" href="css/imgareaselect-default.css" />
<script type="text/javascript" src="js/SL.index.js"></script>
</head>
<body id="cc" class="easyui-layout">
	<input type="hidden" id="u_id" value="${userSession.u_id } " />
	<input type="hidden" id="u_type" value="${userSession.type }" />
	<input type="hidden" id="depId" value="${userSession.departcode }" />
	<input type="hidden" id="companyid" value="${userSession.companyid }" />
	
	<noscript>
		<div
			style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
			<img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
	<div data-options="region:'north'" style="border: 0px">
		<div class="header">
			<div class="header_cont">
				<div id="topMenus" class="hea_nav"></div>
				<div class="system">
					<a href="javascript:void(0)" onclick="javascript:upsys()"
						title="修改用户密码"> <img border="0"
						src="images/btn_hd_support.gif" title="修改用户密码" alt="修改用户密码">
					</a> <a href="javascript:void(0)" onclick="javascript:wlsh()"
						title="帮助"> <img border="0" src="images/btn_hd_help.gif"
						title="帮助" alt="帮助">
					</a> <a href="javascript:void(0)" onclick="javascript:logoff()"
						title="退出系统"> <img border="0" src="images/btn_hd_exit.gif"
						title="退出系统" alt="退出系统">
					</a>
				</div>
			</div>
		</div>
	</div>
	<div data-options="region:'west',title:'导航菜单',split:'true'"
		style="width: 180px; height: auto; overflow: auto;">
		<div id="menu" class="easyui-accordion" fit="true" border="false"
			style="overflow: auto;"></div>
	</div>
	<div id="center" data-options="region:'center',title:' '"
		border="false">
		<iframe id="cnIframe" scrolling="auto" frameborder="0"
			style="width: 100%; height: 100%"></iframe>
	</div>
	<div data-options="region:'south'" style="height: 30px;">
		<div class="footer">版权所有：河北神龙物流信息科技有限公司  技术支持：北京神龙天地网络科技有限公司</div>
	</div>

	<div id="divModPass" class="easyui-dialog"
		data-options="closed:true,title:'修改密码',modal:true"
		style="width: 330px; height: 260px;">
		<form id="ffModPass" method="post" novalidate="novalidate">
			<table cellspacing="1" cellpadding="0" border="0" width="100%">
				<tr style="height: 40px;">
					<th style="width: 100px; font-weight: bold; text-align: right;">原密码：</th>
					<td style="width: 200px">
						<input type="hidden" id="txtName" value="" /> 
						<input type="password" id="txtOldPass" maxlength="30" />
					</td>
				</tr>
				<tr style="height: 40px;">
					<th style="width: 100px; font-weight: bold; text-align: right;">新密码：</th>
					<td style="width: 200px">
						<div style="float: left; margin-top: 2px;">
							<input type="password" id="txtNewPass" maxlength="30" class="easyui-validatebox" data-options="required:true,validType:'length[1,30]'" />
						</div>
					</td>
				</tr>
				<tr style="height: 40px;">
					<th style="width: 100px; font-weight: bold; text-align: right;">确认新密码：</th>
					<td style="width: 200px"><input type="password"
						id="txtCheckPass" maxlength="30" class="easyui-validatebox"
						data-options="required:true,validType:'length[1,30]'" /></td>
				</tr>
				<tr>
					<td colspan="2" height="20"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><a href="javascript:void(0)"
						class="easyui-linkbutton" iconcls="icon-lock" id="btnModifyPass"
						onclick="ModifyPass()">提交</a> <a href="javascript:void(0)"
						class="easyui-linkbutton" iconcls="icon-cancel"
						onclick="javascript:$('#divModPass').dialog('close')">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>