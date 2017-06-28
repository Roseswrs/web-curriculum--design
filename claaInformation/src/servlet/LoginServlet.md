
```java

/*
author：14130140358赵妍
*/
package com.classInfo.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classInfo.dao.UserDaoJDBC;
import com.classInfo.domain.User;
import com.classInfo.service.UserException;
import com.classInfo.service.UserService;



public class LoginServlet extends HttpServlet {

	private String user_agent;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		user_agent = request.getHeader("User-Agent");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		UserService userService=new UserService();
		User form=new User();  //获取表单数据并封装到JavaBean中
		form.setStuId(request.getParameter("stuId"));
		form.setPassword(request.getParameter("password"));
		try {
			
			userService.login(form); //调用service中的方法
			
			response.getWriter().write("登录成功");
			if(user_agent.contains("Windows")){   //将当前登录用户信息保存在session中，以便在jsp中向用户展现当前登录用户
			request.getSession().setAttribute("sessionuser", form.getStuId());
			request.getSession().setAttribute("currentname",new UserDaoJDBC().findByStuId(form.getStuId()).getUsername());
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			}
		} catch (UserException e) {
			response.getWriter().write(e.getMessage());
			// TODO Auto-generated catch block //将错误信息返回
			if(user_agent.contains("Windows")){
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			request.getRequestDispatcher("user/login.jsp").forward(request, response);
			}
		}
	}
}
```
