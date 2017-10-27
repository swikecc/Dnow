package com.dnow.biz.impl;

//import java.text.ParseException;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Formatter;
import java.util.List;

import com.dnow.biz.ProductBiz;
import com.dnow.dao.impl.ProductDaoImpl;
import com.dnow.entity.Brand;
import com.dnow.entity.Category;
import com.dnow.entity.Product;
import com.dnow.vo.CartItem;
import com.dnow.vo.ProductPageBean;

public class ProductBizImpl implements ProductBiz {
	ProductDaoImpl pdi = new ProductDaoImpl();
	@Override
	public List<String> findAllProductByKeywords(String keyword) {
		
		return pdi.findAllProductByKeyword(keyword);
	}
//	public static void main(String[] args) {
//		ProductBizImpl pbi=new ProductBizImpl();
//		List<String> pnames = pbi.findAllProductByKeywords("thi");
//		for(int i=0; i<pnames.size(); i++)
//			System.out.println(">>>"+ pnames.get(i));
//	}
	@Override
	public boolean minusStorageByCartItem(CartItem item) {
		int pid = item.getProduct().getPid();
		Product product = this.pdi.getEntity(pid);
		product.setStorage(product.getStorage()-item.getCount());
		try {
			this.pdi.updateEntity(product);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public int findProductStorageByPid(int pid) {
		int storage = this.pdi.getProductStorageByPid(pid);
		return storage;
	}
	@Override
	public ProductPageBean findPageProductByCategoryId(int pagesize, int currpage,int categoryid) {
		int rowcount = this.pdi.findProductCountByCategoryId(categoryid);
		int pagecount = rowcount%pagesize==0?rowcount/pagesize:rowcount/pagesize+1;
		List<Product> list = this.pdi.getEntities((currpage-1)*pagesize, pagesize, "category_id=?", categoryid);
//		List<Integer> listint = new ArrayList<Integer>();
//		for(int i = 1; i<=pagecount; i++)
//			listint.add(i);
		ProductPageBean ppb = new ProductPageBean();
		ppb.setPagesize(pagesize);
		ppb.setCurrpage(currpage);
		ppb.setRowcount(rowcount);
		ppb.setPagecount(pagecount);
		ppb.setList(list);
//		ppb.setListint(listint);
		return ppb;
	}
//	public static void main(String[] args) {
//		ProductDaoImpl pdi = new ProductDaoImpl();
//		int count = pdi.findProductCountByCategoryId(16);
//		List<Product> list = pdi.getEntities(0, 12, "category_id=?", 16);
//		System.out.println(count);
//		System.out.println(list.get(0).getPname());
//	}
	@Override
	public Product findProductById(int id) {
		Product product = this.pdi.getEntity(id);
		return product;
	}
	
	@Override
	public Product findProductByPname(String pname) {
		List<Product> plist = this.pdi.getEntities("pname=?", pname);
		if(plist.size()>0)
			return plist.get(0);
		return null;
	}
	
	@Override
	public List<Product> findNewProduct(int low, int high) {
		List<Product> newlist = this.pdi.rankNewProduct(low, high-low);
		if(newlist.size()>0) {
			return newlist;
		}
		return null;
	}
	
	@Override
	public List<Brand> findBrandListByCategory(Category category, int low, int high) {
		List<Brand> list = this.pdi.rankBrandByCategory(category, low, high-low);
		List<Brand> blist = new ArrayList<Brand>();
		if(list.size()>0) {
			int i = 0;
			for(Brand brand:list) {
				blist.add(brand);
				i++;
				if(i>=10)
					break;
			}
			return blist;
		}
		return null;
	}
//	
//	@Override
//	public List<Product> findProductListByCid(int cid) {
//		List<Product> plist = this.pdi.getEntities("category_id=?", cid);
//		return plist;
//	}
//	public static void main(String[] args) {
//		ProductBizImpl pbi = new ProductBizImpl();
//		CategoryBizImpl cbi = new CategoryBizImpl();
//		Category category = cbi.getCategoryById(2);
//		List<Brand> plist = pbi.findBrandListByCategory(category);
//		for(Brand product: plist) {
//			System.out.println(product.getBrand());
//		}
//	}
	@Override
	public ProductPageBean findPageProductByCC_B_P_(int pagesize, int currpage,
			int lowcid, int highcid, int bid, float low, float high) {
		int rowcount;
		if(lowcid==highcid)
			rowcount = this.pdi.findProductCountByC_B_P_(lowcid, bid, low, high);
		else
			rowcount = this.pdi.findProductCountByCC_B_P_(lowcid, highcid, bid, low, high);
		int pagecount = rowcount%pagesize==0?rowcount/pagesize:rowcount/pagesize+1;
		String where;
		List<Product> list = new ArrayList<Product>();
		if(bid!=0) {
			where = "has_deleted=0 and category_id between ? and ? and bid=? and price*discount between ? and ?";
			list = this.pdi.getEntities((currpage-1)*pagesize, pagesize, where, lowcid, highcid, bid, low, high);
		}
		else {
			where = "has_deleted=0 and category_id between ? and ? and price*discount between ? and ?";
			list = this.pdi.getEntities((currpage-1)*pagesize, pagesize, where, lowcid, highcid, low, high);
		}
//		List<Integer> listint = new ArrayList<Integer>();
//		for(int i = 1; i<=pagecount; i++)
//			listint.add(i);
		ProductPageBean ppb = new ProductPageBean();
		ppb.setPagesize(pagesize);
		ppb.setCurrpage(currpage);
		ppb.setRowcount(rowcount);
		ppb.setPagecount(pagecount);
		ppb.setList(list);
//		ppb.setListint(listint);
		return ppb;
	}
	
	@Override
	public boolean saveProduct(Product product) {
		try {
			this.pdi.saveEntity(product);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean deleteProductByPid(int pid) {
		try {
			Product product = this.pdi.getEntity(pid);
			product.setHasDeleted(1);
			this.pdi.updateEntity(product);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean updateProduct(Product product) {
		try {
			Product newproduct = this.pdi.getEntity(product.getPid());
			newproduct.setAddtime(product.getAddtime());
			newproduct.setBrand(product.getBrand());
			newproduct.setCategory(product.getCategory());
			newproduct.setDescription(product.getDescription());
			newproduct.setDiscount(product.getDiscount());
			newproduct.setHasDeleted(product.getHasDeleted());
			newproduct.setPicture(product.getPicture());
			newproduct.setPname(product.getPname());
			newproduct.setPrice(product.getPrice());
			newproduct.setStorage(product.getStorage());
			this.pdi.updateEntity(newproduct);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
