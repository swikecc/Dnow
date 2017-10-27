<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户地址管理</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />

</head>

<body>
<!-- 顶端包含 -->
<s:include value="../common/usertop.jsp"></s:include>

<div id="big-box1" class="wrapper">
	<div class="top-frame"> 
      <div class="logo">
      	<img src="../images/user/iDnow.png"/>
      </div>
      <div class="top-menu">  
          <div class="p">
          	<a href="index.jsp" class="current">个人主页</a>
          	<s:bean name="com.dnow.javabean.RandomBean">
				<a href="../productshowrand?cid=<s:property value="randint"/>&maxprice=1E12">随便看看</a>
			</s:bean>
          </div>
      </div>
   </div>
   
   <div class="left-menu">
          <div class="picture">
          	<img src="../images/user/avatar-100.png"/>
          </div>
          <div class="mylist">
          	<dl>
          		<dt>我的交易</dt>
          		<dd><a href="../cartshow?uid=<s:property value="#session.curruser.uid"/>">我的购物车</a></dd>
          		<dd><a href="orderselect?lowstate=1&upstate=4">我的订单</a></dd>
          		
          		<dt>信息管理</dt>
          		<dd><a href="userprefect">个人资料</a></dd>
          		<dd><a href="user-address.jsp">地址管理</a></dd>
          		<dd><a href="repassword.jsp">修改密码</a></dd>
          	</dl>
          </div>
  </div>
   
   <div class="main-box">
     <div class="username">
        <s:property value="#session.curruser.nickname"/>
     </div>
     <div class="introduction">
     	<s:property value="#session.curruser.introduction"/>
     </div>
     <div class="message">
        <a href="orderselect?lowstate=1&upstate=1">待发货</a>&nbsp;<span>|</span>&nbsp;
        <a href="orderselect?lowstate=2&upstate=2">待确认收货</a>&nbsp;<span>|</span>&nbsp;
        <a href="orderselect?lowstate=3&upstate=3">待评价</a>&nbsp;<span>|</span>&nbsp;
        <a href="orderselect?lowstate=4&upstate=4">已完成</a>
     </div>
     <hr/>
     
<div class="k-frame">
	<div class="addresslist">
	<s:if test="#session.curruser!=null">
	<table>
    	<tr>
        	<td colspan="3" class="t">地址管理</td>
        </tr>
        <s:iterator value="#session.curruser.addresses" var="address" status="status">
        <tr>
        	<td class="t1"><s:property  value="#address.addressName"/></td>
            <!-- <td class="t2" ><input type="button" value="修改" onclick="document.getElementById('update').style.visibility='visible'" /></td> -->
            <td class="t2" ><input type="button" value="删除" onclick="document.getElementById('delete<s:property value="#status.count"/>').style.visibility='visible'" /></td>
        </tr>
        <div id="update" class="show">
		<span >请修改地址：</span>
		<s:form action="useraddressupdate" namespace="/user" method="post">
    	<s:textarea name="addname"></s:textarea>
		<input type="button" value="取消修改" onclick="document.getElementById('update').style.visibility='hidden'" />
		<s:submit value="确认修改" name="submit"/> 
		</s:form>
		</div>
		<div id="delete<s:property value="#status.count"/>" class="show delete">
		<span ><strong>确定删除！！！</strong></span>
		<div class="clear"></div>
		<center style="height: 60px;">确定删除地址？</center>
		<input type="button" value="取消" onclick="document.getElementById('delete<s:property value="#status.count"/>').style.visibility='hidden'" />
		<a href="useraddressdelete?addressid=<s:property value="#address.aid"/>"><input type="button" value="删除"/></a>
		</div>
        </s:iterator>
        <tr>
            <td class="t3" colspan="2"><input type="button" value="增加" onclick="document.getElementById('add').style.visibility='visible'" /></td>
        </tr>
    </table>
    
    <div id="add" class="show">
		<span >请添加地址：</span>
		<s:form action="useraddressadd" namespace="/user" method="post">
		<s:textarea name="addname"></s:textarea>
		<input type="button" value="取消" onclick="document.getElementById('add').style.visibility='hidden'" />
		<s:submit value="确认添加"  name="submit"/>
		</s:form>
	</div>
	</s:if>
	<s:else>
		<center>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>对不起，您还没有登录！！！</p>
		<p id="repasswordgotoindex" style="font-size:20px; color:#666;">正在进入用户登录页面.……5</p>
		<script type="text/javascript">
		setTimeout("location.href='login.jsp'",5000);
		var count=4;
		setInterval("document.getElementById('repasswordgotoindex').innerHTML='正在进入用户登录页面.……' + count;count=parseInt(count)-1;",1000);
		</script>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		</center>
	</s:else>
		
	</div>
</div>

	</div>
</div>
<!-- 底端包含 -->
<s:include value="../common/footer.jsp"></s:include>
</body>
</html>
