<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>manage-login</title>
<script type="text/javascript" src="../scripts/function.js"></script>
<link rel="stylesheet" type="text/css" href="../css/manager-style.css" />
</head>

<body style=" background:url(../images/manager-images/m-l-pics.jpg) no-repeat;">
	<div id="bigmain">
    <div id="m-l-main">
		<div class="managerbox" align="center" >管理员登录界面</div>
			<s:form id="loginForm" method="post" action="adminlogin" namespace="/manager" onsubmit="return checkForm(this)">
				<table>
					<tr>
						<td class="field">用户名：</td>
						<td><s:textfield cssClass="text" name="admin.adminname" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">登录密码：</td>
						<td><s:password cssClass="text" id="password" name="admin.password" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">验证码：</td>
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
<s:property value="actionMessages[0]" escapeHtml="false"/>
</body>
</html>
