```java
package com.classInfo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.classInfo.Database.ConnectDatabase;
import com.classInfo.Entity.Contents;
import com.classInfo.Entity.ContentsList;
import com.classInfo.Entity.News;
import com.classInfo.Entity.NewsList;

public class NewsDaoDB implements NewsDao {
	static Connection conn = null;
	static {
		// 获得连接对象
		conn = ConnectDatabase.getConnection();
		System.out.println(conn);
	}

	// 分页获取消息列表
	@Override
	public NewsList findNewsByPage(int pageNumber, int numPerPage) {
		// numPerPage 每页多少行消息
		// pagenumber 多少页
		NewsList newsList = new NewsList();
		List<News> newses = new ArrayList<News>();
		// TODO Auto-generated method stub
		// 创建SQL模板
		String sql = "select * from news order by id DESC";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, // 可滚动
					ResultSet.CONCUR_UPDATABLE); // 可更新
			ResultSet rs = ps.executeQuery();
			rs.last(); // 将光标移到最后一行
			// 获得总的数据条目数
			int totalNum = rs.getRow();
			// 获取总页数
			int totalPages = totalNum / numPerPage;
			if (totalNum % numPerPage != 0) {
				totalPages++;
			}
			// 设置总页数
			newsList.setTotlaPageNum(totalPages);
			rs.beforeFirst(); // 移到开头
			if (pageNumber > 1) {
				// 移到给定的行编号
				rs.absolute((pageNumber - 1) * numPerPage);
			}
			int count = 0;
			while (rs.next() && count < numPerPage) {
				count++;
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setUseId(rs.getString("user_id"));
				news.setContent(rs.getString("content"));
				// 如果具体内容过长，则截取0-40的长度
				if (news.getContent().length() >= 40) {
					news.setDescription(news.getContent().substring(0, 40));
				} else {
					news.setDescription(news.getContent());
				}
				news.setDate(rs.getString("publish_date"));
				newses.add(news);
			}
			newsList.setList(newses);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return newsList;
	}

	@Override
	public void sendDiscuss(String newsUrl, String username, String content) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<News> findNewsByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	// 添加留言
	public void addDiscuss(Contents content) {
		// TODO Auto-generated method stub
		// 组拼SQL语句
		String sql = "insert into contents values(?,?,?,?,?)";
		try {
			// 获取SQL语句执行对象
			PreparedStatement psmt = conn.prepareStatement(sql);

			// 将JavaBean中的数据设置给SQL执行对象
			psmt.setString(1, null);
			psmt.setString(2, content.getUserid());
			psmt.setString(3, content.getContent());
			psmt.setString(4, content.getDate());
			psmt.setInt(5, content.getNewsId());
			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	// 获取留言
	public ContentsList findContentById(int newsId) {
		// TODO Auto-generated method stub
		ContentsList cList = new ContentsList();
		List<Contents> list = new ArrayList<Contents>();
		// 查询数据库
		// 组拼SQL
		String sql = "select * from contents where news_id=?";
		try {
			// 获取SQL语句发送对象
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, newsId);
			// 获取结果集
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Contents cont = new Contents();
				cont.setUser_id(rs.getString("user_id"));
				cont.setContent(rs.getString("content"));
				cont.setDate(rs.getString("send_date"));
				list.add(cont);
			}
			// 获取一共有多少行
			rs.last();
			int total = rs.getRow();
			// 将list放入包装类list
			System.out.println(total);
			cList.setList(list);
			cList.setTotalnum(total);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cList;
	}

	@Override
	public void addNews(News news) {
		// TODO Auto-generated method stub
		// 组拼SQL语句
		String sql = "insert into news values(?,?,?,?,?)";
		try {
			// 获取发送SQL语句的对象
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, null);
			psmt.setString(2, news.getTitle());
			psmt.setString(3, news.getContent());
			psmt.setString(4, news.getUserId());
			psmt.setString(5, news.getDate());
			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

```
