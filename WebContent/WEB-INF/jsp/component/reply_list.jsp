<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<%@ page import="java.util.List"%>
<!-- 本页的引入和变量 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 展示列表 -->
<c:if test="${not empty replyDetailList}">
	<div class="page-header">
		<h2><small>回复</small></h2>
	</div>
</c:if>
<c:forEach items="${replyDetailList}" var="reply" >
	<a href="${ctx}/people/${reply.user.id}" style='text-decoration:none;' >
		<img class="reply_avatar" src="${ctx}/upload/avatar/${reply.user.avatarUrl}" />
	</a>
	<span class="reply_name"><a href="${ctx}/people/${reply.user.id}">${reply.user.nickname}</a> </span>
	<span class="reply_date pull-right">
		<fmt:formatDate value="${reply.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
	</span>
	<div class="reply_text">
		<pre>${reply.text}</pre>
	</div>
	<hr/>
</c:forEach>