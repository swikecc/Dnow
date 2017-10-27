package com.dnow.biz.impl;

import java.util.List;

import com.dnow.biz.AdminBiz;
import com.dnow.dao.impl.AdminDaoImpl;
import com.dnow.entity.Admin;

public class AdminBizImpl implements AdminBiz {
	private AdminDaoImpl adi = new AdminDaoImpl();

	@Override
	public Admin loginByNamePwd(String adminName, String password) {
		List<Admin> adminlist = this.adi.getEntities("adminName=? and password=?", adminName, password);
		if(adminlist.size()>0)
			return adminlist.get(0);
		return null;
	}
	
}
