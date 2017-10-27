<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="top" >
	<div class="wrapper">
		<div class="top-left">
			<s:if test="#session.curruser==null">
			&nbsp;<span>您好，欢迎来到D_Now！</span><span>请<a href="<%=request.getContextPath() %>/user/login.jsp">登录</a></span>&nbsp;|&nbsp;<span><a href="<%=request.getContextPath() %>/user/register.jsp">注册</a></span>
			</s:if>
			<s:else>
			&nbsp;<span><s:property value="#session.curruser.nickname"/>&nbsp;您好，欢迎来到D_Now！</span>&nbsp;|&nbsp;<span><a href="<%=request.getContextPath() %>/user/userlogout">安全退出</a></span>
			</s:else>
		</div>
		
		<div class="top-right">
			<s:if test="#session.curruser==null">
				<span><a class="nologin">我的订单</a></span>&nbsp;|&nbsp;
				<span><a class="nologin">我的D_Now</a></span>
			</s:if>
			<s:else>
				<span><a href="<%=request.getContextPath() %>/user/orderselect?lowstate=1&upstate=4">我的订单</a></span>&nbsp;|&nbsp;
				<span><a href="<%=request.getContextPath() %>/user/index.jsp">我的D_Now</a></span>
			</s:else>
		</div>
	</div>
</div>