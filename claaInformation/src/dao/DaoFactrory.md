```java
package com.classInfo.Dao;
/**
*   @author 14130140400-王如思
*/
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DaoFactory {
	private static Properties prop = null;
	private static UserDao userDao;
	/**
	 * 返回一个具体的userDao的实现类 的对象
	 * 
	 * @return 变化的只是实现类的名字，把它保存在 配置文件中，通过反射完成对象的创建
	 */
	static {
		// 1.加载配置文件
		//配置文件使得用户能够脱离程序本身去修改相关的变量设置
		InputStream in = DaoFactory.class.getClassLoader().getResourceAsStream(
				"dao.properties");
		prop = new Properties();
		try {
			prop.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//返回一个UserDao实例
	public static UserDao getUserDao() {
		// TODO Auto-generated method stub
		// 得到Dao实现类的名称
		//daoClassName应为UserDaoDB
		String daoClassName = prop.getProperty("com.wrs.Dao.UserDao");
		try {
			// 通过反射来创建实现类的对象
			Class<?> clazz = Class.forName(daoClassName);
			userDao = (UserDao) clazz.newInstance();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userDao;
	}
//获得newsDao实例
	public static NewsDao getNewsDao() {
		String className = "com.wrs.Dao.NewsDaoDB";
		NewsDao newsDao = null;
		try {
			newsDao = (NewsDao) Class.forName(className).newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return newsDao;
	}

}

```
