package com.dnow.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
	void saveEntity(T t);
	void updateEntity(T t);
	void deleteEntity(T t);
	void deleteEntity(Serializable id);
	T getEntity(Class<T> classname, Serializable id);
	T getEntity(Serializable id);
	List<T> getEntities();
	List<T> getEntities(String where, Object...params);
	List<T> getEntities(int first, int size);
	List<T> getEntities(int first, int size, String where, Object...params);
}
