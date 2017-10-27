package com.dnow.biz;

import com.dnow.vo.StarScore;

public interface CommentBiz {
	public StarScore getAvgScoreByPid(int pid);
}
