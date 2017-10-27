<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>删除商品成功</title>
<link rel="stylesheet" type="text/css" href="../css/manager-style.css"/>
<script type="text/javascript">
	setTimeout("location.href='product.jsp'",5000);
	var count=4;
	setInterval("document.getElementById('jump').innerHTML='删除商品成功，页面将于'+count+'秒后跳转到商品系统的页面';count=parseInt(count)-1;",1000);
</script>

</head>

<body>
<!-- 顶端包含 -->
<s:include value="../main/top.jsp"></s:include>

<div id="whole">
	<div id="top">
		<div class="logo">
			<img src="../images/logo.jpg" />
		</div>
		
        <div class="title">
  			<p><span><strong><em>D_Now购物网站后台管理系统</em></strong></span></p>
        </div>
        <s:include value="../main/neck.jsp"></s:include>
         <div class="dao">
         	我的位置 &gt; 商品系统
         </div>
    </div>
    <hr style="color: #999;"/>

	<div id="main">
    	<h2 id="jump">删除商品成功，页面将于5秒后跳转到商品系统的页面</h2>
    </div>

</div>

<!-- 底端包含 -->
<s:include value="../main/footer.jsp"></s:include>
</body>
</html>


