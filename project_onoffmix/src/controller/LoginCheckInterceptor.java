package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginCheckInterceptor  extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//로그인이 되어있으면 계속해서 요청 진행
		//로그인이 되어 있지 않으면 loginForm 으로 redirect
		
		HttpSession session = request.getSession();
		
//		HashMap<String,Object> member = new HashMap<>();
		HashMap<String,Object> member = (HashMap<String, Object>) session.getAttribute("member");
		System.out.println("member : " + member);
		

		
		if(member ==null){
			//로그인 상태가 아님
			response.sendRedirect("../member/login");
			return false;
		}
		return true;
	}
}
