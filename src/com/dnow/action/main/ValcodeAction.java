package com.dnow.action.main;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ValcodeAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ByteArrayInputStream inputstream;
	
	
	public ByteArrayInputStream getInputstream() {
		return inputstream;
	}


	public void setInputstream(ByteArrayInputStream inputstream) {
		this.inputstream = inputstream;
	}


	@Override
	public String execute() throws Exception {
		// 产生验证码
		String base = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		Random rd = new Random();
		String valcode = "";
		for(int i=1; i<=4; i++){
			valcode += base.charAt(rd.nextInt(base.length()));
		}
		// 把验证码放入session中
		ActionContext.getContext().getSession().put("valcode", valcode);
		
		// 绘制验证码
		int width = 80;
		int height = 22;
		BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = img.getGraphics();
		
		g.setColor(new Color(170+rd.nextInt(80),170+rd.nextInt(80),170+rd.nextInt(80)));
		g.fillRect(0, 0, width, height);
		
		// 绘制干扰（略）
		 for (int i=-2;i<78;i++)
		 {
			 for(int j=-2; j<22; j++) {
				 g.setColor(new Color(100+rd.nextInt(80), 100+rd.nextInt(80), 100+rd.nextInt(80)));
			     int x = rd.nextInt(4);
			     int y = rd.nextInt(4);
			     g.fillOval(i+x, j+y, rd.nextInt(4), rd.nextInt(4));
			 }
		 }
		 g.setColor(new Color(40+rd.nextInt(120), 40+rd.nextInt(120), 40+rd.nextInt(120)));
		 for(int i=0; i<3; i++) {
			 int x = 0;
			 int y = rd.nextInt(height/2);
			 if(rd.nextInt(2)==1)
				 g.drawLine(x, y, width, y+height/2);
			 else
				 g.drawLine(x, y+height/2, width, y);
		 }
		 
		
		// 绘制
		for(int i=0; i<valcode.length(); i++){
			g.setColor(new Color(rd.nextInt(120),rd.nextInt(120),rd.nextInt(120)));
			g.setFont(new Font("Times New Roman", Font.BOLD, 18));
			g.drawString(valcode.charAt(i)+"", (width/4)*i+2, 18);
		}
		g.dispose();
		
		// 转换为流
		ByteArrayOutputStream outputstream = new ByteArrayOutputStream();
		ImageOutputStream ios = ImageIO.createImageOutputStream(outputstream);
		ImageIO.write(img, "jpeg", ios);
		ios.close();
		this.setInputstream(new ByteArrayInputStream(outputstream.toByteArray()));
		
		return SUCCESS;
	}
}
