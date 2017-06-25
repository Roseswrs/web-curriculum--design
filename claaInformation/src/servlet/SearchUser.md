```java 
/**
*14130140359 肖蜜
*
*/
package com.classInfo.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classInfo.Entity.User;
import com.classInfo.Service.UserException;
import com.classInfo.Service.UserService;


public class SearchUser extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		// 获得查找方法
		String way = req.getParameter("way");
		// 获得参数

		UserService userService = new UserService();
		String param = req.getParameter("param");

		if (way != null && param != null) {
			try {
				User user = userService.searchUser(way, param);

				req.getSession().setAttribute("user", user);
				resp.sendRedirect(req.getContextPath()+"/user/userInfo.jsp");

			} catch (UserException e) {
				// TODO Auto-generated catch block
				req.getSession().setAttribute("searchError", e.getMessage());
				resp.sendRedirect(req.getContextPath()+"/user/SercherUser.jsp");
			}
		}
	}
}
