<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<c:if test="${empty filmList}">
	<div class="col-md-12 column">
		<h4>未查询到该类型电影。</h4>
		<div class="poster_block center-block"></div>
	</div>
</c:if>
<c:forEach items="${filmList}" var="film">
	<div class="col-md-3 column">
		<a href="${ctx}/film/${film.id}">
		<div class="poster_block center-block">
			<img class="poster" src="${film.posterUrl}" />
		</div>
			<label class="film_title center-block">${film.chsName}</label>
		</a>
	</div>
</c:forEach>