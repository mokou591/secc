<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<!-- 本页的引入和变量 -->
<c:set var="review_short" value="${135}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 展示评论列表 -->
<c:forEach items="${reviewList}" var="review" >
	<div class="review">
		<h4 class="review_header">
			<a href="${ctx}/music/review/${review.id}">
				${review.title} 
			</a>
			<c:if test="${fn:length(review.text) gt review_short}">
				<a data-toggle="collapse" href="#content${review.id}" class="showorhide">
					查看全部
				</a>
			</c:if>
		</h4>
		<a href="${ctx}/people/${review.user.id}" style='text-decoration:none;' >
			<img class="review_avatar" src="${ctx}/upload/avatar/${review.user.avatarUrl}" />
		</a>
		<span class="review_name"><a href="${ctx}/people/${review.user.id}">${review.user.nickname}</a> </span>
		<span class="review_mark"> 评分：${review.score}</span>
		<span class="review_date">
		<fmt:formatDate value="${review.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
		</span>
		<div class="review_text">
				<c:choose>
					<c:when test="${fn:length(review.text) gt review_short}">
						<pre>${fn:substring(review.text, 0, review_short)}</pre>
					</c:when>
					<c:otherwise>
						<pre>${review.text}</pre>
					</c:otherwise>
				</c:choose>
				<div class="resttext panel-collapse collapse" id="content${review.id}">
					<c:if test="${fn:length(review.text) gt review_short}">
						<pre>${fn:substring(review.text, review_short,fn:length(review.text))}</pre>
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
			<c:if test="${review.replyCount > 0}">
				<a href="${ctx}/music/review/${review.id}" class="btn btn-link">${review.replyCount}回应</a>
			</c:if>
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
		$.post("${ctx}/music/review/"+reviewId+"/"+type,
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
							resultTip='登录后才能评价哦 <a class="btn btn-default btn-xs" href="${ctx}/user/login?loginPrevPage=/music/${mainMusic.id}">登录</a>';
							break;
						default:
					}
					$("#ooxx_result"+reviewId).html(resultTip);
				});
	});
</script>