```java
package com.classInfo.Dao;

import com.classInfo.Entity.User;
/**
* @author 14130140400-王如思
*/

/*
 * 用户操作的接口
 */
public interface UserDao {
	public User findByStu_num(String stu_num); //通过学号查找
	public User findByName(String name);       //通过姓名查找
	public void add(User user);                 //添加用户
	public void deleteByStu_id(String stu_num);          //通过学号删除用户
	public void changeUserInfo(User user);           //修改用户信息
}

```
