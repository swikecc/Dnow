package com.dnow.biz.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;

import com.dnow.biz.UserBiz;
import com.dnow.dao.impl.UserDaoImpl;
import com.dnow.entity.User;

public class UserBizImpl implements UserBiz {
	private UserDaoImpl udi = new UserDaoImpl();
	
	@Override
	public User getUserByUid(int uid) {
		return this.udi.getEntity(uid);
	}
	
	@Override
	public boolean register(User user) {
		user.setNickname(user.getUsername());
		Date date = new Date();
		user.setRegdate(date);
		user.setLastlogintime(date);
		try {
			udi.saveEntity(user);
			return true;
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public User loginByNamePwd(String username,String password) {
		List<User> users = udi.getEntities("username=? and password=?", username, password);
		if(users.size()>0) {
			User user = users.get(0);
			user.setLastlogintime(new Date());
			udi.updateEntity(user);
			return user;
		}
		return null;
	}
	
	@Override
	public boolean ifUserExist(String username) {
		List<User> users = udi.getEntities("username=?", username);
		if(users.size()>0)
			return true;
		return false;
	}

	@Override
	public User updateUser(User curruser) {
		try {
			User user = this.udi.getEntity(curruser.getUid());
			if(curruser.getNickname()!=null||curruser.getNickname()!="")
				user.setNickname(curruser.getNickname());
			user.setSex(curruser.getSex());
			user.setBirthday(curruser.getBirthday());
			user.setJob(curruser.getJob());
			user.setEmail(curruser.getEmail());
			user.setPhone(curruser.getPhone());
			user.setQq(curruser.getQq());
			user.setIntroduction(curruser.getIntroduction());
			this.udi.updateEntity(user);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User findUserById(int uid) {
		return this.udi.getEntity(uid);
	}

	@Override
	public User changeUserPassword(User curruser) {
		try {
			User user = this.udi.getEntity(curruser.getUid());
			user.setPassword(curruser.getPassword());
			this.udi.updateEntity(user);
			return user;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}


//	public static void main(String[] args) {
//		UserBizImpl ubi = new UserBizImpl();
//		User user = new User();
//		System.out.println(System.currentTimeMillis());
//		User user00 = new User();
//		user00.setUsername("icer");
//		user00.setPassword("12143");
//		UserBizImpl ubi = new UserBizImpl();
//		ubi.register(user00);
//		User user = ubi.loginByNamePwd("admin", "123");
//		System.out.println(user.getUsername());
//		System.out.println(user.getLastlogintime());
//		User user0 = new User();
//		user0.setUsername("admin");
//		
//		System.out.println(ubi.ifUserExist(user0.getUsername()));
//	}
}
