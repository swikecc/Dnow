<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="bigger/css1/style.css" media="all" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
<title>商品详情</title>

<script type="text/javascript" src="JQuery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="bigger/js1/simpleZoom.js"></script>
<script type="text/javascript">
   $(function(){	
       $("#show").simpleZoom({
       zoomBox : "#zoom",
       markSize : [150, 150],//放大镜宽高
       zoomSize : [360, 360],//需要放大的区域宽高
       zoomImg : [720, 720]  //需要放大的区域的图片的宽高
       });
   });
</script>
<script type='text/javascript' src='/Dnow/dwr/interface/cartdwr.js'></script>
<script type='text/javascript' src='/Dnow/dwr/engine.js'></script>
<script type="text/javascript">
function checkbuy(pid) {
	cartdwr.getstorage(pid, onCheckbuyResult);
}

function onCheckbuyResult(result) {
	if(result<1) {
		alert('很抱歉，该商品暂时缺货！！！');
		return false;
	}
	return true;
}
</script>
</head>

<body>
<!-- 顶部包含 -->
<s:include value="common/top.jsp"></s:include>
<!-- 头部包含 -->
<s:include value="common/header1.jsp"></s:include>

<div id="whole" class="wrapper" align="center">
<div id="neck" style="font-weight: 700;">
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

    <div id="viewer"> 
	      <div class="guide" align="left">
             <span class="dao" onmouseover="this.style.marginTop='0';this.style.marginLeft='0'" onmouseout="this.style.marginTop='1px';this.style.marginLeft='1px'">
	           	<span class="daodetail">&nbsp;&nbsp;&nbsp;&nbsp;您的位置：
	              	<b><a href="index.jsp">D_Now网</a></b> &gt; 
	              	<b><a href="productshowpage?cid=<s:property value="#session.currproduct.category.cid"/>&page=1&maxprice=1E12"><s:property value="#session.currproduct.category.cname"/></a></b> &gt; 
	              	<b><a href="productshowpage?cid=<s:property value="#session.currproduct.category.cid"/>&bid=<s:property value="#session.currproduct.brand.bid"/>&page=1&maxprice=1E12"><s:property value="#session.currproduct.brand.brand"/></a></b> &gt; 
	              	<b><s:property value="#session.currproduct.pname"/></b>
              	</span>
           	 </span>
          </div>
       <div class="upper">
	    
             
        <div class="view-righter">
           <div class="pname" align="left">
              <strong><s:property value="#session.currproduct.pname"/></strong><br  /><br /><hr />	
           </div>
           <div class="else">
             <div class="pid">
	   		   <div align="left">商&nbsp;品&nbsp;编&nbsp;号：<b><s:property value="#session.currproduct.pid"/></b></div>
	   	     </div>
               <div class="price">
                	<div align="left">D_Now&nbsp;价：<b class="tobig">￥</b><b style=" font-size: 18px; font-weight:700; "><s:property value="#session.currproduct.price"/></b></div>
               </div>
           	        
                <div id="starscore" align="left">
                	<s:if test="#session.starscore!=null">
                    	<div class="slogan">商&nbsp;品&nbsp;评&nbsp;分:&nbsp;&nbsp;<b><s:property value="#session.starscore.integer"/>.<s:property value="#session.starscore.decimal"/></b></div>
                    	<div class="star star_down" style="background-position: -<s:property value="80-80*#session.starscore.score"/>px -16px;"><div class="star star_on"></div></div>
           	        </s:if>
           	        <s:else>
           	        	<div class="slogan">商&nbsp;品&nbsp;评&nbsp;分:&nbsp;&nbsp;待评价中...</div>
                    	<div class="star star_down" style="background-position: -80px 0;"><div class="star star_on"></div></div>
           	        </s:else>
           	        <div class="lang">&nbsp;&nbsp;(已有<b class="tobig"><s:if test="#session.starscore==null||#session.starscore.count<1">0</s:if><s:else><s:property value="#session.starscore.count"/></s:else></b>个人评价)</div>
                </div>
                    
                <div class="store" align="left">库&nbsp;存：
                	<b ><s:property value="#session.currproduct.storage"/></b>件
                </div>
<!--       	 	    <div class="count"> 
           	 	      <div align="left">购&nbsp;买&nbsp;数&nbsp;量：
                        <input type="button" id="minus" onmouseup="minus()" value="-"/>
       	 	            <input type="text" id="number" value="1" />
				        <input type="button" id="add" onmouseup="add()" value="+"/>
       	 	          </div>
           	 	    </div> -->  
           	 	    <div class="gocart" onmouseover="this.style.backgroundColor='#ffe8e0';this.style.borderStyle='solid'" onmouseout="this.style.backgroundColor='#fff';this.style.borderStyle='none'">
                      <div class="cart" align="center">
                      <s:if test="#session.currproduct.storage<1">
                      	<img src="images/cart.gif" onmousedown="this.style.marginTop='0';this.style.marginLeft='0'" onmouseup="this.style.marginTop='1px';this.style.marginLeft='1px'" onclick="checkbuy(<s:property value="#session.currproduct.pid"/>)"/>
                      </s:if>
                      <s:else>
                      <a href="cartbuy?pid=<s:property value="#session.currproduct.pid"/>"><img src="images/cart.gif" onmousedown="this.style.marginTop='0';this.style.marginLeft='0'" onmouseup="this.style.marginTop='1px';this.style.marginLeft='1px'"/></a>
                      </s:else>
                      </div>
                    </div>
   	 	  </div>
		</div>
         
         <div class="middle">
	   		<div class="middleup">
                 <div class="main1">
                    <div id="show"><img src="images/product/<s:property value="#session.currproduct.picture"/>" id="show_pic" width="300" height="300" /></div>
                    <div id="zoom"><img src="images/product/<s:property value="#session.currproduct.picture"/>" id="zoom_pic" width="720" height="720" /> </div>
                 </div>
	   		</div>

         </div>
         </div>
	 
       
	   <div class="downer">
        	<div class="discription" align="left"><img src="images/list_.jpg" />
            	<p><s:property value="#session.currproduct.description"/></P>
            </div>
            <div class="comment" align="left"><img src="images/list_comment.jpg" />
                    <P>用过都说好。。。</P>
                    <p>。comment表中的detail那些。。。</P>
                </div>
      </div>
</div>

</div>

</div>

<!-- 底端包含 -->
<s:include value="common/footer.jsp"></s:include>

</body>
</html>
