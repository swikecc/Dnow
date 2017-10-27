package com.dnow.biz;

import com.dnow.entity.User;

public interface UserBiz {
	public User getUserByUid(int uid);
	public User loginByNamePwd(String username, String password);
	public boolean register(User user);
	public boolean ifUserExist(String username);
	public User updateUser(User user);
	public User changeUserPassword(User user);
	public User findUserById(int uid);
}
