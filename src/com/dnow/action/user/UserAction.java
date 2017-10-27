package com.dnow.action.user;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dnow.biz.impl.AddressBizImpl;
import com.dnow.biz.impl.UserBizImpl;
import com.dnow.entity.Address;
import com.dnow.entity.User;
import com.opensymphony.xwork2.ActionSupport;
//import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class UserAction extends ActionSupport implements Preparable,
		SessionAware/*,ModelDriven<User>*/ {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private String nextpage;
	private UserBizImpl ubi;
	private AddressBizImpl abi;
	private Map<String, Object> session;
	private String veryCode;
	private String repassword;
	private String newpassword;
	private String addname;
	private int addressid;
	
	
	public int getAddressid() {
		return addressid;
	}

	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}

	public String getAddname() {
		return addname;
	}

	public void setAddname(String addname) {
		this.addname = addname;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getVeryCode() {
		return veryCode;
	}

	public void setVeryCode(String veryCode) {
		this.veryCode = veryCode;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getNextpage() {
		return nextpage;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	
	@Override
	public void prepare() throws Exception {
		this.ubi = new UserBizImpl();
		this.abi = new AddressBizImpl();
	}
//	
//	@Override
//	public User getModel() {
//		return this.user;
//	}

	public String register() {
		if(!this.veryCode.equalsIgnoreCase((String)this.session.get("valcode"))) {
			//System.out.println("验证码错误！");
			this.clearMessages();
			this.addActionMessage("<script>alert('验证码错误！！！');</script>");
			nextpage = "/user/register.jsp";
			return SUCCESS;
		}
		if(ubi.ifUserExist(user.getUsername())) {
			//System.out.println("用户名不可用！");
			this.clearMessages();
			this.addActionMessage("<script>alert('用户名不可用！！！');</script>");
			nextpage = "/user/register.jsp";
			return SUCCESS;
		}
		if(!this.user.getPassword().equals(repassword)) {
			//System.out.println("两次密码不一致！");
			this.clearMessages();
			this.addActionMessage("<script>alert('两次密码不一致！！！');</script>");
			nextpage = "/user/register.jsp";
			return SUCCESS;
		}
		boolean flag = ubi.register(user);
		if(flag) {
			User curruser = ubi.loginByNamePwd(user.getUsername(), user.getPassword());
			session.put("curruser", curruser);
			nextpage = "/user/reg-result.jsp";
			return SUCCESS;
		}
		else {
			//System.out.println("注册失败！");
			this.clearMessages();
			this.addActionMessage("<script>alert('注册失败！！！');</script>");
			nextpage = "/user/register.jsp";
			return SUCCESS;
		}
	}
	
	public String login() {
		if(!this.veryCode.equalsIgnoreCase((String)this.session.get("valcode"))){
			//System.out.println("验证码错误！");
			this.clearMessages();
			this.addActionMessage("<script>alert('验证码错误！！！');</script>");
			nextpage = "/user/login.jsp";
			return SUCCESS;
		}
		User curruser = ubi.loginByNamePwd(user.getUsername(), user.getPassword());
		
		if(curruser!=null) {
			session.put("curruser", curruser);
			nextpage = "/index.jsp";
			return "success_reg";
		}
		else {
			//System.out.println("用户名密码错误！！！");
			this.clearMessages();
			this.addActionMessage("<script>alert('用户名或密码错误！！！');</script>");
			nextpage = "/user/login.jsp";
		}
		return SUCCESS;
	}
	
	public String logout() {
		if(session.containsKey("curruser")) {
			session.remove("curruser");
		}
		this.nextpage = "/index.jsp";
		return "success_reg";
	}
	
	public String prefect() {
		if(session.containsKey("curruser"))
			this.user = (User) session.get("curruser");
		else {
			this.clearMessages();
			this.addActionMessage("<script>alert('对不起，您还没有登录！！！');</script>");
			nextpage = "/user/login.jsp";
			return "success_reg";
		}
		nextpage = "/user/user.jsp";
		return SUCCESS;
	}
	
	public String update() {
		if(!session.containsKey("curruser")) {
			this.clearMessages();
			this.addActionMessage("<script>alert('对不起，您还没有登录！！！');</script>");
			nextpage = "/user/login.jsp";
			return "success_reg";
		}
		User curruser = (User) this.session.get("curruser");
		this.user.setUid(curruser.getUid());
		User updateuser = this.ubi.updateUser(user);
		if(updateuser!=null) {
			this.session.put("curruser", updateuser);
			nextpage = "/user/index.jsp";
			//session.put("curruse, value)
		}
		else
			nextpage = "/user/user.jsp";
		return SUCCESS;
	}
	
	public String newpassword() {
		if(!session.containsKey("curruser")) {
			this.clearMessages();
			this.addActionMessage("<script>alert('对不起，您还没有登录！！！');</script>");
			nextpage = "/user/login.jsp";
			return "success_reg";
		}
		if(!this.veryCode.equalsIgnoreCase((String)this.session.get("valcode"))){
			//System.out.println("验证码错误！");
			this.clearMessages();
			this.addActionMessage("<script>alert('验证码错误！！！');</script>");
			nextpage = "/user/repassword.jsp";
			return SUCCESS;
		}
		User checkuser = this.ubi.loginByNamePwd(user.getUsername(), user.getPassword());
		User curruser = (User) this.session.get("curruser");
		if(checkuser==null||checkuser.getUid()!=curruser.getUid()) {
			this.clearMessages();
			this.addActionMessage("<script>alert('用户名或密码错误！！！');</script>");
			nextpage = "/user/repassword.jsp";
			return SUCCESS;
		}
		curruser.setPassword(newpassword);
		curruser = this.ubi.changeUserPassword(curruser);
		session.put("curruser", curruser);
		nextpage = "/user/repassword-result.jsp";
		return SUCCESS;
	}
	
/*	public String addressshow() {
		if(!this.session.containsKey("curruser")) {
			nextpage = "/user/login.jsp";
			return SUCCESS;
		}
		User curruser = (User) this.session.get("curruser");
		List<Address> alist = this.abi.findAddressByUid(curruser.getUid());
		this.session.put("addresslist", alist);
		nextpage = "/user/user-address.jsp";
		return SUCCESS;
	}
*/
	public String addressadd() {
		if(!this.session.containsKey("curruser")) {
			this.clearMessages();
			this.addActionMessage("<script>alert('对不起，您还没有登录！！！');</script>");
			nextpage = "/user/login.jsp";
			return "success_reg";
		}
		User curruser = (User) session.get("curruser");
		Address newadd = new Address(curruser, addname);
		boolean flag = this.abi.addAddress(newadd);
		if(!flag)
			return ERROR;
		session.put("curruser", this.ubi.getUserByUid(curruser.getUid()));
		nextpage = "/user/user-address.jsp";
		return "success_reg";
	}
	
	public String addressupdate() {
		if(!this.session.containsKey("curruser")) {
			this.clearMessages();
			this.addActionMessage("<script>alert('对不起，您还没有登录！！！');</script>");
			nextpage = "/user/login.jsp";
			return "success_reg";
		}
		User curruser = (User) this.session.get("curruser");
		Address updateadd = new Address(curruser, addname);
		boolean flag = this.abi.updateAddress(updateadd);
		if(!flag)
			return ERROR;
		session.put("curruser", this.ubi.getUserByUid(curruser.getUid()));
		nextpage = "/user/user-address.jsp";
		return "success_reg";
	}
	
	public String addressdelete() {
		if(!this.session.containsKey("curruser")) {
			this.clearMessages();
			this.addActionMessage("<script>alert('对不起，您还没有登录！！！');</script>");
			nextpage = "/user/login.jsp";
			return "success_reg";
		}
		User curruser = (User) this.session.get("curruser");
		boolean flag = this.abi.deleteAddressByAid(addressid);
		if(!flag)
			return ERROR;
		session.put("curruser", this.ubi.getUserByUid(curruser.getUid()));
		nextpage = "/user/user-address.jsp";
		return "success_reg";
	}
	
	//ajax
	public String ajax_check(String username) {
		UserBizImpl ajax_ubi = new UserBizImpl();
		if(ajax_ubi.ifUserExist(username)) {
			return "impass";
		}
		else
			return "pass";
	}
	
}
