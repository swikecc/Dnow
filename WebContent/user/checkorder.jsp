<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>核对订单信息</title>
<link type="text/css" rel="stylesheet" href="../css/style.css"/>

</head>

<body>
<!-- 顶端包含 -->
<s:include value="../common/usertop.jsp"></s:include>

<div id="big-box1" class="wrapper">
	<div class="top-frame"> 
      <div class="logo">
      	<img src="../images/user/iDnow.png"/>
      </div>
      <div class="top-menu">  
          <div class="p">
          	<a href="index.jsp" class="current">个人主页</a>
          	<s:bean name="com.dnow.javabean.RandomBean">
				<a href="../productshowrand?cid=<s:property value="randint"/>&maxprice=1E12">随便看看</a>
			</s:bean>
          </div>
      </div>
   </div>
   
   <div class="left-menu">
          <div class="picture">
          	<img src="../images/user/avatar-100.png"/>
          </div>
          <div class="mylist">
          	<dl>
          		<dt>我的交易</dt>
          		<dd><a href="../cartshow?uid=<s:property value="#session.curruser.uid"/>">我的购物车</a></dd>
          		<dd><a href="orderselect?lowstate=1&upstate=4">我的订单</a></dd>
          		
          		<dt>信息管理</dt>
          		<dd><a href="userprefect">个人资料</a></dd>
          		<dd><a href="user-address.jsp">地址管理</a></dd>
          		<dd><a href="repassword.jsp">修改密码</a></dd>
          	</dl>
          </div>
  </div>
   
   <div class="main-box">
     <div class="username">
        <s:property value="#session.curruser.nickname"/>
     </div>
     <div class="introduction">
     	<s:property value="#session.curruser.introduction"/>
     </div>
     <div class="message">
		  <a href="orderselect?lowstate=1&upstate=1">待发货</a>&nbsp;<span>|</span>&nbsp;
          <a href="orderselect?lowstate=2&upstate=2">待确认收货</a>&nbsp;<span>|</span>&nbsp;
          <a href="orderselect?lowstate=3&upstate=3">待评价</a>&nbsp;<span>|</span>&nbsp;
          <a href="orderselect?lowstate=4&upstate=4">已完成</a>
     </div>
     <hr/>
     
     <div class="k-frame">
     	<div class="orderuser">
	        <div class="ord">
	        	订单号：<s:property value="#session.checkitem.orderid"/>
	        </div>
	        <div>
	        	 购买用户：<s:property value="#session.curruser.nickname"/>
	        </div>
	        <div class="oru">
	       		收货人：<s:property value="#session.checkitem.name"/>
	        </div>
	        <div class="orphone">
	        	联系电话：<s:property value="#session.checkitem.phone"/>
	        </div>
	        <div class="oradd">
				送货地址：<s:property value="#session.checkitem.address"/>
	        </div>
	        <div class="orall">
	        	商品总价：<s:property value="#session.cart.totalprice"/>
	        </div>
	        <div class="orcount">
	        	商品总数量：<s:property value="#session.cart.count"/>
	        </div>
        </div>
        <div class="k7">
	                所买商品：
	    </div>
        
        <div id="shopping">
			<table>
				<tr>
					<th>商品名称</th>
					<th>商品单价</th>
                    <th>商品小计</th>
					<th>购买数量</th>
				</tr>
				<s:iterator value="#session.cart.items" status="status">
				
				<tr id="product_id_<s:property value="#status.count"/>">
					<td class="thumb">
						<a href="productshowview?product_id=<s:property value="#this.product.pid"/>"><img src="../images/product/<s:property value="#this.product.picture"/>" /></a>
						<b><a href="productshowview?product_id=<s:property value="#this.product.pid"/>"><s:property value="#this.product.pname"/></a></b>
					</td>
					<td class="price" id="price_id_<s:property value="#status.count"/>">
						<span>￥<s:property value="#this.product.price*#this.product.discount"/></span>
						<input type="hidden" value="<s:property value="#this.product.price*#this.product.discount"/>" />
					</td>
                    <td class="total"id="total_id_<s:property value="#status.count"/>">
                    <span>￥<s:property value="#this.product.price*#this.product.discount*#this.count"/></span>
                    </td>
					<td class="number">
						<s:property value="#this.count"/>
						
					</td>
				</tr>
				</s:iterator>
					
			</table>
			<div align="center" class="checkdiv">
				<a href="orderadd"><input type="button" value="确认提交"/></a>
				<a href="ordercancel"><input type="button" value="取消订单"/></a>
			</div>
 
        
     	</div>
   	</div>   
	</div>
</div>
<!-- 底端包含 -->
<s:include value="../common/footer.jsp"></s:include>
</body>
</html>
