<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type='text/javascript' src='/Dnow/dwr/interface/productdwr.js'></script>
<script type='text/javascript' src='/Dnow/dwr/engine.js'></script>
<script type="text/javascript">
function search() {
	var keyword = document.getElementById("keyword");
	var product_div = document.getElementById("product_div");
	if(keyword.value.length<2) {
		product_div.style.visibility = "hidden";
		return;
	}
	productdwr.search_list(keyword.value,onSelectResult);
}
function onSelectResult(result) {
	var product_div = document.getElementById("product_div");
	product_div.innerHTML = "";
	if(result!=null && result!="") {
		var temp = result.length;
		if(temp>10)
			temp = 10;
		for(var i=0; i<temp; i++) {
			product_div.innerHTML += "<div style=\"text-align: left; padding: 2px 5px; cursor: pointer;\" " +
						  "onmouseover=\"this.style.backgroundColor='#ffc6d5'\" " +
				 		  "onmouseout=\"this.style.backgroundColor='#fff'\" " +
				 		  "onclick=\"document.getElementById('hiddenkey').value=this.innerHTML;document.getElementById('keyword').value=this.innerHTML;document.getElementById('product_div').style.visibility='hidden';\">"
			+ result[i] + "</div>";
		}
		product_div.style.visibility = "visible";
	}
}
document.onclick = function() {
	var product_div = document.getElementById("product_div");
	product_div.style.visibility = "hidden";
}
</script>

<div id="head" class="wrapper">
	<div class="logo">
		<h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/index.jsp"><img src="<%=request.getContextPath() %>/images/logo.jpg" /></a></h1>
	</div>
	
	<div class="search">
		<div class="form">
			<div><input class="keyword input" type="text" id="keyword"  onkeyup="search()" /></div>
			<s:form action="productsearch" namespace="/" method="post" cssStyle="position:relative; top: -30px; float:right; width: 78px;"><s:hidden name="keyword" id="hiddenkey"></s:hidden><s:submit cssClass="button input" name="search" id="search" value="搜索"/></s:form>
		</div>
		<div id="product_div" style=" z-index: 1000; position: absolute; width:360px; border:red 1px solid; background: #fff; text-align: left; visibility: hidden;" >
			1111<br/>2222<br/>3333<br/>
		</div>
	</div>
		
	<div id="d-shop" onmouseover="shopshow(this)">
		<dl class="">
			<dt class="ld">
				<s></s>
				<span class="shopping">
					<span class="shopping-amount">
						<s:if test="#session.cart==null">0</s:if>
						<s:else><s:property value="#session.cart.count"/></s:else>
					</span>
				</span>
				<s:if test="#session.curruser==null">
				<a >去购物车结算</a>
				</s:if>
				<s:else><a href="cartshow?uid=<s:property value="#session.curruser.uid"/>">去购物车结算</a></s:else>
				<b></b>
			</dt>
		</dl>
	</div>
</div>
