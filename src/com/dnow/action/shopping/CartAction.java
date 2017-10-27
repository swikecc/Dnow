package com.dnow.action.shopping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dnow.biz.impl.ProductBizImpl;
import com.dnow.biz.impl.UserBizImpl;
import com.dnow.entity.Product;
import com.dnow.entity.User;
import com.dnow.vo.Cart;
import com.dnow.vo.CartItem;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class CartAction extends ActionSupport implements Preparable,
		SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private ProductBizImpl pbi;
	private UserBizImpl ubi;
	private String nextpage;
	private int pid;
	private int uid;
	private int count;
	
	public String buy() {
		count = 1;
		Product product = this.pbi.findProductById(pid);
		Cart cart = null;
		CartItem curritem = new CartItem();
		curritem.setProduct(product);
		curritem.setCount(count);
		if(!session.containsKey("curruser")) {
			cart = new Cart();
			nextpage = "/user/login.jsp";
		}
		else if(session.containsKey("cart")) {
			User user = (User) this.session.get("curruser");
			cart = (Cart) session.get("cart");
			if(cart.getUser()==null)
				cart.setUser(user);
			else if(cart.getUser().getUid()!=user.getUid())
				cart = new Cart((User)this.session.get("curruser"));
			nextpage = "/shopping-list.jsp";
		}
		else {
			cart = new Cart((User)this.session.get("curruser"));
			nextpage = "/shopping-list.jsp";
		}
		cart.addItem(curritem);
		session.put("cart", cart);
		return "success_shop";
	}
	
	public String submit() {
		
		return SUCCESS;
	}
	
	public String show() {
		if(!session.containsKey("curruser")) {
			nextpage = "/user/login.jsp";
			return "nouser";
		}
		if(session.containsKey("cart")) {
			Cart cart = (Cart) this.session.get("cart");
			if(cart.getUser()==null) {
				User user = this.ubi.findUserById(uid);
				cart.setUser(user);
				this.session.put("cart", cart);
			}
			else if(cart.getUser().getUid()!=uid)
				this.session.remove("cart");
		}
		nextpage = "/shopping-list.jsp";
		return SUCCESS;
	}
	
	public String delete() {
		if(!session.containsKey("cart"))
			return ERROR;
		Cart cart = (Cart) session.get("cart");
		cart.deleteItemByPid(pid);
		if(cart.getItems().size()>0)
			session.put("cart", cart);
		else
			session.remove("cart");
		nextpage = "/shopping-list.jsp";
		return "success_shop";
	}
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
		this.pbi = new ProductBizImpl();
		this.ubi = new UserBizImpl();
	}
	
	//ajax
	public float changeCount(int pid, int count) {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Cart cart = null;
		if(!session.containsKey("cart"))
			return 0;
		cart = (Cart) session.get("cart");
		for(CartItem item:cart.getItems()) {
			if(item.getProduct().getPid()==pid) {
				CartItem additem = new CartItem();
				int more = count-item.getCount();
				additem.setProduct(item.getProduct());
				additem.setCount(more);
				cart.addItem(additem);
				session.put("cart", cart);
				break;
			}
		}
		return cart.getTotalprice();
	}
	
	public List<Integer> getnumber(int pid, int number, int id) {
		ProductBizImpl pbi = new ProductBizImpl();
		int storage = pbi.findProductStorageByPid(pid);
		List<Integer> list = new ArrayList<Integer>();
		list.add(id);
		list.add(pid);
		if(number<storage)
			list.add(number);
		list.add(storage);
		return list;
	}
	
	public int getstorage(int pid) {
		ProductBizImpl pbi = new ProductBizImpl();
		int storage = pbi.findProductStorageByPid(pid);
		return storage;
	}
	
//	public String prodelete(int pid) {
//		Map<String, Object> session = ActionContext.getContext().getSession();
//		if(!session.containsKey("cart"))
//			return "";
//		Cart cart = (Cart) session.get("cart");
//		cart.deleteItemByPid(pid);
//		if(cart.getItems().size()>0)
//			session.put("cart", cart);
//		else
//			session.remove("cart");
//		List<CartItem> items = cart.getItems();
//		try {
//			String jsonstr = JSONUtil.serialize(items);
//			return jsonstr;
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//		return "";
//	}

}
