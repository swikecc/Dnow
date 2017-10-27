package com.dnow.dao;

import java.util.List;

import com.dnow.entity.Brand;
import com.dnow.entity.Category;
import com.dnow.entity.Product;


public interface ProductDao extends BaseDao<Product> {
	public int getProductStorageByPid(int pid);
	public List<String> findAllProductByKeyword(String keyword);
	public int findProductCountByCategoryId(int categoryid);
	public int findProductCountByC_B_P_(int categoryid, int bid, float low, float high);
	public int findProductCountByCC_B_P_(int lowcid, int highcid, int bid, float low, float high);
	public List<Product> rankNewProduct(int first, int size);
	public List<Brand> rankBrandByCategory(Category category, int first, int size);
}
