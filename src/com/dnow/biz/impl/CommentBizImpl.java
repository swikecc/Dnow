package com.dnow.biz.impl;

import com.dnow.biz.CommentBiz;
import com.dnow.dao.impl.CommentDaoImpl;
import com.dnow.vo.StarScore;

public class CommentBizImpl implements CommentBiz {
	private CommentDaoImpl cdi = new CommentDaoImpl();
	
	@Override
	public StarScore getAvgScoreByPid(int pid) {
		int count = this.cdi.countBypid(pid);
		if(count<1)
			return null;
		else {
			StarScore sscore = new StarScore();
			int total = this.cdi.totalScoreByPid(pid);
			int avg = 100*total/count;
			sscore.setCount(count);
			sscore.setInteger(avg/100);
			sscore.setDecimal(avg%100);
			sscore.setScore(((float)avg)/1000);
			return sscore;
		}
	}
//	public static void main(String[] args) {
//		CommentBizImpl cbi = new CommentBizImpl();
//		System.out.println(cbi.getAvgScoreByPid(1));
//	}
}
