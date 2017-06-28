```java
/** @author 王一诺
 ** 14130140399
 */

package com.classInfo.Database;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectDatabase {
	private static String url;
	private static String name;
	private static String password;
	private static Connection conn;
	static{
		try {
			//加载驱动类
			
			String className="com.mysql.jdbc.Driver";
			Class.forName(className);
			InputStream inputStream = ConnectDatabase.class.getClassLoader().getResourceAsStream("jdbc.properties");
			Properties prop=new Properties();
			try {
				prop.load(inputStream);
				 url=prop.getProperty("url");
				 name=prop.getProperty("name");
				 password=prop.getProperty("password");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			conn=DriverManager.getConnection(url, name, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
}
```
