<%
	String themeName = "default";

	Cookie cookies[] = request.getCookies();

	if (cookies != null && cookies.length > 0) {

		for (int i = 0; i < cookies.length; i++) {

			if ("themeName".equals(cookies[i].getName())) {

				themeName = cookies[i].getValue();

				break;

			}

		}

	}
%>
<link id="uiTheme" href="${pageContext.request.contextPath}/js/lib/easyui/themes/<%=themeName %>/easyui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/lib/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/input.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/lib/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/lib/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/lib/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/lib/mEasyUI.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/lib/maxExtJquery.js"  type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/lib/DateUtil.js" type="text/javascript"></script>
<!-- cookie支持 -->
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js" type="text/javascript" ></script>


