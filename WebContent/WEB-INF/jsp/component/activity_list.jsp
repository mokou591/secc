<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<%@ page import="java.util.List"%>
<!-- 本页的引入和变量 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 展示列表 -->
<div class="row clearfix">
	<c:forEach items="${activityList}" var="activity">
			<div class="col-md-3 column">
				<a href="${ctx}/activity/${activity.id}">
				<div class="poster_block center-block">
					<img class="poster" src="${activity.posterUrl}" />
				</div>
					<label class="activity_title center-block">${activity.title}</label>
				</a>
			</div>
	</c:forEach>
</div>