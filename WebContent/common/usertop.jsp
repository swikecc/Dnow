<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="top" >
	<div class="wrapper">
		<div class="top-left">
			&nbsp;<span><s:property value="#session.curruser.nickname"/>&nbsp;您好，欢迎来到D_Now！</span>&nbsp;|&nbsp;<span><a href="<%=request.getContextPath() %>/user/userlogout">安全退出</a></span>
		</div>
			
		<div class="top-right">
			<span><a href="<%=request.getContextPath() %>/index.jsp">D-now首页</a></span>&nbsp;
		</div>
	</div>
</div>
