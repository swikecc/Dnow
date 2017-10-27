<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<dd><a href="productshowpage?cid=<s:property value="#parameters.cid"/>&bid=0&minprice=<s:property value="#parameters.minprice"/>&maxprice=<s:property value="#parameters.maxprice"/>">不限</a></dd>
<s:iterator value="#request.brandlist" >
	<dd><a href="productshowpage?cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#this.bid"/>&minprice=<s:property value="#parameters.minprice"/>&maxprice=<s:property value="#parameters.maxprice"/>"><s:property value="#this.brand"/></a></dd>
</s:iterator>