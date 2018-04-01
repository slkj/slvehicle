function loadCompany(cid){
	top.$("#ownedId").combobox({
		url : 'company/queryComList',
		editable : false, cache : false,
		valueField : 'id',textField : 'gsmc'
	});
}
function loadXZQH() {
	top.$('#province').combobox({
		url : 'xzqh/province.do',
		editable : false, // 不可编辑状态
		cache : false,
		panelHeight : '160',
		valueField : 'code',
		textField : 'note',
		onSelect : function(param) {
			top.$('#city').combobox('clear');
			top.$('#county').combobox('clear');
			var province = param.code;
			top.$("#cregicounty").val(province);
			if (province != '') {
				$.ajax({
					type : "POST",
					url : "../xzqh/city.do?province=" + province,
					cache : false,
					dataType : "json",
					success : function(data) {
						top.$("#city").combobox("loadData", data);
					}
				});
			}
		}
	});
	top.$('#city').combobox({
		editable : false, // 不可编辑状态
		cache : false,
		panelHeight : '160',
		valueField : 'code',
		textField : 'note',
		onSelect : function(param) {
			top.$('#county').combobox('clear');
			var city = param.code;
			top.$("#cregicounty").val(city);
			if (city != '') {
				$.ajax({
					type : "POST",
					url : "../xzqh/county.do?city=" + city,
					cache : false,
					dataType : "json",
					success : function(data) {
						top.$("#county").combobox("loadData", data);
					}
				});
			}
		}
	});
	top.$('#county').combobox({
		editable : false, // 不可编辑状态
		cache : false,
		panelHeight : '160',
		valueField : 'code',
		textField : 'note',
		onSelect : function(param) {
			top.$("#cregicounty").val(param.code);
		}
	});
}