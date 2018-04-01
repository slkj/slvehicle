/**
 * 行政区划选择必须保证ID一直
 */
$(function() {
	/**
	 * 下拉框选择控件，下拉框的内容是动态查询数据库信息
	 */
	$('#province').combobox({
		url : '../xzqh/province.do',
		editable : false, // 不可编辑状态
		cache : false,
		panelHeight : '160',
		valueField : 'code',
		textField : 'note',
		onSelect : function(param) {
			$('#city').combobox('clear');
			$('#county').combobox('clear');
			var province = param.code;
			$("#cregicounty").val(province);
			if (province != '') {
				$.ajax({
					type : "POST",
					url : "../xzqh/city.do?province=" + province,
					cache : false,
					dataType : "json",
					success : function(data) {
						$("#city").combobox("loadData", data);
					}
				});
			}
		}
	});
	$('#city').combobox({
		editable : false, // 不可编辑状态
		cache : false,
		panelHeight : '160',
		valueField : 'code',
		textField : 'note',
		onSelect : function(param) {
			$('#county').combobox('clear');
			var city = param.code;
			$("#cregicounty").val(city);
			if (city != '') {
				$.ajax({
					type : "POST",
					url : "../xzqh/county.do?city=" + city,
					cache : false,
					dataType : "json",
					success : function(data) {
						$("#county").combobox("loadData", data);
					}
				});
			}
		}
	});
	$('#county').combobox({
		editable : false, // 不可编辑状态
		cache : false,
		panelHeight : '160',
		valueField : 'code',
		textField : 'note',
		onSelect : function(param) {
			$("#cregicounty").val(param.code);
		}
	});
});