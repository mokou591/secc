<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<!-- 本页的引入和变量 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 展示列表 -->
<c:forEach items="${noteList}" var="note">
	<div class="page-header">
		<h4>
		<a href="${ctx}/activity/note/${note.id}">
		${note.title}
		</a>
		<small class="pull-right">
			<fmt:formatDate value="${note.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
		</small>
		</h4>
	</div>
</c:forEach>