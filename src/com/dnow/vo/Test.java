package com.dnow.vo;

import java.util.Random;

public class Test {
	public static void main(String[] args) {
		String base = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		Random rd = new Random();
		long time = System.currentTimeMillis();
		System.out.println(time);
		String orderid = "";
		for(int i=1; i<=10; i++){
			orderid += base.charAt(rd.nextInt(base.length()));
		}
		orderid += (time%1000000l);
		System.out.println(orderid);
	}
}
