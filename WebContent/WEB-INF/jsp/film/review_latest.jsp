<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!-- 本页的引入和变量 -->
<c:set var="review_short" value="${138}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					<!-- 遍历显示影评 -->
					<c:forEach items="${reviewList}" var="review" >
						<div class="review">
							<h4 class="review_header">${review.title} 
								<c:if test="${fn:length(review.text) gt review_short}">
									<a data-toggle="collapse" href="#content${review.id}" class="showorhide">
										查看全部
									</a>
								</c:if>
							</h4>
							<a href="${ctx}/people/${review.user.id}">
								<img class="review_avatar" src="${ctx}/upload/avatar/${review.user.avatarUrl}" />
							</a>
							<span class="review_name"><a href="${ctx}/people/${review.user.id}">${review.user.nickname}</a> </span>
							<span class="review_mark"> 评分：${review.score} </small></span>
							<span class="review_date">
							<fmt:formatDate value="${review.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
							</span>
							<div class="review_text">
								<c:if test="${review.isSpoiler}">
									<blockquote>这篇影评可能有剧透</blockquote>
								</c:if>
								
								<c:choose>
									<c:when test="${fn:length(review.text) gt review_short}">
										${fn:substring(review.text, 0, review_short)}
									</c:when>
									<c:otherwise>
										${review.text}
									</c:otherwise>
								</c:choose>
								<div class="resttext panel-collapse collapse" id="content${review.id}">
									<c:if test="${fn:length(review.text) gt 138}">
										${fn:substring(review.text, 138,fn:length(review.text))}
									</c:if>
								</div>
							</div>
							<div class="review_ooxx">
								<a href="javascript:void(0)">有用</a>:892  /  
								<a href="javascript:void(0)">没用</a>:92
								<div id="ooxx61"></div>
							</div>
						</div>
					</c:forEach>
				
					<!-- 分页 -->
					<ul class="pagination">
						<li>
							 <a href="#">Prev</a>
						</li>
						<li>
							 <a href="#">1</a>
						</li>
						<li>
							 <a href="#">2</a>
						</li>
						<li>
							 <a href="#">3</a>
						</li>
						<li>
							 <a href="#">4</a>
						</li>
						<li>
							 <a href="#">5</a>
						</li>
						<li>
							 <a href="#">Next</a>
						</li>
					</ul>
				</div>
				
				<div class="col-md-4 column">
					<div class="page-header">
						<a href="${ctx}/film/${mainFilm.id}/new_review" class="btn btn-primary">我要评价</a>
					</div>
					<div class="page-header">
						<h2>
							<a id="to_film" href="${ctx }/film/${mainFilm.id}"> &gt; 回到${mainFilm.chsName}电影页面</a>
						</h2>
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