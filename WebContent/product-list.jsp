<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品列表</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script   type="text/javascript">
function onfouse(obj) {
	var Tagbox = obj.parentNode;
	for(var i=0; i<Tagbox.length; i++) {
		alert(Tagbox.length);
		Tagbox.getElementsByTagName[i].className="";
		Tagbox.getElementsByTagName[i].style.backgroundColor="#fff";
	}
	obj.className="current";
	obj.style.background.Color="#ccc";
}
</script>

</head>

<body>
<!-- 顶端包含 -->
<s:include value="common/top.jsp"></s:include>

<!-- 头部包含 -->
<s:include value="common/header1.jsp"></s:include>

<div id="whole" class="wrapper" align="center">
<div id="neck" >
	<div class="datearea">全部商品</div>
	<div class="pagearea">
		<a href="index.jsp" class="currentpage">首页</a>
		<s:bean name="com.dnow.javabean.RandomBean">
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
		
		<div id="right-list" class="contenter">
			<div class="select">
				
                <dl>
					<dt class="big"><strong>商品筛选</strong></dt>
					<hr></hr>
                    <dt class="small"><strong>品 牌</strong></dt>
                    	<div style="float: right; width: 756px;"><s:action name="brandlist" namespace="/product" executeResult="true"></s:action></div>
                    <div class="clear"></div>
					<hr ></hr>
                    <dt class="small"><strong>价 格</strong></dt>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=0&maxprice=1E12">不限</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=0&maxprice=20">20以下</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=20&maxprice=50">20-50</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=50&maxprice=100">50-100</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=100&maxprice=200">100-200</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=200&maxprice=500">200-500</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=500&maxprice=1000">500-1000</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=1000&maxprice=2000">1000-2000</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=2000&maxprice=5000">2000-5000</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=5000&maxprice=10000">5000-10000</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=10000&maxprice=20000">10000-20000</a></dd>
                    <dd ><a href="productshowpage?page=1&cid=<s:property value="#parameters.cid"/>&bid=<s:property value="#parameters.bid"/>&minprice=20000&maxprice=1E12">20000以上</a></dd>
                    <dd><div class="sform"><s:form action="productshowpage" namespace="/" method="post">
                    	价格区间选择： <s:textfield cssClass="priceable" name="minprice" onfocus="this.style.backgroundColor='#fff';this.style.fontSize='13px';this.style.color='#666'" onblur="this.style.backgroundColor='#eee';this.style.fontSize='12px';this.style.color='#999'"></s:textfield>-
                    	<s:textfield cssClass="priceable" name="maxprice" onfocus="this.style.backgroundColor='#fff';this.style.fontSize='13px';this.style.color='#666'" onblur="this.style.backgroundColor='#eee';this.style.fontSize='12px';this.style.color='#999'"></s:textfield>
                    	<s:textfield cssClass="pricehidden" name="page" value="1"></s:textfield>
                    	<s:textfield cssClass="pricehidden" name="cid"></s:textfield>
                    	<s:textfield cssClass="pricehidden" name="bid"></s:textfield>
                    	<s:submit cssClass="pricebutton" name="submit" value="确认筛选"></s:submit>
                    	</s:form>
                    	</div>
                    </dd>

            		<hr/>
            	</dl>
            </div>

			<div class="product-list">
				<s:include value="product/product.jsp"></s:include>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>

<!-- 底端包含 -->
<s:include value="common/footer.jsp"></s:include>
</body>
</html>
