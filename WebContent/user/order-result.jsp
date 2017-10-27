<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>核对订单结果</title>
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
     		<s:if test="#session.checkitem!=null">
			<div style="background-color: #ffe8e0;"><h2 id="hh" align="center" style="padding:40px 60px;">订单生成成功，页面将于5秒后跳转到订单详情</h2></div>
			<script type="text/javascript">
				setTimeout("location.href='order-view.jsp'",5000);
				var count=4;
				setInterval("document.getElementById('hh').innerHTML='订单生成成功，页面将于'+count+'秒后跳转到订单详情';count=parseInt(count)-1;",1000);
			</script>
			</s:if>
			<s:else>
			<div style="background-color: #ffe8e0;"><h2 id="hh" align="center" style="padding:40px 60px;">订单取消成功，页面将于5秒后跳转到首页</h2></div>
			<script type="text/javascript">
				setTimeout("location.href='../index.jsp'",5000);
				var count=4;
				setInterval("document.getElementById('hh').innerHTML='订单取消成功，页面将于'+count+'秒后跳转到首页';count=parseInt(count)-1;",1000);
			</script>
			</s:else>
		</div>
 
   	</div>   
	</div>
</div>
<!-- 底端包含 -->
<s:include value="../common/footer.jsp"></s:include>
</body>
</html>
