package com.dnow.dao;

import com.dnow.entity.Comment;

public interface CommentDao extends BaseDao<Comment> {
	public int totalScoreByPid(int pid);
	public int countBypid(int pid);
}
