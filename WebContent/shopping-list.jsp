<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link type="text/css" rel="stylesheet" href="css/style.css"/>

<script type='text/javascript' src='/Dnow/dwr/interface/cartdwr.js'></script>
<script type='text/javascript' src='/Dnow/dwr/engine.js'></script>
<script type="text/javascript">
function plus(id,obj,pid){
	var val = obj.parentNode.getElementsByTagName("input")[1];
	if(val.value<=1)
		val.value=1;
	else val.value=val.value-1;
	total(id,pid);
}
function add(id,obj,pid){
	var val = obj.parentNode.getElementsByTagName("input")[1];
	val.value=parseInt(val.value)+1;
	check(id,pid);
}

function check(id,pid) {
	var number=parseInt(document.getElementById("number_id_"+id).value);
	cartdwr.getnumber(pid, number, id, onCheckResult);
}

function total(id,pid){
    var price=parseFloat(document.getElementById("price_id_"+id).getElementsByTagName("input")[0].value);
	var total=document.getElementById("total_id_"+id).getElementsByTagName("span")[0];
	var number=parseInt(document.getElementById("number_id_"+id).value);
	total.innerHTML = "￥" + (price*100 * number)/100;
	cartdwr.changeCount(pid,number,onTotalResult);
}

function onTotalResult(result) {
	var totalprice = document.getElementById("totalprice");
	totalprice.innerHTML = "" + parseFloat(result);
}

function onCheckResult(result) {
	var id = result[0];
	var pid = result[1];
	document.getElementById("number_id_"+id).value = result[2];
	total(id, pid);
}

</script>
<style type="text/javascript">

</style>
</head>


<body>
<!-- 顶端包含 -->
<s:include value="common/top.jsp"></s:include>

<div id="big-box1" class="wrapper">
  <div class="top-frame"> 
      <div class="logo">
      	<img src="images/user/iDnow.png"/>
      </div>
      <div class="top-menu">  
          <div class="p">
          	<a href="user/index.jsp" class="current">个人主页</a>
          	<s:bean name="com.dnow.javabean.RandomBean">
				<a href="productshowrand?cid=<s:property value="randint"/>&maxprice=1E12">随便看看</a>
			</s:bean>
          </div>
      </div>
   </div>
   <div class="location">
		您现在的位置：<a href="index.jsp">D-now首页</a> &gt; 购物车
   </div> 
   <div class="wrap">
	<div id="shopping">
		<s:if test="#session.cart!=null">
			<table>
				<tr>
					<th>商品名称</th>
					<th>商品单价</th>
                    <th>小计</th>
					<th>购买数量</th>
					<th>操作</th>
				</tr>
				<s:iterator value="#session.cart.items" status="status">
				
				<tr id="product_id_<s:property value="#status.count"/>">
					<td class="thumb">
						<img src="images/product/<s:property value="#this.product.picture"/>" />
						<b><a href="productshowview?product_id=<s:property value="#this.product.pid"/>"><s:property value="#this.product.pname"/></a></b>
						&nbsp;&nbsp;库存：<s:property value="#this.product.storage"/>件
					</td>
					<td class="price" id="price_id_<s:property value="#status.count"/>">
						<span>￥<s:property value="#this.product.price*#this.product.discount"/></span>
						<input type="hidden" value="<s:property value="#this.product.price*#this.product.discount"/>" />
					</td>
                    <td class="total"id="total_id_<s:property value="#status.count"/>">
                    <span>￥<s:property value="#this.product.price*#this.product.discount*#this.count"/></span>
                    </td>
					<td class="number">
						<dl>
                        <dd>
							<input type="button" value="-" onmouseup="plus(<s:property value="#status.count"/>,this,<s:property value="#this.product.pid"/>)" style="width:20px" />
                            <input type="text" id="number_id_<s:property value="#status.count"/>" value="<s:property value="#this.count"/>" onkeyup="check(<s:property value="#status.count"/>,<s:property value="#this.product.pid"/>)" style="width:20px" />
                            <input type="button" value="+" onmouseup="add(<s:property value="#status.count"/>,this,<s:property value="#this.product.pid"/>)" style="width:20px"  />
						</dd>
                        </dl>
					</td>
					<td class="delete"><a href="cartdelete?pid=<s:property value="#this.product.pid"/>">删除</a></td>
				</tr>
				</s:iterator>
			</table>
			
          
             <div class="all">
                <div class="totalprice">
                	总价：￥<span id="totalprice"><s:property value="#session.cart.totalprice"/></span>
                </div>
             </div>
			 <div class="button">
			 <input type="button" value="" onclick="document.getElementById('hidden').style.visibility='visible'"/>
    		 </div>
    		 <div id="hidden" class="wrapper">
    		 
				<div class="order-frame">
			      <div class="orderdetail">
			        <div class="head">
			          	填写订单信息
			        </div>
			      	<div class="ordercontent">
			      	<s:form action="ordercheck" namespace="/user" method="post">
			      		<div class="phone">
			      			收&nbsp;货&nbsp;人：
			      			<s:textfield name="name" style="width:200px;"></s:textfield>
			      		</div>
				      	<div class="address">
				     	 	送货地址：
				     	<s:bean name="com.dnow.javabean.AddressBean">
				     		<s:param name="alist" value="#session.curruser.addresses"></s:param>
				     	<s:if test="addmap!=null">
				     	<s:select name="address" list="addmap" cssStyle="width:220px;"></s:select>
				     	</s:if>
				     	<s:else>
				     	<s:textfield name="address" style="width:200px;"></s:textfield><div style="font-size: 12px;">(此用户没有存储地址)</div>
				     	</s:else>
				      	</s:bean>
				      	</div>
				      	<div class="phone">
				      		联系电话：
				      	<s:textfield name="phone" style="width:200px;"/>
				      	</div>
				      	<div class="way">
				      		付款方式：<b>货到付款</b>
				      	</div>
				      	<div class="order-input">
				      	<s:submit name="submit" value="生成订单"/>
				      	<input type="button" value="取消" onclick="document.getElementById('hidden').style.visibility='hidden'"/>
				      	</div>
				      </s:form>
			      	</div>
			      </div>
			   </div>  
			</div>
		</s:if>
		<s:else>
		 <div class="noanyitem" style=" margin: 40px auto; width: 60%; height: 100px; font-size: 28px; color: #999; line-height: 100px;">
		 	<s:bean name="com.dnow.javabean.RandomBean">
		 		<a href="productshowrand?cid=<s:property value="randint"/>&maxprice=1E12" title="去购物"><img src="images/cart.jpg" style="float: left; width:100px; height:100px;" /></a>
		 		&nbsp;&nbsp;您的购物车里空荡荡的，赶紧去选购吧!
		 	</s:bean>
		 </div>
		</s:else>
</div>   
</div>   


</div>

<!-- 底端包含 -->
<s:include value="common/footer.jsp"></s:include>
</body>
</html>
