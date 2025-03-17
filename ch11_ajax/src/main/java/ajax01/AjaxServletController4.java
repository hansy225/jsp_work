package ajax01;

import java.io.IOException;

import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxServletController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("name");
		MemberDao mDao = new MemberDao();
		Member bean = mDao.getMember(id);
		
		// 1. 객체의 주소 반환. toString() 오버라이딩 했다면 toString()의 값(문자열)이 반환
		/*
		 System.out.println(bean); 
		 response.getWriter().print(bean); // 문자열로 출력
		 */		
		
		// 2. JSONobject 객체로
		JSONObject jobj = new JSONObject();
		jobj.put("userId", bean.getId());
		jobj.put("userName", bean.getName());
		jobj.put("userGender", bean.getGender());
		jobj.put("userEmail", bean.getEmail());
		
		response.setContentType("application/json");
		response.getWriter().print(bean);
	}

}
