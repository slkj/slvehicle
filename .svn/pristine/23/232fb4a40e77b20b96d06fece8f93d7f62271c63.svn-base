/**
 * 更改easyui加载panel grid时的提示文字
 * 
 */
$.fn.panel.defaults.loadingMessage = '数据加载中....';
$.fn.datagrid.defaults.loadMsg = '数据加载中....';

/**
 * panel关闭时回收内存，主要用于layout使用iframe嵌入网页时的内存泄漏问题
 * 
 * @requires jQuery,EasyUI
 * 
 */
$.extend($.fn.panel.defaults, {
	onBeforeDestroy : function() {
		var frame = $('iframe', this);
		try {
			if (frame.length > 0) {
				for (var i = 0; i < frame.length; i++) {
					frame[i].src = '';
					frame[i].contentWindow.document.write('');
					frame[i].contentWindow.close();
				}
				frame.remove();
				if (navigator.userAgent.indexOf("MSIE") > 0) {// IE特有回收内存方法
					try {
						CollectGarbage();
					} catch (e) {
					}
				}
			}
		} catch (e) {
		}
	}
});
/**
 * 修改easyui combobox扩展可以默认选择第一行
 */
$.extend($.fn.combobox.methods, {
	selectedIndex : function(jq, index) {
		if (!index) {
			index = 0;
		}
		$(jq).combobox({
			onLoadSuccess : function() {
				var opt = $(jq).combobox('options');
				var data = $(jq).combobox('getData');

				for (var i = 0; i < data.length; i++) {
					if (i == index) {
						$(jq).combobox('setValue', eval('data[index].' + opt.valueField));
						break;
					}
				}
			}
		});
	}
});

$.extend($.fn.validatebox.defaults.rules, {
	md : {
		validator : function(value, param) {
			var d1 = $.fn.datebox.defaults.parser(param[0]);
			var d2 = $.fn.datebox.defaults.parser(value);
			return d2 <= d1;
		},
		message : 'The date must be less than or equals to {0}.'
	}
})

/**
 * 扩展easyui的validator插件rules，支持更多类型验证
 */
$.extend(

$.fn.validatebox.defaults.rules, {
	minLength : { // 判断最小长度
		validator : function(value, param) {
			return value.length >= param[0];
		},
		message : '最少输入 {0} 个字符'
	},
	length : { // 长度
		validator : function(value, param) {
			var len = $.trim(value).length;
			return len >= param[0] && len <= param[1];
		},
		message : "输入内容长度必须介于{0}和{1}之间"
	},
	phone : {// 验证电话号码
		validator : function(value) {
			return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
					.test(value);
		},
		message : '格式不正确,请使用下面格式:020-88888888'
	},
	mobile : {// 验证手机号码
		validator : function(value) {
			return /^(13|15|18)\d{9}$/i.test(value);
		},
		message : '手机号码格式不正确'
	},
	phoneAndMobile : {// 电话号码或手机号码
		validator : function(value) {
			return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
					.test(value)
					|| /^(13|15|18)\d{9}$/i.test(value);
		},
		message : '电话号码或手机号码格式不正确'
	},
	idcard : {// 验证身份证
		validator : function(value) {
			return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value)
					|| /^\d{18}(\d{2}[A-Za-z0-9])?$/i.test(value);
		},
		message : '身份证号码格式不正确'
	},
	intOrFloat : {// 验证整数或小数
		validator : function(value) {
			return /^\d+(\.\d+)?$/i.test(value);
		},
		message : '请输入数字，并确保格式正确'
	},
	currency : {// 验证货币
		validator : function(value) {
			return /^\d+(\.\d+)?$/i.test(value);
		},
		message : '货币格式不正确'
	},
	qq : {// 验证QQ,从10000开始
		validator : function(value) {
			return /^[1-9]\d{4,9}$/i.test(value);
		},
		message : 'QQ号码格式不正确'
	},
	integer : {// 验证整数
		validator : function(value) {
			return /^[+]?[1-9]+\d*$/i.test(value);
		},
		message : '请输入整数'
	},
	chinese : {// 验证中文
		validator : function(value) {
			return /^[\u0391-\uFFE5]+$/i.test(value);
		},
		message : '请输入中文'
	},
	chineseAndLength : {// 验证中文及长度
		validator : function(value) {
			var len = $.trim(value).length;
			if (len >= param[0] && len <= param[1]) {
				return /^[\u0391-\uFFE5]+$/i.test(value);
			}
		},
		message : '请输入中文'
	},
	english : {// 验证英语
		validator : function(value) {
			return /^[A-Za-z]+$/i.test(value);
		},
		message : '请输入英文'
	},
	englishAndLength : {// 验证英语及长度
		validator : function(value, param) {
			var len = $.trim(value).length;
			if (len >= param[0] && len <= param[1]) {
				return /^[A-Za-z]+$/i.test(value);
			}
		},
		message : '请输入英文'
	},
	englishUpperCase : {// 验证英语大写
		validator : function(value) {
			return /^[A-Z]+$/.test(value);
		},
		message : '请输入大写英文'
	},
	unnormal : {// 验证是否包含空格和非法字符
		validator : function(value) {
			return /.+/i.test(value);
		},
		message : '输入值不能为空和包含其他非法字符'
	},
	faxno : {// 验证传真
		validator : function(value) {
			return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
					.test(value);
		},
		message : '传真号码不正确'
	},
	zip : {// 验证邮政编码
		validator : function(value) {
			return /^[1-9]\d{5}$/i.test(value);
		},
		message : '邮政编码格式不正确'
	},
	ip : {// 验证IP地址
		validator : function(value) {
			return /d+.d+.d+.d+/i.test(value);
		},
		message : 'IP地址格式不正确'
	},
	name : {// 验证姓名，可以是中文或英文
		validator : function(value) {
			return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
		},
		message : '请输入姓名'
	},
	engOrChinese : {// 可以是中文或英文
		validator : function(value) {
			return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
		},
		message : '请输入中文'
	},
	engOrChineseAndLength : {// 可以是中文或英文
		validator : function(value) {
			var len = $.trim(value).length;
			if (len >= param[0] && len <= param[1]) {
				return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
			}
		},
		message : '请输入中文或英文'
	},
	carNo : {
		validator : function(value) {
			return /^[\u4E00-\u9FA5][\da-zA-Z]{6}$/.test(value);
		},
		message : '车牌号码无效（例：粤B12350）'
	},
	carenergin : {
		validator : function(value) {
			return /^[a-zA-Z0-9]{16}$/.test(value);
		},
		message : '发动机型号无效(例：FG6H012345654584)'
	},
	same : {
		validator : function(value, param) {
			if ($("#" + param[0]).val() != "" && value != "") {
				return $("#" + param[0]).val() == value;
			} else {
				return true;
			}
		},
		message : '两次输入的密码不一致!'
	},
	selectValueRequired : {

		validator : function(value, param) {
			console.info($(param[0]).find("option:contains('" + value + "')").val());
			return $(param[0]).find("option:contains('" + value + "')").val() != '';
		},
		message : '该输入框为必填项'
	}
});