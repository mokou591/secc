<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/film_show.css"/>
<title>${mainFilm.chsName}的最新影评</title>
</head>
<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h1>
					${mainFilm.chsName}
					<small>共${reviewCount}条最新影评</small>
				</h1>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					
					<!-- 没有影评的提示 -->
					<c:if test="${reviewCount eq 0}">
						<h3>现在还没有影评哦</h3>
					</c:if>
					
					<!-- 展示评论列表 -->
					<jsp:include page="/WEB-INF/jsp/component/reviewlist.jsp" />
				
					<!-- 分页 -->
					<c:if test="${reviewCount > 0}">
						<ul class="pagination">
							<c:if test="${paging.hasPrev}">
								<li>
								<a href="${ctx}/film/${mainFilm.id}/review/latest/${paging.current-1}">上一页</a>
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
											<a href="${ctx}/film/${mainFilm.id}/review/latest/${pageNumber}">${pageNumber}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:if test="${paging.hasNext}">
								<li>
								<a href="${ctx}/film/${mainFilm.id}/review/latest/${paging.current+1}">下一页</a>
								</li>
							</c:if>
						</ul>
					</c:if>
				</div>
				
				<div class="col-md-4 column">
					<div class="page-header">
						<a href="${ctx}/film/${mainFilm.id}/new_review" class="btn btn-primary">我要评价</a>
					</div>
					<div class="page-header">
						<h4>
							<a id="to_film" href="${ctx }/film/${mainFilm.id}"> &gt; 回到${mainFilm.chsName}电影页面</a>
						</h4>
					</div>
					<a href="${ctx }/film/${mainFilm.id}">
						<img id="poster" src="${mainFilm.posterUrl}" /> 
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>