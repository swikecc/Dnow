<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册成功</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function.js"></script>
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
			<h1>欢迎注册D-Now网</h1>
			<ul class="steps clearfix">
				<li class="finished"><em></em>填写注册信息</li>
				<li class="last-current"><em></em>注册成功</li>
			</ul>
			<div class="msg">

                <p>&nbsp;</p>
                <p>&nbsp;</p>
				<p>恭喜，<s:property value="#session.curruser.nickname"/> 已经注册成功。</p>
				<p style="font-size:20px; color:#666;">正在进入首页.……</p>
				<script type="text/javascript">
				setTimeout("location.href='../index.jsp'", 3000);
				</script>
			</div>
		</div>
	</div>
</div>

<!-- 底端包含 -->
<s:include value="../common/footer.jsp"></s:include>
</body>
</html>
