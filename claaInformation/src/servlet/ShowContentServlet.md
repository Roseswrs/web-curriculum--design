```java 
/**
*14130140359 肖蜜
*
*/
package com.classInfo.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classInfo.Entity.ContentsList;
import com.classInfo.Service.NewsService;

public class ShowContentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取信息ID加载留言并转向相应的页面
		int newsId = Integer.parseInt(request.getParameter("id"));
		NewsService newsService = new NewsService();
		ContentsList messageList = newsService.findContentById(newsId);
		request.getSession().setAttribute("messageList", messageList);
		response.sendRedirect("../../InformationWeb/news/content.jsp?id="
				+ request.getParameter("id"));
		System.out.println(messageList);
	}
}
