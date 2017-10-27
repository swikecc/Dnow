<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<s:iterator value="#session.brandlist" var="brand">
	<li class="li">
		<a href="productshowpage?cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#brand.bid"/>&maxprice=1E12">
			<img src="images/logo/<s:property value="#brand.picture"/>" />
		</a>
	</li>
</s:iterator>