<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品系统-更新商品</title>
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
         	我的位置 &gt; <a href="product.jsp" >商品系统</a> &gt; 更新商品 
         </div>
    </div>
    <hr style="color: #999;"/>

	<div id="main">
        <table class="productadd">
        	<s:form action="adproductupdate" namespace="/manager" method="post">
            <tr>
                <td >&nbsp; </td>
                <td >产品图片</td>
                <td ><s:file name="product.picture" /></td>
                <td >&nbsp; </td>
            </tr>
            <tr>
                <td ></td>
                <td>产品名称</td>
                <td><s:textfield name="product.pname" /> </td>
                <td ></td>
            </tr>
            <tr>
                <td ></td>
                <td>产品描述</td>
                <td><s:textarea name="product.description" cols="20" rows="10"></s:textarea></td>
                <td ></td>
            </tr>
            <tr>
                <td ></td>
                <td>所属类别</td>
                <td>
                <s:bean name="com.dnow.javabean.CategoryBean">
                    <s:select id="category" name="cid" list="categorymap"></s:select>
               	</s:bean>
                </td>
                <td ></td>
            </tr>
            <tr>
               	<td></td>
                <td>价格</td>
                <td><s:textfield name="product.price" /></td>
                <td></td>
            </tr>
            <tr>
               	<td></td>
                <td>库存</td>
                <td><s:textfield name="product.storage" /></td>
                <td></td>
            </tr>
            <tr>
                <td ></td>
                <td>是否上市</td>
                <td>
                <s:radio name="product.hasDeleted" list="#{'0':'是','1':'否'} "></s:radio>
                </td>
                <td ></td>
            </tr>
            <tr>
               	<td></td>
                <td>折扣</td>
                <td><s:textfield name="product.discount"/></td>
                <td></td>
            </tr>
            <td></td>
            <td>厂商</td>
                <td>
                <s:bean name="com.dnow.javabean.BrandBean">
                <s:select name="bid" list="brandmap"></s:select>
                </s:bean>
                </td>
            <td width="197"></td>
            <tr>
                <td></td>
                <td></td>
                <td><s:submit name="submit" value="确认修改"/><s:reset name="reset" value="重新填写"/></td>
                <td></td>
            </tr>
            </s:form>
        </table>

</div>

</div>

<!-- 底端包含 -->
<s:include value="main/footer.jsp"></s:include>
</body>
</html>
