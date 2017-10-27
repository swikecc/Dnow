package com.dnow.javabean;

import java.util.Random;

public class RandomBean {
	private int randint;

	public int getRandint() {
		return randint;
	}

	public RandomBean() {
		Random rd = new Random();
		this.randint = rd.nextInt(3)+1;
	}

}
