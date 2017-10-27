<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="managertop" >
	<div class="wrapper">
		<div class="top-right">
			<s:if test="#session.curradmin==null">
			&nbsp;<span>您好，欢迎来到D_Now后台管理！</span><span>请<a href="<%=request.getContextPath() %>/manager/index.jsp">登录</a></span>
			</s:if>
			<s:else>
			&nbsp;<span><s:property value="#session.curradmin.adminname"/>&nbsp;您好，欢迎来到D_Now后台管理！</span>&nbsp;|&nbsp;<span><a href="<%=request.getContextPath() %>/manager/adminlogout">安全退出</a></span>
			</s:else>
		</div>
	</div>
</div>