<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单系统-处理等待发货的订单</title>
<script type="text/javascript" src="../scripts/function-manager.js"></script>
<link rel="stylesheet" type="text/css" href="../css/manager-style.css"/>

</head>

<body>
<!-- 顶端包含 -->
<s:include value="main/top.jsp"></s:include>

<div id="whole">
	<div id="top">
		<div class="logo">
			<img src="../images/logo.jpg" />
		</div>
		
        <div class="title">
  			<p><span><strong><em>D_Now购物网站后台管理系统</em></strong></span></p>
        </div>
        <s:include value="main/neck.jsp"></s:include>
         <div class="dao">
         	我的位置 &gt; <a href="adorderhistory?page=1&lowstate=3&upstate=5" >订单系统</a> &gt; 处理待发货订单 
         </div>
    </div>
    <hr style="color: #999;"/>

<div id="main">
	<div class="pager" style="margin-top: 40px;">
		<ul class="clearfix">
		<s:include value="main/orderpage.jsp"></s:include>
		</ul>
	</div>
	<table>
		<s:form action="adorderdeliver" namespace="/manager" method="post">
    	<caption>未发货的订单列表</caption>
    	
        <tr>
        	<td width="16%">订单号</td>
            <td width="8%">用户名</td>
            <td width="16%">完成时间</td>
            <td width="25%">收货地址</td>
            <td width="9%">电话</td>
            <td width="7%">收货人</td>
            <td width="8%">总量</td>
            <td width="9%">总价</td>
        </tr>
        <s:include value="main/deliver.jsp"></s:include>
        <tr>
            <td colspan="6" style="text-align: right;"><input type="button" value="全选" onclick="selectall()" /></td>
            <td><input type="button" value="全清"  onclick="clearall()"/></td>
            <td><s:submit value="所选订单已发货" /></td>
        </tr>
        </s:form>
    </table>
    <div class="clear"></div>
	<div class="pager">
		<ul class="clearfix">
		<s:include value="main/orderpage.jsp"></s:include>
		</ul>
	</div>
</div>
</div>
<!-- 底端包含 -->
<s:include value="main/footer.jsp"></s:include>
</body>
</html>
