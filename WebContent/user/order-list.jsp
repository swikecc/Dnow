<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单列表</title>
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
     	<div id="shopping">
     		<s:if test="#session.orderlist!=null">
     		<div class="pager" style="margin-top: 40px;">
				<ul class="clearfix">
					<s:include value="page.jsp"></s:include>
				</ul>
			</div>
			<div class="clear"></div>
			<table class="orderlist">
				<tr>
					<th>订单号</th>
					<th>订单状态</th>
					<th>商品列表</th>
				</tr>
				<s:iterator value="#session.orderlist" var="order">
				<tr >
					<td class="o-number">
					<a href="orderview?orderid=<s:property value="#order.orderid"/>"><s:property value="#order.orderid"/></a>
					</td>
					<td class="o-state">
						<b><s:if test="#order.state==1">等待发货</s:if>
	        			<s:elseif test="#order.state==2">等待收货<div><b><a href="ordercheckget?orderid=<s:property value="#order.orderid"/>">确认收货</a></b></div></s:elseif>
	        			<s:elseif test="#order.state==3">等待评价<div><b><a>去评价</a></b></div></s:elseif>
	        			<s:else>交易成功<div><a href="orderdelete?orderid=<s:property value="#order.orderid"/>">删除</a></div></s:else></b>
					</td>
                    <td class="o-catalog">
                            <div class="ord-cataloge">
                                <ul>
                                	
                                	<li class="span"><strong>产品：</strong></li>
                                	<s:iterator value="#order.orderItems" var="item">
                                    <li class="sp"><a href="../productshowview?product_id=<s:property value="#item.product.pid"/>"><s:property value="#item.product.pname"/></a></li>
                                    </s:iterator>
                                </ul>
                            </div>
					</td>
				</tr>
				</s:iterator>
			</table>
			<div class="clear"></div>
			<div class="pager">
				<ul class="clearfix">
					<s:include value="page.jsp"></s:include>
				</ul>
			</div>
			</s:if>
			<s:else>
				<div align="center" style="font-size: 30px; margin-top: 100px; margin-bottom: 100px;"><strong>没有此类订单！</strong></div>
			</s:else>
          
		</div>
 
   	</div>   
	</div>
</div>
<!-- 底端包含 -->
<s:include value="../common/footer.jsp"></s:include>
</body>
</html>
