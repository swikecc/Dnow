<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品系统</title>
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
         	我的位置 &gt; 商品系统
         </div>
    </div>
    <hr style="color: #999;"/>

	<div id="main" >
        <div class="select">
            <dl>
              	<s:action name="categoryall" namespace="/manager" executeResult="true" ></s:action>
            </dl>
        </div>
        <hr />
        <div class="list">
        <s:if test="#session.currpagebean!=null">
        <div class="pager" style="margin-top: 40px;">
			<ul class="clearfix">
				<s:include value="main/page.jsp"></s:include>
			</ul>
		</div>
		<div class="clear"></div>
            <table>
            	<caption >
            		<blockquote>
                	<p><strong>商品列表</strong></p>
            		</blockquote>
            	</caption>
                <tbody >
                    <tr>
                        <td width="80">商品图片</td>
                        <td width="150">商品名称</td>
                        <td width="450">描述</td>
                        <td width="80">类别</td>
                        <td width="80">价格</td>
                        <td width="61">折扣</td>
                        <td width="40">库存</td>
                        <td width="80">是否上市</td>
                        <td width="130">厂商</td>
                        <td width="60"></td>
                        <td width="60"></td>
                    </tr>
                   	<s:iterator value="#session.currpagebean.list" var="product">
				      <tr>
				        <td ><img src="../images/product/<s:property value="#product.picture"/>" /></td>
				        <td><s:property value="#product.pname"/></td>
				        <td><s:property value="#product.description"/></td>
				        <td><s:property value="#product.category.cname"/></td>
				        <td><s:property value="#product.price"/></td>
				        <td><s:property value="#product.discount"/></td>
				        <td><s:property value="#product.storage"/></td>
				        <td><s:if test="#product.hasDeleted==0">是</s:if>
				        <s:else>否</s:else></td>
				        <td><s:property value="#product.brand.brand"/></td>
				        <td><a href="adproductget?product_id=<s:property value="#product.pid"/>"><input type="button" value="修改商品" /></a></td>
				        <td><a href="adproductdelete?product_id=<s:property value="#product.pid"/>"><input type="button" value="删除商品" /></a></td>
				       </tr>
				    </s:iterator>
                    <div class="clear"></div>
                    <tr>
                        <td colspan="11" style="text-align: right;"><a href="product-add.jsp"><input type="button"  value="增加商品"  /></a></td>
                    </tr>
                </tbody>
            </table>
            <div class="clear"></div>
			<div class="pager">
				<ul class="clearfix">
					<s:include value="main/page.jsp"></s:include>
				</ul>
			</div>
            </s:if>
            <s:else>
            	<div style="width: 200px;"></div>
            </s:else>
            </div>

</div>
</div>
<!-- 底端包含 -->
<s:include value="main/footer.jsp"></s:include>
</body>
</html>
