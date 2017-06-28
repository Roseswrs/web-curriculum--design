```java
/*
author:14130140358 赵妍
*/

package com.yzz.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yzz.domain.NewsList;
import com.yzz.service.NewsService;



public class ObtainNewsServlet extends HttpServlet {

	private NewsList newsList;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//获取用户设备信息
		String user_agent=request.getHeader("User-Agent");
		System.out.println(user_agent);
		response.setCharacterEncoding("utf-8");
		//获取newsService服务对象
		
		NewsService newsService=new NewsService();
		
		//从request中获取请求参数
		int type=Integer.parseInt(request.getParameter("type"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		
		newsList = newsService.findNewsByPage(pageNum,numPerPage);
		//获取新闻列表,用浏览器访问的情况
		if(user_agent.contains("Windows")){
			
				
			
			if(pageNum<=0){
				pageNum=1;
			}
			
			if(pageNum>newsList.getTotlaPageNum()){
				pageNum=newsList.getTotlaPageNum();
			}
			
			newsList.setPageNum(pageNum);
			
			HttpSession session=request.getSession();
			session.setAttribute("newsList",newsList);
			response.sendRedirect("news/ShowNewsList.jsp");
		}else{
			
		}
	}
}

