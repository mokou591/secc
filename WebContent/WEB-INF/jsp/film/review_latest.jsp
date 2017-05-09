<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!-- 本页的引入和变量 -->
<c:set var="review_short" value="${135}" />
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
										<c:if test="${fn:length(review.text) gt review_short}">
											${fn:substring(review.text, review_short,fn:length(review.text))}
										</c:if>
									</div>
							</div>
							<div class="review_ooxx">
								<button id="oobtn${review.id}" reviewId="${review.id}" type="oo" class="btn btn-default btn-sm ooxx">
									有用<span id="oo${review.id}">${review.vote.oo}</span>
								</button>
								<button id="xxbtn${review.id}" reviewId="${review.id}" type="xx" class="btn btn-default btn-sm ooxx" >
									没用<span id="xx${review.id}">${review.vote.xx}</span>
								</button>
								<span id="ooxx_result${review.id}"></span>								
							</div>
						</div>
					</c:forEach>
						
					<!-- 用户评论影评是否有用的功能 -->
					<script type="text/javascript">
						var resultTip="";
						$('.review_ooxx .ooxx').click(function(){
							var reviewId = $(this).attr('reviewId');
							var type = $(this).attr('type');
							$.post("${ctx}/film/review/"+reviewId+"/"+type,
									{},
									function(result){
										switch(result){
											case "success":
												var count = parseInt($('#'+type+reviewId).html());
												$('#'+type+'btn'+reviewId).addClass("active");
												$('#'+type+reviewId).html(count+1);
												resultTip="感谢您的评价！";
												break;
											case "hasDone":
												resultTip="您已经评价过了哦";
												break;
											case "needToLogin":
												resultTip='登录后才能评价哦 <a class="btn btn-default btn-xs" href="${ctx}/user/login">登录</a>';
												break;
											default:
										}
										$("#ooxx_result"+reviewId).html(resultTip);
									});
						});
					</script>
				
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