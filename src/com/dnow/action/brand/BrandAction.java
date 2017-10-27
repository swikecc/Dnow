package com.dnow.action.brand;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.dnow.biz.impl.BrandBizImpl;
import com.dnow.entity.Brand;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class BrandAction extends ActionSupport implements Preparable,
		RequestAware {
	
	private Map<String, Object> request;
	private BrandBizImpl bbi;
	private String nextpage;
	

	public String getNextpage() {
		return nextpage;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	@Override
	public void prepare() throws Exception {
		this.bbi = new BrandBizImpl();
	}

	public String list() {
		List<Brand> blist = this.bbi.findBrandList();
		if(blist!=null) {
			this.request.put("brandlist", blist);
			nextpage = "/product/brand.jsp";
		}
		return SUCCESS;
	}
}
