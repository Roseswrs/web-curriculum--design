```java
package com.classInfo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.classInfo.Database.ConnectDatabase;
import com.classInfo.Entity.User;

/*
 * 与数据库连实现UserDao的方法
 */
public class UserDaoDB implements UserDao {
	private static Connection conn;
	static {
		// 获得连接对象
		conn = ConnectDatabase.getConnection();
		System.out.println(conn);
	}

	@Override
	public User findByStu_num(String stu_num) {
		// TODO Auto-generated method stub
		PreparedStatement psta; // 继承自Statement，动态
		User user = null;
		ResultSet rs = null;
		try {
			// 创建SQL模板
			String sql = "SELECT * FROM user_info where stu_num =?";
			psta = (PreparedStatement) conn.prepareStatement(sql);

			psta.setString(1, stu_num);

			rs = psta.executeQuery();
			// rs为空
			if (rs == null) {
				return null;
			}
			if (rs.next()) {
				// 如果找到了，进行封装
				user = new User();
				user.setStuNum(rs.getString("stu_num")); // 设置学号
				user.setUsername(rs.getString("username")); // 姓名
				user.setPassword(rs.getString("userpassword")); // 密码
				user.setGender(rs.getString("gendar")); // 性别
			} else {
				// 没找到
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public User findByName(String name) {
		// TODO Auto-generated method stub
		PreparedStatement psta;
		User user = null;
		ResultSet rs = null;
		try {
			// 二，创建SQL模板
			String sql = "SELECT * FROM user_info where username =?";
			psta = (PreparedStatement) conn.prepareStatement(sql);

			psta.setString(1, name);

			rs = psta.executeQuery();
			// rs为空
			if (rs == null) {
				return null;
			}
			if (rs.next()) {
				// 如果找到了，进行封装
				user = new User();
				user.setStuNum(rs.getString("stu_num"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("userpassword"));
				user.setGender(rs.getString("gendar"));
			} else {
				// 没找到
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public void add(User user) {
		// TODO Auto-generated method stub

		// 二，准备SQL模板，得到psta
		String sql = new String();
		sql = "INSERT INTO user_info VALUES(?,?,?,?)";
		PreparedStatement psta = null;
		try {
			// 三，得到psmt
			psta = conn.prepareStatement(sql);

			// 四，为psta的四个问号赋值
			psta.setString(1, user.getUsername());
			psta.setString(2, user.getStuNum());
			psta.setString(3, user.getPassword());
			psta.setString(4, user.getGender());
			// Date date = new Date();
			// SimpleDateFormat dateFormat = new SimpleDateFormat(
			// "yyyy年MM月dd日  HH:mm:ss");
			// String currentTime = dateFormat.format(date);

			// 五，操作数据库
			psta.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				// 关闭psta
				psta.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteByStu_id(String stu_num) {
		// TODO Auto-generated method stub
		// 组拼SQL语句
		String sql = "DELETE FROM user_info WHERE stu_num = ?";
		try {
			// 获得SQL发送对象

			PreparedStatement psta = conn.prepareStatement(sql);

			psta.setString(1, stu_num);

			// 执行删除操作
			psta.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void changeUserInfo(User user) {
		// TODO Auto-generated method stub
		// 更新用户名
		String sql_name = "update user_info set username = ? where stu_num = ?";
		String sql_password = "update user_info set userpassword = ? where stu_num = ?";
		String sql_gender = "update user_info set gender = ? where stu_num = ?";
		try {

			PreparedStatement psmt_name = conn.prepareStatement(sql_name);
			psmt_name.setString(1, user.getUsername());
			psmt_name.setString(2, user.getStuNum());
			psmt_name.executeUpdate();  //修改用户名

			PreparedStatement psmt_password = conn
					.prepareStatement(sql_password);
			psmt_password.setString(1, user.getPassword());
			psmt_password.setString(2, user.getStuNum());
			psmt_password.executeUpdate();   //修改密码

			PreparedStatement psmt_gender = conn.prepareStatement(sql_gender);
			psmt_gender.setString(1, user.getGender());
			psmt_gender.setString(2, user.getStuNum());
			psmt_gender.executeUpdate();   //修改性别

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

```
