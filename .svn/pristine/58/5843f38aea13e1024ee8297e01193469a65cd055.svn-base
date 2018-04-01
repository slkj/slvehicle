var _menus;
window.onload = function() {
	$('#loading-mask').fadeOut();
}
function logoff() {
	$.ajax({
		url : "user/logOffCms",
		success : function() {
			top.location.href = "login.jsp";
		}
	});
}
function upsys() {
	$("#divModPass").dialog('open');
}
function wlsh() {
	window.open("http://www.wlsh.cn");
}
$(function() {
	// var Request = new Object();
	// Request = GetRequest();
	// ctype = Request['t'];
	//默然加载首页
	rightFrame('首页', 'home.jsp');
	getMenuData();
	$('#ith').combobox({
		panelHeight : 100,
		onChange : function(newVal, oldVal) {
			var oldHref = $('#uiTheme').attr('href');
			var newHref = oldHref.substring(0, oldHref.indexOf('themes')) + 'themes/' + newVal
					+ '/easyui.css';
			console.log(newHref);
			$('#uiTheme').attr('href', newHref);
			// 设置cookie值，并设置7天有效时间
			$.cookie('themeName', newVal, {
				expires : 7
			})
		}
	});
});
//ajax后台获取菜单json数据
function getMenuData() {
	// 导航菜单绑定初始化
	$.ajax({
		url : "module/getModuleByUserid?userid=" + $("#u_id").val(),
		type : "POST",
		dataType : "json",
		success : function(data) {
			_menus = data[0].children;
			//初始化页面top菜单
			addTitleMenus();
		}
	});
}
/**
 * 初始化top菜单
 * 
 * @param data
 */
function addTitleMenus() {
	var topMenus = "<ul><li><a  id=\"toplink0\" onclick=\"showHome()\" href=\"#\">首页</a></li>";
		$.each(_menus, function(i, sm) {
			if (sm.parent_id == "1") {
				topMenus += '<li><a id="toplink' + parseInt(i+1) + '" onclick="carMenus(' + i
						+ ')" href="#">' + sm.name + '</a></li>';
			}
		});
	topMenus += "</ul>";
	$("#topMenus").append(topMenus);
	//默认选中第一菜单
	showHome();
	// 左侧默认加载除首页外的第一个菜单按钮
	//carMenus(0);
	$("#menu").empty();
	// 判断是不是车辆管理菜单
	var sm = _menus[0];
	initLeft(sm);
}
function showHome() {
	expand(0);
	rightFrame("我的桌面", "home.jsp");
}
function carMenus(pid) {
	expand(parseInt(pid+1));
	$("#menu").empty();
	// 判断是不是车辆管理菜单
	var sm = _menus[pid];
	initLeft(sm);
}
function initLeft(sm) {
	var menulist = '<div class="easyui-accordion" fit="true" border="false"><div  style="overflow: auto; padding: 10px;"><ul id="menu1" class="bigicon menuItem">';
//	priority:1
	var obj =sm.children;
	var a = [];
	$.each(obj, function(key, val) {
		a[a.length] = key;
	});
	a.sort();
	$.each(a, function(i, key) {
//		window.alert("key = " + obj[key]); // 访问JSON对象属性
//	});
//	$.each(sm.children, function(j, o) {
		var o =obj[key];
		menulist += '<li><div style="overflow: auto;padding:5px;"><a pid="'+o.parent_id+'" ref="'
				+ o.id + '" href="#" rel="' + o.url+ '"><span class="img" ><img src="' + o.icon
				+ '"></span><span class="nav">' + o.name
				+ '</span></a></div></li> ';
	});
	menulist += '</ul></div></div>';
	$("#menu").append(menulist);
	InitLeftMenu();
}
// 初始化左侧
function InitLeftMenu() {
	hoverMenuItem();
	$('#menu li a').on('click', function() {
		var tabTitle = $(this).children('.nav').text();
		var url = $(this).attr("rel");
		var ref = $(this).attr("ref");
		var pid = $(this).attr("pid");
		//判断父级是否是车辆管理模块
		//1、判断用户类型，企业用户直接查询数据 or 平台用户根据单位长度，长度大于3的，显示树形
		var utpye= $("#u_type").val()+"";
		if(url.indexOf("?") <=  0){
			url+="?1=1" 
		}
		if(utpye == "1"){
			var companyid= $("#companyid").val()+"";
			rightFrame(tabTitle, url+"&moduleId="+ref);
			$('#menu li div').removeClass("selected");
			$(this).parent().addClass("selected");
		}else{
			var depId= $("#depId").val()+"";
			if(depId.length <= 3 && pid == "2"){
				$("#menu").empty();
				SecondMenus(tabTitle,url,ref);
			}else{
				rightFrame(tabTitle, url+"&moduleId="+ref);
				$('#menu li div').removeClass("selected");
				$(this).parent().addClass("selected");
			}
		}
	});

}
//创建车辆管理二级菜单
function SecondMenus(tabTitle,url,ref){
	var menulist = '<div style="margin-top : 5px;" class="panel-header"><div class="panel-title">'+tabTitle+'</div>'
		+'<div style="width:30px;right: 5px;position: absolute; top: 50%;margin-top: -8px;height: 16px;overflow: hidden;">'
		+'<a style="text-decoration: none;font-weight: bold;color:#CDAA7D" href="javascript:void(0)" onclick="carMenus(0);">返回</a>'
		+'</div></div><ul id="carTree"></ul>';
	$("#menu").append(menulist);
	initSTree(tabTitle,url,ref);
}
//加载二级菜单树形
function initSTree(tabTitle,url,ref){
	$('#carTree').tree({    
		url : 'dep/getDepTree',
	    animate:true,
	    lines:true,
	    onClick: function(node){
			rightFrame(tabTitle,url+"&depId="+node.id+"&moduleId="+ref);
		}
	});
}





