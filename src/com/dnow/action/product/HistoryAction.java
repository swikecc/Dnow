package com.dnow.action.product;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dnow.biz.impl.OrderItemBizImpl;
import com.dnow.vo.HotProduct;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class HistoryAction extends ActionSupport implements Preparable,
		SessionAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private OrderItemBizImpl oitembi;
	private String nextpage;
	private int low;
	private int high;
	
	public String hotstuff() {
		List<HotProduct> hotlist = this.oitembi.findHotProduct(low, high);
		if(hotlist!=null) {
			this.session.put("hotlist", hotlist);
		}
		this.nextpage = "/home_pro/hotstuff.jsp";
		return SUCCESS;
	}
	
	public int getLow() {
		return low;
	}

	public void setLow(int low) {
		this.low = low;
	}

	public int getHigh() {
		return high;
	}

	public void setHigh(int high) {
		this.high = high;
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
		this.oitembi = new OrderItemBizImpl();
	}

}
