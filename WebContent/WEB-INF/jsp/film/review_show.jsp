<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${ctx}/css/film_show.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${review.film.chsName} 影评</title>
</head>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h2>
					${review.title}
				</h2>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<a href="${ctx}/people/${review.user.id}" style='text-decoration:none;' >
						<img class="review_avatar" src="${ctx}/upload/avatar/${review.user.avatarUrl}" />
					</a>
					
					<span class="review_name"><a href="${ctx}/people/${review.user.id}">${review.user.nickname}</a> </span>
					<span class="review_mark"> 评分：${review.score}</span>
					<span class="review_date">
						<fmt:formatDate value="${review.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
					</span>
					
					<div class="review_text">
						<c:if test="${review.isSpoiler}">
							<blockquote>这篇影评可能有剧透</blockquote>
						</c:if>
						<pre>${review.text}</pre>
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
					
				</div>
				<div class="col-md-4 column">
					<div class="page-header">
						<a href="${ctx}/film/${review.film.id}/review_new" class="btn btn-primary">我要评价</a>
					</div>
					<div class="page-header">
						<h4>
							<a id="to_film" href="${ctx }/film/${review.film.id}"> &gt; 转到${review.film.chsName}电影页面</a>
						</h4>
					</div>
					<a href="${ctx }/film/${review.film.id}">
						<img id="poster" src="${review.film.posterUrl}" /> 
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>