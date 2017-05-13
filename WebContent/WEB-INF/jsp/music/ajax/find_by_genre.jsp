<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<c:if test="${empty musicList}">
	<div class="col-md-12 column">
		<h4>未查询到该类型音乐。</h4>
		<div class="poster_block center-block"></div>
	</div>
</c:if>
<c:forEach items="${musicList}" var="music">
	<div class="col-md-3 column">
		<a href="${ctx}/music/${music.id}">
		<div class="poster_block center-block">
			<img class="poster" src="${music.coverUrl}" />
		</div>
			<label class="music_title center-block">${music.chsName}<br/><small>${music.artist}</small></label>
		</a>
	</div>
</c:forEach>