package com.dnow.action.admin;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dnow.biz.impl.AdminBizImpl;
import com.dnow.biz.impl.ProductBizImpl;
import com.dnow.entity.Admin;
import com.dnow.vo.ProductPageBean;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class AdminAction extends ActionSupport implements Preparable,
		SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminBizImpl abi;
	private ProductBizImpl pbi;
	private Map<String, Object> session;
	private String nextpage;
	private String veryCode;
	private Admin admin;
	private int page;
	private int pagesize;
	private int cid;

	public String login() {
		if(!this.veryCode.equalsIgnoreCase((String)this.session.get("valcode"))){
			//System.out.println("验证码错误！");
			this.clearMessages();
			this.addActionMessage("<script>alert('验证码错误！！！');</script>");
			nextpage = "/manager/index.jsp";
			return SUCCESS;
		}
		Admin curradmin = abi.loginByNamePwd(admin.getAdminname(), admin.getPassword());
		
		if(curradmin!=null) {
			session.put("curradmin", curradmin);
			nextpage = "/manager/product.jsp";
			return "success_reg";
		}
		else {
			//System.out.println("用户名密码错误！！！");
			this.clearMessages();
			this.addActionMessage("<script>alert('用户名或密码错误！！！');</script>");
			nextpage = "/manager/index.jsp";
		}
		return SUCCESS;
	}
	
	public String logout() {
		if(session.containsKey("curradmin")) {
			session.remove("curradmin");
		}
		this.nextpage = "/manager/index.jsp";
		return "success_reg";
	}
	
	//管理员
	public String adminshowpage() {
		if(page<1)
			page=1;
		ProductPageBean ppb = this.pbi.findPageProductByCategoryId(pagesize, page, cid);
		session.put("currpagebean", ppb);
		nextpage = "/manager/product.jsp";
		return "admin_success";
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public void setVeryCode(String veryCode) {
		this.veryCode = veryCode;
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
		this.abi = new AdminBizImpl();
		this.pbi = new ProductBizImpl();
	}

}
