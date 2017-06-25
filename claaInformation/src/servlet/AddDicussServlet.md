```java 
/**
*14130140359 肖蜜
*
*/
package com.classInfo.Servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classInfo.Entity.Contents;
import com.classInfo.Service.NewsService;

/**
 * 接受用户提交的评论并存储，提交成功后返回
 *
 */

public class AddDicussServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		//获取用户提交的留言数据
		int newsId=Integer.parseInt(req.getParameter("newsId"));
		String user_id=req.getParameter("userid");
		String content=req.getParameter("content");
		Date date=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss");
		String currentTime=dateFormat.format(date);
		
		//将留言数据封装至JavaBean中
		Contents message=new Contents();
		message.setContent(content);
		message.setDate(currentTime);
		message.setNewsId(newsId);
		message.setUser_id(user_id);
		
		//将留言存入数据库
		
		//获取newsService
		
		NewsService newsService=new NewsService();
		//存入数据库
		newsService.addDiscuss(message);
		
		resp.sendRedirect("../../InformationWeb/servlet/ShowContentServlet?id="+newsId);
	}

}
