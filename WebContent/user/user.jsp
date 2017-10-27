<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>D-Now个人中心-资料完善</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
</head>
<body>
<!-- 顶部包含 -->
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
          		<dd><a >个人资料</a></dd>
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
  
  
	  <div class="mycenter">
	  	<s:form action="userupdate" namespace="/user" method="post">
	     <dl>
	     	<dt>个人资料</dt>
	     	<dd>用户名:&nbsp;&nbsp;<b><s:property value="#session.curruser.username"/></b></dd>
	     	<dd>昵&nbsp;称:&nbsp;&nbsp;<s:textfield name="user.nickname"></s:textfield></dd>
	     	<dd>性&nbsp;别:&nbsp;&nbsp;<s:radio list="#{'1':'男','2':'女','0':'保密'}" name="user.sex"></s:radio></dd>
	     	<dd>生&nbsp;日:&nbsp;<script language="javascript" type="text/javascript" src="../scripts/My97DatePicker/WdatePicker.js"></script>
            <s:textfield name="user.birthday" cssClass="Wdate" type="text" onClick="WdatePicker()"></s:textfield></dd>
	     	<!-- <dd>生&nbsp;日:&nbsp;&nbsp;<s:textfield name="user.birthday"></s:textfield></dd> -->
	     	<dd>工&nbsp;作:&nbsp;&nbsp;<s:textfield name="user.job"></s:textfield></dd>
	     	<dt>联系方式</dt>
	     	<dd>e-mail:&nbsp;<s:textfield name="user.email"></s:textfield></dd>
	     	<dd>电&nbsp;话:&nbsp;&nbsp;&nbsp;<s:textfield name="user.phone"></s:textfield></dd>
	     	<dd>Q&nbsp;Q:&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="user.qq"></s:textfield></dd>
	     	<dt>个人简介</dt>
	     	<dd><s:textarea cols="40" rows="5" name="user.introduction"></s:textarea></dd>
	     	<dd><s:submit cssStyle="margin-left: 25px;" name="submit" value="确认提交"></s:submit><s:reset cssStyle="margin-left: 25px;" name="reset" value="重新填写"></s:reset></dd>
	     	
	     </dl>
	     </s:form>
	  </div>
  </div>
</div>
<!-- 底端包含 -->
<s:include value="../common/footer.jsp"></s:include>
</body>
</html>