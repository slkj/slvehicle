package cn.slkj.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.slkj.clgl.user.entity.User;

public class SessionController extends HandlerInterceptorAdapter {
	public final static String SEESION_MEMBER = "userSession";
	public String[] allowUrls = { "/login.jsp", "/js/", "/css/", "/images/","/user/login" ,"/common/","/lib/","/views" };
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		User u = (User) request.getSession().getAttribute(SEESION_MEMBER);
		String path = request.getRequestURI();
		String contextPath = request.getContextPath();
		String requestUrl = path.replace(contextPath, "");
		if (null != allowUrls && allowUrls.length >= 1) {
			for (String uri : allowUrls) {
				if (requestUrl.contains(uri)) {
					return true;
				}
			}
		}
		if (u == null) {
			response.sendRedirect(contextPath + "/login.jsp");
			return false;
		}  
		return super.preHandle(request, response, handler);
	}
}