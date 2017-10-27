<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function.js"></script>

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
     

<div id="change" class="wrap">
	<s:if test="#session.curruser!=null">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>修改密码</h1>
			<s:form id="loginForm" method="post" action="usernewpassword" namespace="/user" onsubmit="return checkForm(this)">
				<table>
					<tr>
						<td class="field">用户名：</td>
						<td><s:textfield cssClass="text" name="user.username" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">原密码：</td>
						<td><s:password cssClass="text" id="oldpassword" name="user.password" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">新密码：</td>
						<td><s:password cssClass="text" id="password" name="newpassword" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><s:password cssClass="text" id="password" name="repassword" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">验证码：</td>
						<td><s:textfield cssClass="text verycode" name="veryCode" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><img id="veryCode" src="../valcode" onclick="this.src = this.src+'?'" /><span></span></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-red"><s:submit name="submit" value="提交" /></label></td>
					</tr>
				</table>
			</s:form>
		</div>
	</div>
	</s:if>
	<s:else>
		<center>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>对不起，您还没有登录！！！</p>
		<p id="repasswordgotoindex" style="font-size:20px; color:#666;">正在进入用户登录页面.……5</p>
		<script type="text/javascript">
		setTimeout("location.href='login.jsp'",5000);
		var count=4;
		setInterval("document.getElementById('repasswordgotoindex').innerHTML='正在进入用户登录页面.……' + count;count=parseInt(count)-1;",1000);
		</script>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		</center>
	</s:else>
</div>
<s:fielderror></s:fielderror>
</div>
</div>
<!-- 底端包含 -->
<s:include value="../common/footer.jsp"></s:include>
<s:property value="actionMessages[0]" escapeHtml="false"/>
</body>
</html>
