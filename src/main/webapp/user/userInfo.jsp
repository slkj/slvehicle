<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<script type="text/javascript">
var  id;
$(function() {
	alert(123);
	id='1';
	loaddata();
});
function loaddata(){
	alert(id);
   var user = {
		u_id : id
	};
   $.ajax({
		url : "../user/queryOne",
		data : user,
		success : function(data) {
			if (data.success) {
				 alert(data.username);
			}
		}
	});
}

</script>
</head>
<body>
	<style type="text/css">
.dv-table td {
	border: 0;
}

.dv-label {
	font-weight: bold; color: #15428B; width: 100px;
}
</style>

	<table class="dv-table" border="0" style="width: 100%;">
		<tr>
			<td rowspan="3" style="width: 60px"></td>
			<td class="dv-label">用户账号:</td>
			<td id="a">admin</td>
			<td class="dv-label">公司名称:</td>
			<td>神龙科技</td>
		</tr>
		<tr>
			<td class="dv-label">联系人 :</td>
			<td>maxh</td>
			<td class="dv-label">联系电话:</td>
			<td>18132242203</td>
		</tr>
		<tr>
			<td class="dv-label">所在地区:</td>
			<td colspan="3">safasdf</td>
		</tr>
	</table>
</body>
</html>