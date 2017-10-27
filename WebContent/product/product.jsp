<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<s:if test="#session.brand!=null&&#session.brand.bid>=1">
	<s:if test="#session.listcategory.supercategory.cid!=0">
	<div class="guide" align="left">
		<span class="dao" onmouseover="this.style.marginTop='0';this.style.marginLeft='0'" onmouseout="this.style.marginTop='1px';this.style.marginLeft='1px'">
			<span class="daodetail">我的位置 &gt; 
				<b><a href="productshowpage?cid=<s:property value="#session.listcategory.supercategory.cid"/>&page=1&maxprice=1E12"><s:property value="#session.listcategory.supercategory.cname"/></a></b> &gt; 
				<b><a href="productshowpage?cid=<s:property value="#session.listcategory.cid"/>&page=1&maxprice=1E12"><s:property value="#session.listcategory.cname"/></a></b> &gt; 
				<b><s:property value="#session.brand.brand"/></b>
			</span>
		</span>
	</div>
	</s:if>
	<s:else>
	<div class="guide" align="left">
		<span class="dao" onmouseover="this.style.marginTop='0';this.style.marginLeft='0'" onmouseout="this.style.marginTop='1px';this.style.marginLeft='1px'">
			<span class="daodetail">我的位置 &gt; 
				<b><a href="productshowpage?cid=<s:property value="#session.listcategory.cid"/>&page=1&maxprice=1E12"><s:property value="#session.listcategory.cname"/></a></b> &gt; 
				<b><s:property value="#session.brand.brand"/></b>
			</span>
		</span>
	</div>
	</s:else>
</s:if>
<s:else>
	<s:if test="#session.listcategory.supercategory.cid!=0">
	<div class="guide" align="left">
		<span class="dao" onmouseover="this.style.marginTop='0';this.style.marginLeft='0'" onmouseout="this.style.marginTop='1px';this.style.marginLeft='1px'">
			<span class="daodetail">我的位置 &gt; 
				<b><a href="productshowpage?cid=<s:property value="#session.listcategory.supercategory.cid"/>&page=1&maxprice=1E12"><s:property value="#session.listcategory.supercategory.cname"/></a></b> &gt; 
				<b><s:property value="#session.listcategory.cname"/></b>
			</span>
		</span>
	</div>
	</s:if>
	<s:else>
	<div class="guide" align="left">
		<span class="dao" onmouseover="this.style.marginTop='0';this.style.marginLeft='0'" onmouseout="this.style.marginTop='1px';this.style.marginLeft='1px'">
			<span class="daodetail">我的位置 &gt; 
				<b><s:property value="#session.listcategory.cname"/></b>
			</span>
		</span>
	</div>
	</s:else>
</s:else>


<div class="pager" style="margin-top: 40px;">
	<ul class="clearfix">
		<s:include value="page.jsp"></s:include>
	</ul>
</div>
<div class="clear"></div>
<ul class="product clearfix">
	<s:iterator value="#session.currpagebean.list" var="product">
    	<li>
			<dl>
			<dt class="picborder"><a href="productshowview?product_id=<s:property value="#product.pid"/>" ><img src="images/product/<s:property value="#product.picture"/>" onmouseover="this.style.borderStyle='solid'" onmouseout="this.style.borderStyle='none'" /></a></dt>
			<dd class="title"><a href="productshowview?pid=<s:property value="#session.product.pid"/>"><s:property value="#product.pname"/></a></dd>
			<dd class="listprice">￥<s:property value="#product.price"/></dd>
			</dl>
		</li>
	</s:iterator>
</ul>
<div class="clear"></div>
<div class="pager">
	<ul class="clearfix">
		<s:include value="page.jsp"></s:include>
	</ul>
</div>