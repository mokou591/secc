<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<c:if test="${empty bookList}">
	<div class="col-md-12 column">
		<h4>未查询到该类型书。</h4>
		<div class="poster_block center-block"></div>
	</div>
</c:if>
<c:forEach items="${bookList}" var="book">
	<div class="col-md-3 column">
		<a href="${ctx}/book/${book.id}">
		<div class="poster_block center-block">
			<img class="poster" src="${book.coverUrl}" />
		</div>
			<label class="book_title center-block">${book.chsName}</label>
		</a>
	</div>
</c:forEach>