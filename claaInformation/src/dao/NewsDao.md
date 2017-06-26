```java
package com.classInfo.Dao;
/**
* @author 14130140400 王如思
*/
import java.util.List;

import com.classInfo.Entity.Contents;
import com.classInfo.Entity.ContentsList;
import com.classInfo.Entity.News;
import com.classInfo.Entity.NewsList;


public interface NewsDao {
	//通过页面数查找消息列表
	public NewsList findNewsByPage(int pageNumber,int numPerPage);  
	
	public void sendDiscuss(String newsUrl,String username,String content);
	public List<News> findNewsByUsername(String username);
	//添加留言
	public void addDiscuss(Contents content);
	//获取留言
	public ContentsList findContentById(int newsId);
	//添加xinwen
	public void addNews(News news);
}
```
