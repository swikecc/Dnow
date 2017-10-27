<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<s:iterator value="#session.adorderpage.list" var="order">
<tr>
    <td><s:checkbox name="checkbox" fieldValue="%{#order.orderid}" /><s:property value="#order.orderid"/></td>
    <td><s:property value="#order.user.username"/></td>
    <td><s:date name="#order.time" format="yyyy-MM-dd SS:mm:ss"/></td>
    <td><s:property value="#order.address"/></td>
    <td><s:property value="#order.phone"/></td>
    <td><s:property value="#order.name"/></td>
    <td><s:property value="#order.count"/></td>
    <td><s:property value="#order.total"/></td>
</tr>
</s:iterator>
