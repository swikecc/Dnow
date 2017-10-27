<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<s:iterator value="#session.newlist">
	<li onmouseover="this.style.borderStyle='solid'" onmouseout="this.style.borderStyle='none'">
		<div class="newgood"><a href="productshowview?product_id=<s:property value="#this.pid"/>"><img src="images/product/<s:property value="#this.picture"/>" /></a></div>
		<div class="new-name"><a href="productshowview?product_id=<s:property value="#this.pid"/>"><s:property value="#this.pname"/></a></div>
		<div class="new-price">价格：￥&nbsp;<b><s:property value="#this.price"/></b></div>
		<div class="addtime">上市时间：<b><s:date name="#this.addtime" format="yyyy-MM-dd"/></b></div>
		<a href="productshowview?product_id=<s:property value="#this.pid"/>"><input class="new-goto button input" type="button" value="购买" /></a>
	</li>
</s:iterator>