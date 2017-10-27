package com.dnow.biz;

import com.dnow.entity.Admin;

public interface AdminBiz {
	public Admin loginByNamePwd(String adminName, String password);
}
