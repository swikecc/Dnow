<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<s:if test="#attr.iter==null">
<s:set var="iter" value="1" scope="request"></s:set>
</s:if>
<s:iterator value="#session.hotlist" var="hotproduct">
<dd onmouseover="this.style.borderStyle='solid'" onmouseout="this.style.borderStyle='none'">
	<div class="hotgood">
		<s><s:property value="#attr.iter"/></s>
		<a href="productshowview?product_id=<s:property value="#hotproduct.product.pid"/>"><img src="<%=request.getContextPath() %>/images/product/<s:property value="#hotproduct.product.picture"/>" />
		</a>
		<div class="p-name"><a href="productshowview?product_id=<s:property value="#hotproduct.product.pid"/>"><s:property value="#hotproduct.product.pname"/></a></div>
		<div class="p-price">价格:￥&nbsp;<b><s:property value="#hotproduct.product.price"/></b></div>
		<div class="p-count"><span>(已出售:&nbsp;</span><span class="amountcount"><b><s:property value="#hotproduct.count"/></b>件)</span></div>
		<a href="productshowview?product_id=<s:property value="#hotproduct.product.pid"/>"><input class="goto button input" type="button" value="购买" /></a>
	</div>
</dd>
<s:set var="iter" value="#attr.iter+1" scope="request"></s:set>
</s:iterator>