/**
 * 菜单项鼠标Hover
 */
function hoverMenuItem() {
	$(".easyui-accordion").find('a').hover(function() {
		$(this).parent().addClass("hover");
	}, function() {
		$(this).parent().removeClass("hover");
	});
}
function rightFrame(title, url) {
	if (url != "" && url != "NULL") {
		$("#cnIframe").attr("src", url);
		$("#center").panel({
			title : title
		});
	} else {
		$("#cnIframe").attr("src", "default.html");
	}

}
function setFontCss(treeId, treeNode) {
	switch (treeNode.level) {
	case 0:
		style = {
			color : "blue"
		};
		break;
	case 1:
		style = {
			color : "red"
		};
		break;
	default:
		style = {};
		break;
	}
	return style;
};
function expand(el) {
	for (var i = 0; i < 6; i++) {
		if (el == i) {
			$('#toplink' + i).attr('class', 'nav_01');
		} else {
			$('#toplink' + i).attr('class', 'nav_02');
		}

	}
}
function uploadImg() {
	top.max.showWindow({
		title : '上传图片',
		iconCls : 'icon-undo',
		width : 600,
		height : 450,
		closed : false,
		cache : false,
		modal : true,
		url : 'upload.jsp',
		onLoad : function() {
			loadCompany();
			//ajax查询单个信息，form回填数据
			$.ajax({
				url : '../vehicle/queryOne?id=' + id,
				async : false,
				cache : false,
				success : function(data) {
					if (data) {
						top.$("#uform").form('load', data);
					}
				}
			});
			top.$('#tt').tabs({
				border : false,
				onSelect : function(title, index) {
				}
			});
		},
		buttons : [ {
			text : '上传',
			iconCls : 'icons icons_45',
			handler : function() {
				$("#carImg").val("");
			}
		}, {
			text : '关闭',
			handler : function() {
				top.max.closedlg();
			}
		} ]
	});
}