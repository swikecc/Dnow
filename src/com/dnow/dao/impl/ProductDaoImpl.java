package com.dnow.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import com.dnow.dao.ProductDao;
import com.dnow.entity.Brand;
import com.dnow.entity.Category;
import com.dnow.entity.Product;

public class ProductDaoImpl extends BaseDaoImpl<Product> implements ProductDao {

	@Override
	public int getProductStorageByPid(int pid) {
		String hql = "select storage from Product where pid=?";
		Query query = this.session.createQuery(hql);
		query.setInteger(0, pid);
		int storage = Integer.parseInt(query.uniqueResult().toString());
		return storage;
	}
	
	@Override
	public List<String> findAllProductByKeyword(String keyword) {
		Query query = this.session.createQuery("select pname from Product where has_deleted=0 and pname like ?");
		query.setParameter(0, "%"+keyword+"%");
		List<String> pnames = query.list();
		return pnames;
	}
	
	@Override
	public int findProductCountByCategoryId(int categoryid) {
		String hql = "select count(*) from Product where has_deleted=0 and category_id=?";
		Query query = this.session.createQuery(hql);
		query.setInteger(0, categoryid);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	
	@Override
	public int findProductCountByC_B_P_(int categoryid, int bid, float low,
			float high) {
		String hql;
		if(bid==0)
			hql = "select count(*) from Product where has_deleted=0 and category_id=? and price*discount between ? and ?";
		else
			hql = "select count(*) from Product where has_deleted=0 and category_id=? and price*discount between ? and ? and bid=?";
		Query query = this.session.createQuery(hql);
		query.setParameter(0, categoryid);
		query.setParameter(1, low);
		query.setParameter(2, high);
		if(bid!=0)
			query.setParameter(3, bid);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public int findProductCountByCC_B_P_(int lowcid, int highcid, int bid, float low,
			float high) {
		String hql;
		if(bid==0)
			hql = "select count(*) from Product where has_deleted=0 and category_id between ? and ? and price*discount between ? and ?";
		else
			hql = "select count(*) from Product where has_deleted=0 and category_id between ? and ? and price*discount between ? and ? and bid=?";
		Query query = this.session.createQuery(hql);
		query.setParameter(0, lowcid);
		query.setParameter(1, highcid);
		query.setParameter(2, low);
		query.setParameter(3, high);
		if(bid!=0)
			query.setParameter(4, bid);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	
	@Override
	public List<Product> rankNewProduct(int first, int size) {
		String hql = "from Product p where has_deleted=0 order by p.addtime desc";
		Query query = this.session.createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(size);
		List<Product> list = query.list();
		return list;
	}


	@Override
	public List<Brand> rankBrandByCategory(Category category, int first, int size) {
		String hql_1 = "select p.brand,count(*) from Product p where has_deleted=0 and category_id=? group by p.brand order by count(*) desc";
		String hql_2 = "select p.brand,count(*) from Product p where has_deleted=0 and p.category.supercategory.cid=? group by p.brand order by count(*) desc";
		Query query = null;
		if(category.getSupercategory().getCid()!=0)
			query = this.session.createQuery(hql_1);
		else
			query = this.session.createQuery(hql_2);
		query.setParameter(0, category.getCid());
		query.setFirstResult(first);
		query.setMaxResults(size);
		List<Object[]> list = query.list();
		List<Brand> blist = new ArrayList<Brand>();
		for(Object[] obj:list) {
			Brand brand = (Brand) obj[0];
			blist.add(brand);
		}
		return blist;
	}
	
//	public static void main(String[] args) {
//		ProductDaoImpl pdi = new ProductDaoImpl();
//		System.out.println(pdi.findProductCountByCategoryId(4));
//		List<Product> list = pdi.rankNewProduct();
//		for(Product product:list) {
//			System.out.println();
//		}
//		Category supercategory = new Category();
//		supercategory.setCid(1);
//		supercategory.setCname("adskl");
//		Category category = new Category();
//		category.setCid(4);
//		category.setSupercategory(supercategory);
//		List<Brand> blist = pdi.rankBrandByCategory(category);
//		System.out.println(category.getCid());
//		for(Brand brand:blist) {
//			System.out.println(brand.getBrand());
//		}
//	}


}
