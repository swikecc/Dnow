<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<s:set var="begin" value="#session.adorderpage.currpage-2" scope="page"></s:set>
<s:if test="#attr.begin<1">
	<s:set var="begin" value="1" scope="page"></s:set>
</s:if>
<s:set var="end" value="#attr.begin+4" scope="page"></s:set>
<s:if test="#attr.end>#session.adorderpage.pagecount">
	<s:set var="end" value="#session.adorderpage.pagecount" scope="page"></s:set>
	<s:if test="#attr.end>4">
		<s:set var="begin" value="#attr.end-4" scope="page"></s:set>
	</s:if>
	<s:else>
		<s:set var="begin" value="1" scope="page"></s:set>
	</s:else>
</s:if>

<s:if test="#session.adorderpage.pagecount==1">
	<li>首页</li>
	<li>上一页</li>
	<li class="current">1</li>
	<li>下一页</li>
	<li>末页</li>
</s:if>
<s:elseif test="#session.adorderpage.currpage<=1">
	<li>首页</li>
	<li>上一页</li>
	<s:if test="#attr.begin!=1">
		<li class="point">...</li>
	</s:if>
	<s:iterator begin="#attr.begin" end="#attr.end" step="1" var="pagenum">
		<s:if test="#pagenum==#session.adorderpage.currpage">
			<li class="current"><s:property value="#pagenum"/></li>
		</s:if>
		<s:else>
			<li><a href="adorderhistory?page=<s:property value="#pagenum"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>"/><s:property value="#pagenum"/></a></li>
		</s:else>
	</s:iterator>
	<s:if test="#attr.end!=#session.adorderpage.pagecount">
		<li class="point">...</li>
	</s:if>
	<li><a href="adorderhistory?page=<s:property value="#session.adorderpage.currpage+1"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>">下一页</a></li>
	<li><a href="adorderhistory?page=<s:property value="#session.adorderpage.pagecount"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>">末页</a></li>
</s:elseif>
<s:elseif test="#session.adorderpage.currpage==#session.adorderpage.pagecount">
	<li><a href="adorderhistory?page=1&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>">首页</a></li>
	<li><a href="adorderhistory?page=<s:property value="#session.adorderpage.currpage-1"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>">上一页</a></li>
	<s:if test="#attr.begin!=1">
		<li class="point">...</li>
	</s:if>
	<s:iterator begin="#attr.begin" end="#attr.end" step="1" var="pagenum">
		<s:if test="#pagenum==#session.adorderpage.currpage">
			<li class="current"><s:property value="#pagenum"/></li>
		</s:if>
		<s:else>
			<li><a href="adorderhistory?page=<s:property value="#pagenum"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>"><s:property value="#pagenum"/></a></li>
		</s:else>
	</s:iterator>
	<s:if test="#attr.end!=#session.adorderpage.pagecount">
		<li class="point">...</li>
	</s:if>
	<li>下一页</li>
	<li>末页</li>
</s:elseif>
<s:else>
	<li><a href="adorderhistory?page=1&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>">首页</a></li>
	<li><a href="adorderhistory?page=<s:property value="#session.adorderpage.currpage-1"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>">上一页</a></li>
	<s:if test="#attr.begin!=1">
		<li class="point">...</li>
	</s:if>
	<s:iterator begin="#attr.begin" end="#attr.end" step="1" var="pagenum">
		<s:if test="#pagenum==#session.adorderpage.currpage">
			<li class="current"><s:property value="#pagenum"/></li>
		</s:if>
		<s:else>
			<li><a href="adorderhistory?page=<s:property value="#pagenum"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>"><s:property value="#pagenum"/></a></li>
		</s:else>
	</s:iterator>
	<s:if test="#attr.end!=#session.adorderpage.pagecount">
		<li class="point">...</li>
	</s:if>
	<li><a href="adorderhistory?page=<s:property value="#session.adorderpage.currpage+1"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>">下一页</a></li>
	<li><a href="adorderhistory?page=<s:property value="#session.adorderpage.pagecount"/>&lowstate=<s:property value="#parameters.lowstate"/>&upstate=<s:property value="#parameters.upstate"/>">末页</a></li>
</s:else>