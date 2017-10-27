package com.dnow.dao.impl;

import org.hibernate.Query;

import com.dnow.dao.CommentDao;
import com.dnow.entity.Comment;

public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao {

	@Override
	public int totalScoreByPid(int pid) {
		String hql = "select sum(score) from Comment where pid=?";
		Query query = this.session.createQuery(hql);
		query.setInteger(0, pid);
		int totalscore = Integer.parseInt(query.uniqueResult().toString());
		return totalscore;
	}

	@Override
	public int countBypid(int pid) {
		String hql = "select count(*) from Comment c where pid=?";
		Query query = this.session.createQuery(hql);
		query.setInteger(0, pid);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
//	public static void main(String[] args) {
//		CommentDaoImpl cdi = new CommentDaoImpl();
//		int avg = cdi.totalScoreByPid(1)/cdi.countBypid(1);
//		System.out.println(avg);
//	}
}
