<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function.js"></script>
<title>登录界面</title>
</head>

<body>
<!-- 顶端包含 -->
<s:include value="../common/top.jsp"></s:include>
<!-- 头部包含 -->
<s:include value="../common/header2.jsp"></s:include>
    

<div id="register" class="wrapper">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎回到D-Now网</h1>
			<div class="people"><img src="../images/main3.jpg" /></div>
			<s:form id="loginForm" method="post" action="userlogin" namespace="/user" onsubmit="return checkForm(this)">
				<table>
					<tr>
						<td></td>
						<td class="field">用户名：</td>
					</tr>
					<tr>
						<td></td>
						<td><s:textfield cssClass="text" name="user.username" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td></td>
						<td class="field">登录密码：</td>
					</tr>
					<tr>
						<td></td>
						<td><s:password cssClass="text" id="password" name="user.password" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td></td>
						<td class="field">验证码：</td>
					</tr>
					<tr>
						<td></td>
						<td><s:textfield cssClass="text verycode" name="veryCode" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><img id="veryCode" src="../valcode" onclick="this.src=this.src+'?'" title="点击换一张" /><span></span></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-red"><s:submit name="submit" value="立即登录" /></label></td>
					</tr>
				</table>
			</s:form>
		</div>
	</div>
	<div class="clear"></div>
</div>

<!-- 底端包含 -->
<s:include value="../common/footer.jsp"></s:include>
<s:property value="actionMessages[0]" escapeHtml="false"/>
</body>
</html>
