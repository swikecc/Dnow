<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>
<title>D-Now网</title>

</head>

<body>

<!-- 顶部包含 -->
<s:include value="common/top.jsp"></s:include>
<!-- 头部包含 -->
<s:include value="common/header1.jsp"></s:include>

<div id="whole" class="wrapper" align="center">
<div id="neck" >
	<div class="datearea">全部商品</div>
	<div class="pagearea">
		<s:bean name="com.dnow.javabean.RandomBean">
			<a href="#">首页</a>
			<a href="productshowrand?cid=<s:property value="randint"/>&maxprice=1E12">随便看看</a>
		</s:bean>
	</div>
</div>

<div id="content" class="wrapper">
<div id="totop">
	<a class="gotop" href="#">
	<b></b>
	返回顶部
	</a>
</div>
<div id="lefter">
	<div class="cataloge">
		<dl>
			<s:action name="categoryall" namespace="/main" executeResult="true" ></s:action>
		</dl>
    </div>
	<div class="hotstuff">
		<dl>
			<dt>热销排行</dt>
			<s:action name="historyhotstuff" namespace="/" executeResult="true">
				<s:param name="low" value="0"></s:param>
				<s:param name="high" value="4"></s:param>
			</s:action>
		</dl>
    </div>
</div>
	<div class="show">
	<span><iframe src="ad/ad.jsp" frameborder="0" scrolling="no" width="770px" height="240px"></iframe></span>
	</div>
<div id="center">
	
	<div class="type" >
	  <table>
		<tr >
		  <td class="current" width="20%" onmouseover="change(this)">台  式</td>
		  <td width="20%" onmouseover="change(this)">平  板</td>
		  <td width="20%" onmouseover="change(this)">笔 记 本</td>
		  <td width="20%" onmouseover="change(this)">配  件</td>
		  <td width="20%" onmouseover="change(this)">外  设</td>
		</tr>
      </table>
	  <div class="intype" id="intype">
	  	<div class="current">
	  	<ul>
			<s:action name="productbrandlist" namespace="/" executeResult="true">
				<s:param name="cid" value="8"></s:param>
			</s:action>
		</ul>
		</div>
		<div>
	  	<ul>
			<s:action name="productbrandlist" namespace="/" executeResult="true">
				<s:param name="cid" value="7"></s:param>
			</s:action>
		</ul>
		</div>
		<div>
	  	<ul>
			<s:action name="productbrandlist" namespace="/" executeResult="true">
				<s:param name="cid" value="4"></s:param>
			</s:action>
		</ul>
		</div>
		<div>
	  	<ul>
			<s:action name="productbrandlist" namespace="/" executeResult="true">
				<s:param name="cid" value="2"></s:param>
			</s:action>
		</ul>
		</div>
		<div>
	  	<ul>
			<s:action name="productbrandlist" namespace="/" executeResult="true">
				<s:param name="cid" value="3"></s:param>
			</s:action>
		</ul>
		</div>
	  </div>
	</div>
	<div class="new">
		<dl>
			<dt><span>最新商品</span></dt>
			<dd>
				<ul class="newlist">
					<s:action name="productnewlist" namespace="/" executeResult="true"></s:action>
				</ul>
			</dd>
		</dl>
	</div>
</div>

<div id="righter">
	<div class="hotstuff">
		<dl>
			<dt>热销排行</dt>
			<s:action name="historyhotstuff" namespace="/" executeResult="true">
				<s:param name="low" value="4"></s:param>
				<s:param name="high" value="8"></s:param>
			</s:action>
		</dl>
    </div>
</div>
</div>

</div>

<!-- 底端包含 -->
<s:include value="common/footer.jsp"></s:include>
</body>
</html>
