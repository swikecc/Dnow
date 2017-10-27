package com.dnow.action.product;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dnow.biz.impl.BrandBizImpl;
import com.dnow.biz.impl.CategoryBizImpl;
import com.dnow.biz.impl.CommentBizImpl;
import com.dnow.biz.impl.ProductBizImpl;
import com.dnow.entity.Brand;
import com.dnow.entity.Category;
import com.dnow.entity.Product;
import com.dnow.vo.ProductPageBean;
import com.dnow.vo.StarScore;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class ProductAction extends ActionSupport implements SessionAware,
	Preparable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductBizImpl pbi;
	private CategoryBizImpl cbi;
	private CommentBizImpl combi;
	private BrandBizImpl bbi;
	private Map<String,Object> session;
	private String nextpage;
	private int page;
	private int cid;
	private int bid;
	private float minprice;
	private float maxprice;
	private int pagesize;
	private int product_id;
	private String keyword;
	
	//管理员属性
	private Product product;
	
	//ajax 属性
	private List<Product> plist;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getPlist() {
		return plist;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public float getMinprice() {
		return minprice;
	}

	public void setMinprice(float minprice) {
		this.minprice = minprice;
	}

	public float getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(float maxprice) {
		this.maxprice = maxprice;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getNextpage() {
		return nextpage;
	}

	@Override
	public void prepare() throws Exception {
		this.pbi = new ProductBizImpl();
		this.cbi = new CategoryBizImpl();
		this.combi = new CommentBizImpl();
		this.bbi = new BrandBizImpl();
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	
	//主页品牌列表
	public String brandlist() {
		//this.cbi = new CategoryBizImpl();
		Category category = this.cbi.getCategoryById(cid);
		if(category.getSupercategory().getCid()==0)
			System.out.println("没有父类");
		List<Brand> blist = this.pbi.findBrandListByCategory(category, 0, 10);
		for(Brand brand:blist) {
			System.out.println(brand.getBrand());
		}
		if(blist!=null) {
			this.session.put("brandlist", blist);
		}
		nextpage = "/home_pro/brand.jsp";
		return SUCCESS;
	}
	
	//最新商品列表
	public String newlist() {
		List<Product> newlist = this.pbi.findNewProduct(0, 4);
		if(newlist!=null) {
			this.session.put("newlist", newlist);
		}
		nextpage = "/home_pro/newlist.jsp";
		return SUCCESS;
	}
	
	//商品页面查看列表
	public String showpage() {
		if(page<1)
			page=1;
		Category category = this.cbi.getCategoryById(cid);
		int lowcid,highcid;
		if(category.getSupercategory().getCid()==0) {
			Iterator<Category> iter = category.getSubcategories().iterator();
			highcid = lowcid = iter.next().getCid();
			while(iter.hasNext())
				highcid = iter.next().getCid();
		}
		else {
			lowcid = highcid = cid;
		}
		ProductPageBean ppb = this.pbi.findPageProductByCC_B_P_(pagesize, page, lowcid, highcid, bid, minprice, maxprice);
		
		session.put("listcategory", category);
		session.put("currpagebean", ppb);
		if(bid<1&&session.containsKey("brand"))
			session.remove("brand");
		else if(bid>=1) {
			BrandBizImpl bdi = new BrandBizImpl();
			session.put("brand", bdi.findBrandById(bid));
		}
		nextpage = "/product-list.jsp";
		return SUCCESS;
	}
	
	//随便看看
	public String showrand() {
		if(this.session.containsKey("brand"))
			session.remove("brand");
		if(page<1)
			page=1;
		Category category = this.cbi.getCategoryById(cid);
		int lowcid,highcid;
		Iterator<Category> iter = category.getSubcategories().iterator();
		highcid = lowcid = iter.next().getCid();
		while(iter.hasNext())
			highcid = iter.next().getCid();
		ProductPageBean ppb = this.pbi.findPageProductByCC_B_P_(pagesize, page, lowcid, highcid, 0, 0.0f, 1E12f);
		
		session.put("listcategory", category);
		session.put("currpagebean", ppb);
//		if(bid<1&&session.containsKey("brand"))
//			session.remove("brand");
//		else if(bid>=1) {
//			BrandBizImpl bdi = new BrandBizImpl();
//			session.put("brand", bdi.findBrandById(bid));
//		}
		nextpage = "/product-list.jsp";
		return SUCCESS;
	}
	
	//商品详情
	public String showview() {
		StarScore sscore = this.combi.getAvgScoreByPid(product_id);
		Product currproduct = this.pbi.findProductById(product_id);
		if(sscore!=null)
			this.session.put("starscore", sscore);
		else if(session.containsKey("starscore"))
			session.remove("starscore");
		this.session.put("currproduct", currproduct);
		nextpage = "/product-view.jsp";
		return "success_pro";
	}
	
	//搜索
	public String search() {
		System.out.println(keyword);
		Product product = this.pbi.findProductByPname(keyword);
		if(product!=null) {
			this.session.put("currproduct", product);
		}
		nextpage = "/product-view.jsp";
		return "success_pro";
	}
//	public static void main(String[] args) {
//		ProductBizImpl pbi = new ProductBizImpl();
//		ProductPageBean ppb = pbi.findPageProductByCategoryId(12, 1, 4);
//		System.out.println(ppb.getList().get(0).getPname());
//	}

	//根据类型获取所有商品列表
//	private List<Product> findProductListByCid(int cid) {
//		ProductBizImpl pbi = new ProductBizImpl();
//		//List<Product> aplist = pbi.findProductListByCid(cid);
//		//return aplist;
//		return null;
//	}
	
	//ajax搜索
	public List<String> search_list(String keyword) {
		ProductBizImpl pbi = new ProductBizImpl();
		List<String> product = pbi.findAllProductByKeywords(keyword);
		return product;
	}
	
//	public List<Product> list(int cid, int bid, float low, float high) {
//		if(this.plist==null)
//			this.plist = this.findProductListByCid(cid);
//		List<Product> blist = new ArrayList<Product>();
//		for(Product product:this.getPlist()) {
//			float price = product.getPrice()*product.getDiscount();
//			if(bid!=0 && product.getBrand().getBid()==bid) {
//				if(price>=low&&price<=high)
//					blist.add(product);
//			}
//			else if(bid==0)
//				if(price>=low&&price<=high)
//					blist.add(product);
//		}
//		return blist;
//	}
//	public static void main(String[] args) {
//		ProductAction pa = new ProductAction();
//		List<Product> list = pa.list(4, 0, 3000, 8000);
//		for(Product product:list)
//			System.out.println(product.getPname());
//	}
	
	//管理员
	public String page() {
		if(page<1)
			page=1;
		ProductPageBean ppb = this.pbi.findPageProductByCategoryId(pagesize, page, cid);
		session.put("currpagebean", ppb);
		nextpage = "/product.jsp";
		return SUCCESS;
	}

	public String add() {
		if(!this.session.containsKey("curradmin"))
			return ERROR;
		
		Brand brand = this.bbi.findBrandById(bid);
		Category category = this.cbi.getCategoryById(cid);
		this.product.setBrand(brand);
		this.product.setCategory(category);
		this.product.setAddtime(new Date());
		boolean flag = this.pbi.saveProduct(this.product);
		if(!flag) {
			this.clearMessages();
			this.addActionMessage("<script>alert('添加商品失败！！！')</script>");
			nextpage = "/product-add.jsp";
			return SUCCESS;
		}
		if(session.containsKey("currpagebean"))
			session.remove("currpagebean");
		nextpage = "/result/addproduct-result.jsp";
		return SUCCESS;
	}
	
	public String delete() {
		if(!this.session.containsKey("curradmin"))
			return ERROR;
		boolean flag = this.pbi.deleteProductByPid(product_id);
		if(!flag)
			return ERROR;
		if(session.containsKey("currpagebean"))
			session.remove("currpagebean");
		nextpage = "/result/deleteproduct-result.jsp";
		return SUCCESS;
	}
	
	public String update() {
		if(!this.session.containsKey("curradmin"))
			return ERROR;
		if(!this.session.containsKey("updateproduct"))
			return ERROR;
		Product updateproduct = (Product) this.session.get("updateproduct");
		this.product.setPid(updateproduct.getPid());
		this.product.setAddtime(new Date());
		this.product.setBrand(this.bbi.findBrandById(bid));
		this.product.setCategory(this.cbi.getCategoryById(cid));
		this.product.setPicture(updateproduct.getPicture());
		boolean flag = this.pbi.updateProduct(this.product);
		if(!flag)
			return ERROR;
		if(session.containsKey("currpagebean"))
			session.remove("currpagebean");
		nextpage = "/result/updateproduct-result.jsp";
		return SUCCESS;
	}
	
	public String get() {
		if(!this.session.containsKey("curradmin"))
			return ERROR;
		this.product = this.pbi.findProductById(product_id);
		session.put("updateproduct", this.product);
		this.cid = this.product.getCategory().getCid();
		this.bid = this.product.getBrand().getBid();
//		Map<Category, String> categorymap = this.cbi.getCategoryMap();
//		Map<Brand, String> brandmap = this.bbi.getBrandMap();
//		session.put("categorymap", categorymap);
//		session.put("brandmap", brandmap);
		nextpage = "/product-update.jsp";
		return SUCCESS;
	}
	
}
