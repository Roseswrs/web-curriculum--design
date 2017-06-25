package com.classInfo.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classInfo.Entity.News;
import com.classInfo.Service.NewsService;
/*
 * 用来发布新消息
 */
public class PublishNewsServlet extends HttpServlet {
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
		// 获取当前用户姓名
		String user_id = (String) req.getSession().getAttribute("currentstu_num");
		// 获取用户提交的表单数据

		String title = req.getParameter("title");

		String content = req.getParameter("content");

		// 将表单数据封装至JavaBean中
		News news = new News();
		news.setContent(content);
		news.setTitle(title);
		news.setUseId(user_id);

		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy年MM月dd日  HH:mm:ss");
		String currentTime = dateFormat.format(date);

		news.setDate(currentTime);
		// 完成存储

		NewsService newsService = new NewsService();
		newsService.addNews(news);
		resp.sendRedirect(req.getContextPath() + "/news/success.jsp");
	}
}
