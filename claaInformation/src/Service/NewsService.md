package com.classInfo.Service;
/**
*   @author 14130140396-吴莹晶
*/

import com.classInfo.Dao.DaoFactory;
import com.classInfo.Dao.NewsDao;
import com.classInfo.Entity.Contents;
import com.classInfo.Entity.ContentsList;
import com.classInfo.Entity.News;
import com.classInfo.Entity.NewsList;


public class NewsService {
	// 使用工厂模式获取newsDao
	public NewsDao newsDao = DaoFactory.getNewsDao();
	// 根据类型和页码查询班级信息
	public NewsList findNewsByPage(int pageNum, int numPerPage) {
		NewsList list = newsDao.findNewsByPage(pageNum, numPerPage);
		return list;
	}
	// 添加留言
	public void addDiscuss(Contents content) {
		newsDao.addDiscuss(content);
	}
	// 根据新闻ID获取留言

	public ContentsList findContentById(int newsId) {
		return newsDao.findContentById(newsId);
	}
	// 发布新消息
	public void addNews(News news) {
		newsDao.addNews(news);
	}
}
