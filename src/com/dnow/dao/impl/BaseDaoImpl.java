package com.dnow.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.dnow.dao.BaseDao;

public class BaseDaoImpl<T> implements BaseDao<T> {
	
	protected Configuration conf;
	protected ServiceRegistry reg;
	protected SessionFactory factory;
	protected Session session;
	protected Transaction tran;
	protected Class<T> cls;
	
	public BaseDaoImpl() {
		this.conf = new Configuration().configure();
		this.reg = new ServiceRegistryBuilder().applySettings(this.conf.getProperties()).buildServiceRegistry();
		this.factory = this.conf.buildSessionFactory(this.reg);
		this.session = this.factory.openSession();
		this.cls = (Class<T>)((ParameterizedType)this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	@Override
	public void saveEntity(T t) throws HibernateException {
		try {
			this.tran = this.session.beginTransaction();
			this.session.save(t);
			this.tran.commit();
		}catch(HibernateException e) {
			e.printStackTrace();
			this.tran.rollback();
			throw e;
		}
	}

	@Override
	public void updateEntity(T t) {
		try {
			this.tran = this.session.beginTransaction();
			this.session.update(t);
			this.tran.commit();
		}catch(HibernateException e) {
			e.printStackTrace();
			this.tran.rollback();
			throw e;
		}
	}

	@Override
	public void deleteEntity(T t) {
		try {
			this.tran = this.session.beginTransaction();
			this.session.delete(t);
			this.tran.commit();
		}catch(HibernateException e) {
			e.printStackTrace();
			this.tran.rollback();
			throw e;
		}
	}

	@Override
	public void deleteEntity(Serializable id) {
		T t = this.getEntity(id);
		this.deleteEntity(t);
	}

	@Override
	public T getEntity(Class<T> classname, Serializable id) {
		T t = (T) this.session.get(classname, id);
		return t;
	}

	@Override
	public T getEntity(Serializable id) {
		T t = (T) this.session.get(this.cls,id);
		return t;
	}

	@Override
	public List<T> getEntities() {
		Query query = this.session.createQuery("from " + this.cls.getSimpleName());
		List<T> tlist = (List<T>)query.list();
		return tlist;
	}

	@Override
	public List<T> getEntities(String where, Object... params) {
		Query query = this.session.createQuery("from " + this.cls.getSimpleName()+ " where " + where);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		List<T> tlist = (List<T>)query.list();
		return tlist;
	}

	@Override
	public List<T> getEntities(int first, int size) {
		Query query = this.session.createQuery("from " + this.cls.getSimpleName());
		query.setFirstResult(first);
		query.setMaxResults(size);
		List<T> tlist = (List<T>)query.list();
		return tlist;
	}

	@Override
	public List<T> getEntities(int first, int size, String where,
			Object... params) {
		Query query = this.session.createQuery("from " + this.cls.getSimpleName() + " where " + where);
		query.setFirstResult(first);
		query.setMaxResults(size);
		for(int i=0; i<params.length; i++)
			query.setParameter(i, params[i]);
		List<T> tlist = (List<T>)query.list();
		return tlist;
	}

}
