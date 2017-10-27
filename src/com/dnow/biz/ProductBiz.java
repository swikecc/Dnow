package com.dnow.biz;

import java.util.List;

import com.dnow.entity.Brand;
import com.dnow.entity.Category;
import com.dnow.entity.Product;
import com.dnow.vo.CartItem;
import com.dnow.vo.ProductPageBean;


public interface ProductBiz {
	public boolean minusStorageByCartItem(CartItem item);
	public int findProductStorageByPid(int pid);
	public List<String> findAllProductByKeywords(String keywords);
	public Product findProductById(int id);
	public Product findProductByPname(String pname);
	public List<Product> findNewProduct(int low, int high);
	public List<Brand> findBrandListByCategory(Category category, int low, int high);
	public ProductPageBean findPageProductByCC_B_P_(int pagesize,int currpage,int lowcid,int highcid,int bid,float low,float high);
	
	public boolean saveProduct(Product product);
	public boolean deleteProductByPid(int pid);
	public boolean updateProduct(Product product);
	public ProductPageBean findPageProductByCategoryId(int pagesize,int currpage,int categoryid);
}
