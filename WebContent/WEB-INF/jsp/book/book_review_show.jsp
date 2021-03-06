<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${ctx}/css/book_show.css" />
	<link rel="stylesheet" href="${ctx}/css/reply_list.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${review.book.chsName} 书评</title>
</head>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h2>
					<c:if test="${isEssence}">
						<button class="btn btn-danger">精华</button>
					</c:if>
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
							<blockquote>这篇书评可能有剧透</blockquote>
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
							$.post("${ctx}/book/review/"+reviewId+"/"+type,
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
												resultTip='登录后才能评价哦 <a class="btn btn-default btn-xs" href="${ctx}/user/login?loginPrevPage=/book/review/${review.id}">登录</a>';
												break;
											default:
										}
										$("#ooxx_result"+reviewId).html(resultTip);
									});
						});
					</script>
					
					
					<!-- 回复区域 -->
					<div class="col-md-10 col-md-offset-2">
						
						<!-- 展示回复，遍历集合replyDetailList -->
						<jsp:include page="/WEB-INF/jsp/component/reply_list.jsp"></jsp:include>
						
						<!-- 回复的按钮 -->
						<c:choose>
							<c:when test="${empty loginUser}">
								<a href="${ctx}/user/login?loginPrevPage=/book/review/${review.id}" style="margin:50px 0;" class="btn btn-link"> &gt; 我来回应 </a>
							</c:when>
							
							<c:otherwise>
								<div class="page-header">
									<h4>你的回应 · · ·</h4>
								</div>
								<form action="${ctx}/book/review/${review.id}/reply_submit" method="post" role="form">
									<input type="hidden" name="toId" value="${review.id}" />
									<input type="hidden" name="userId" value="${loginUser.id}" />
									<div class="form-group">
										<textarea class="form-control" style="resize:none;" rows="4" name="text" ></textarea>
									</div>
									<button type="submit" class="btn btn-primary reply_submit">回复</button>
								</form>
							</c:otherwise>
						</c:choose>
					</div>
					
					
					
				</div>
				<div class="col-md-4 column">
					<div class="page-header">
						<a href="${ctx}/book/${review.book.id}/review_new" class="btn btn-primary">我要评价</a>
					</div>
					<div class="page-header">
						<h4>
							<a id="to_book" href="${ctx }/book/${review.book.id}"> &gt; 转到 ${review.book.chsName} 页面</a>
						</h4>
					</div>
					<a href="${ctx }/book/${review.book.id}">
						<img id="poster" src="${review.book.coverUrl}" /> 
					</a>
					
					
					<!-- 管理员操作 -->
					<c:if test="${not empty userAuthority }">
						<div class="page-header">
							<h3>
								管理员操作
							</h3>
						</div>
						<c:choose>
							<c:when test="${isEssence == false}">
								<a class="btn btn-primary" href="${ctx}/admin/book/${review.id}/setEssence/is">设置为精华</a>
							</c:when>
							<c:when test="${isEssence == true}">
								<a class="btn btn-danger" href="${ctx}/admin/book/${review.id}/setEssence/not">取消设置为精华</a>
							</c:when>
						</c:choose>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>