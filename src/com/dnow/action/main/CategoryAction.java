package com.dnow.action.main;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.dnow.biz.impl.CategoryBizImpl;
import com.dnow.entity.Category;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class CategoryAction extends ActionSupport implements RequestAware,
		Preparable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CategoryBizImpl cbi;
	private String nextpage;
	private Map<String, Object> request;
//	private Map<String, Object> session;
	private int cid;
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getNextpage() {
		return nextpage;
	}

	@Override
	public void prepare() throws Exception {
		this.cbi = new CategoryBizImpl();
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	public Map<String, Object> getRequest() {
		return request;
	}

	public String all() {
		List<Category> category = this.cbi.getAllCategory();
		request.put("category", category);
		nextpage = "/main/category.jsp";
		return SUCCESS;
	}

//	//管理员分类
//	public String adminall() {
//		List<Category> category = this.cbi.getAllCategory();
//		request.put("category", category);
//		nextpage = "/manager/main/category.jsp";
//		return SUCCESS;
//	}

//	public String list() {
//		Category subcategory = cbi.getCategoryById(cid);
//		session.put("subcategory", subcategory);
//		nextpage = "/main/prolist.jsp";
//		return SUCCESS;
//	}

//	@Override
//	public void setSession(Map<String, Object> arg0) {
//		this.session = arg0;
//	}
//	public static void main(String[] args) {
//		CategoryBizImpl cbi = new CategoryBizImpl();
//		List<Category> categories = cbi.getAllCategory();
//		for(Category category:categories) {
//			System.out.println(category.getCname());
//			Iterator<Category> iter = category.getSubcategories().iterator();
//			while(iter.hasNext()) {
//				System.out.println("        ----" + iter.next().getCname());
//			}
//		}
//	}
}
