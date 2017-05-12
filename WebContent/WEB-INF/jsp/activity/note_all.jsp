<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/activity_show.css"/>
<title>全部讨论 · 随笔</title>
</head>
<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h1>
					${mainActivity.title}
					<small>共${noteCount}条活动讨论</small>
				</h1>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					
					<!-- 没有活动讨论的提示 -->
					<c:if test="${noteCount eq 0}">
						<h3>现在还没有活动讨论哦</h3>
					</c:if>
					
					<!-- 展示讨论列表 -->
					<jsp:include page="/WEB-INF/jsp/component/activity_note_list.jsp" />
				
					<!-- 分页 -->
					<c:if test="${noteCount > 0}">
						<ul class="pagination">
							<c:if test="${paging.hasPrev}">
								<li>
								<a href="${ctx}/activity/${mainActivity.id}/note/latest/${paging.current-1}">上一页</a>
								</li>
							</c:if>
							
							<c:forEach items="${paging.pageList}" var="pageNumber">
								<c:choose>
									<c:when test="${pageNumber eq paging.current}">
										<li class="active">
											<a href="#">${pageNumber}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${ctx}/activity/${mainActivity.id}/note/latest/${pageNumber}">${pageNumber}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:if test="${paging.hasNext}">
								<li>
								<a href="${ctx}/activity/${mainActivity.id}/note/latest/${paging.current+1}">下一页</a>
								</li>
							</c:if>
						</ul>
					</c:if>
				</div>
				
				<div class="col-md-4 column">
					<div class="page-header">
						<a href="${ctx}/activity/${mainActivity.id}/note_new" class="btn btn-primary">写讨论/随笔</a>
					</div>
					<div class="page-header">
						<h4>
							<a id="to_activity" href="${ctx }/activity/${mainActivity.id}"> &gt; 回到 ${mainActivity.title}</a>
						</h4>
					</div>
					<a href="${ctx}/activity/${mainActivity.id}">
						<img id="poster" src="${mainActivity.posterUrl}" /> 
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>