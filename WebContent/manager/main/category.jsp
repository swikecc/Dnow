<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<s:iterator value="#request.category" var="category">
	<dt><s:property value="#category.cname" /></dt>
	<s:iterator value="#category.subcategories" var="subcategory">
		<dd><a href="<%=request.getContextPath() %>/manager/adproductpage?cid=<s:property value="#subcategory.cid"/>&page=1">
			<s:property value="#subcategory.cname" /></a></dd>
	</s:iterator>
</s:iterator>