package com.dnow.action.order;

import java.awt.event.ItemEvent;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.apache.struts2.interceptor.SessionAware;

import com.dnow.biz.impl.OrderformBizImpl;
import com.dnow.biz.impl.ProductBizImpl;
import com.dnow.entity.OrderForm;
import com.dnow.entity.OrderItem;
import com.dnow.entity.User;
import com.dnow.vo.Cart;
import com.dnow.vo.CartItem;
import com.dnow.vo.CheckItem;
import com.dnow.vo.OrderPageBean;
import com.dnow.vo.OrderidPageBean;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class OrderAction extends ActionSupport implements SessionAware,
		Preparable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private OrderformBizImpl obi;
	private ProductBizImpl pbi;
	private Map<String, Object> session;
	private int lowstate;
	private int upstate;
	private String address;
	private int page;
	private int pagesize;
	private String name;
	private String phone;
	private String orderid;
	private String nextpage;
	private List<String> checkbox;
	
	public String select() {
		if(!session.containsKey("curruser")) {
			nextpage = "/user/login.jsp";
			return "nouser";
		}
		if(page<1)
			page = 1;
		User user = (User) this.session.get("curruser");
		OrderidPageBean opb = this.obi.getPageOrderidByUidState(pagesize, page, user.getUid(), lowstate, upstate);
		if(opb!=null) {
			List<OrderForm> orderlist = new ArrayList<OrderForm>();
			for(String orderid:opb.getList()) {
				OrderForm itemlist = this.obi.getOrderByOid(orderid);
				orderlist.add(itemlist);
			}
			this.session.put("orderlist", orderlist);
			this.session.put("orderpage", opb);
		}
		else if (this.session.containsKey("orderlist"))
			this.session.remove("orderlist");
		nextpage = "/user/order-list.jsp";
		return SUCCESS;
	}
	
	public String view() {
		if(!this.session.containsKey("curruser")) {
			nextpage = "/user/login.jsp";
			return "nouser";
		}
		OrderForm order = this.obi.getOrderByOid(orderid);
		if(order!=null) {
			this.session.put("currorder", order);
			nextpage = "/user/order-view.jsp";
			return SUCCESS;
		}
		else
			return ERROR;
	}
	
	public String check() {
		String base = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		Random rd = new Random();
		long time = System.currentTimeMillis();
		String orderid = "";
		for(int i=1; i<=10; i++){
			orderid += base.charAt(rd.nextInt(base.length()));
		}
		orderid += (time%1000000l);
		CheckItem check = new CheckItem();
		check.setAddress(address);
		check.setOrderid(orderid);
		check.setPhone(phone);
		check.setName(name);
		session.put("checkitem", check);
		nextpage = "/user/checkorder.jsp";
		return SUCCESS;
	}
	
	public String add() {
		if(!this.session.containsKey("curruser")) {
			nextpage = "/user/login.jsp";
			return "nouser";
		}
		if(!this.session.containsKey("cart")||!this.session.containsKey("checkitem"))
			return ERROR;
		CheckItem check = (CheckItem) this.session.get("checkitem");
		Cart cart = (Cart) this.session.get("cart");
		User user = (User) this.session.get("curruser");
		for(CartItem item:cart.getItems()) {
			if(!this.pbi.minusStorageByCartItem(item))
				return ERROR;
		}
		OrderForm order = new OrderForm();
		order.setOrderid(check.getOrderid());
		order.setUser(user);
		order.setState(1);
		order.setTime(new Date());
		order.setAddress(check.getAddress());
		order.setPhone(check.getPhone());
		order.setName(check.getName());
		order.setCount(cart.getCount());
		order.setTotal(cart.getTotalprice());
		Set<OrderItem> itemlist = order.getOrderItems();
		for(CartItem item:cart.getItems()) {
			OrderItem orderitem = new OrderItem();
			orderitem.setProduct(item.getProduct());
			orderitem.setCount(item.getCount());
			itemlist.add(orderitem);
		}
		boolean flag = this.obi.addOrder(order);
		if(!flag)
			return ERROR;
		session.remove("cart");
		session.put("currorder", order);
		nextpage = "/user/order-result.jsp";
		return SUCCESS;
	}
	
	public String delete() {
		if(!session.containsKey("curruser")) {
			nextpage = "/user/login.jsp";
			return "nouser";
		}
		Boolean flag = this.obi.deleteOrderByOid(orderid);
		if(!flag)
			return ERROR;
		
		nextpage = "/user/index.jsp";
		return SUCCESS;
	}
	
	public String cancel() {
		if(!this.session.containsKey("curruser")) {
			nextpage = "/user/login.jsp";
			return "nouser";
		}
		if(!this.session.containsKey("cart")||!this.session.containsKey("checkitem"))
			return ERROR;
		session.remove("cart");
		session.remove("checkitem");
		nextpage = "/user/order-result.jsp";
		return SUCCESS;
	}
	
	public String checkget() {
		if(!this.session.containsKey("curruser")) {
			nextpage = "/user/login.jsp";
			return "nouser";
		}
		boolean flag = this.obi.changeOrderStateByOid(orderid, 3);
		if(!flag)
			return ERROR;
		OrderForm order = this.obi.getOrderByOid(orderid);
		if(order!=null) {
			this.session.put("currorder", order);
		}
		nextpage = "/user/order-view.jsp";
		return SUCCESS;
	}

	public List<String> getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(List<String> checkbox) {
		this.checkbox = checkbox;
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

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getLowstate() {
		return lowstate;
	}

	public void setLowstate(int lowstate) {
		this.lowstate = lowstate;
	}

	public int getUpstate() {
		return upstate;
	}

	public void setUpstate(int upstate) {
		this.upstate = upstate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNextpage() {
		return nextpage;
	}

	@Override
	public void prepare() throws Exception {
		this.obi = new OrderformBizImpl();
		this.pbi = new ProductBizImpl();
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	
	//管理员
	public String history() {
		if(!session.containsKey("curradmin")) {
			nextpage = "/index.jsp";
			return SUCCESS;
		}
		if(page<1)
			page = 1;
		OrderPageBean opb = this.obi.getPageOrderByState(pagesize, page, lowstate, upstate);
		if(opb!=null) {
			this.session.put("adorderpage", opb);
		}
		if(upstate==1)
			nextpage = "/order-deliver.jsp";
		else if(upstate<=3)
			nextpage = "/order-get.jsp";
		else
			nextpage = "/order.jsp";
		return SUCCESS;
	}
	
	public String deliver() {
		if(this.checkbox!=null||this.checkbox.size()>0) {
			boolean flag;
			for(String orderid:checkbox) {
				flag = this.obi.changeOrderStateByOid(orderid, 2);
				if(!flag)
					return ERROR;
			}
		}
//		this.lowstate = 1;
//		this.upstate = 1;
		nextpage = "/result/deliver-result.jsp";
		return SUCCESS;	
	}
	
	public String get() {
		if(this.checkbox!=null||this.checkbox.size()>0) {
			boolean flag;
			for(String orderid:checkbox) {
				flag = this.obi.changeOrderStateByOid(orderid, 4);
				if(!flag)
					return ERROR;
			}
		}
//		this.lowstate = 1;
//		this.upstate = 1;
		nextpage = "/result/get-result.jsp";
		return SUCCESS;	
	}

}
