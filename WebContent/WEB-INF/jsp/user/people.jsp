<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>个人空间</title>
<style type="text/css">
#page_header {
	margin: 0 0 20px 0;
}

#avatar {
	height: 160px;
	width: 160px;
	margin: 10px 0 0 10px;
}

#name_and_intro {
	display: inline-block;
	margin-left: 25px;
	font-size: 26px;
}

#nickname {
	font-weight: normal;
}

#rightcorner {
	float: right;
	margin: 140px 10px auto auto;
}

#sign {
	margin-left: 10px;
}

#lefttabnav {
	font-size: 16px;
}

.tab-header {
	margin: 5px 0;
}

#rightlist {
	margin-top: 20px;
}

#rightlist li {
	font-size: 14px;
}

#profile {
	margin: 30px 30px;
	font-size: 16px;
	font-family: "微软雅黑";
}

#profile .row {
	margin: 20px 0;
}

#profile .key {
	font-weight: normal;
}

#profile .value {
	font-weight: normal;
	width: 300px;
	margin: 0 0 0 30px;
	padding: 0;
}

#profile pre {
	font-size: 16px;
	font-family: "微软雅黑";
	width: 300px;
	padding: 0 0 0 30px;
	border: none;
	background-color: white;
}

h4{
margin-left:20px;
}
.poster_block {
	width: 120px;
	height: 200px;
}

.poster {
	margin: 10px none;
	width: 120px;
}

.film_title {
	width: 120px;
	height: 40px;
	font-size: 16px;
	text-align: center;
}

.type_btn {
	margin: 10px 0;
}

.small_poster {
	width: 100px;
	margin: 10px;
	float: none;
}

.review_summary {
	margin-bottom: 20px;
}

.review_summary * {
	font-size: 16px;
}
</style>
</head>

<body>
	<!-- 引入导航栏 -->
	<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-10 column col-md-offset-1">
				<div id="page_header" class="page-header">
					<h2>
						<img id="avatar" class="img-rounded"
							src="${ctx}/upload/avatar/${zoneUser.avatarUrl}" />
						<div id="name_and_intro">
							<label id="nickname">${zoneUser.nickname }</label> <label
								id="sign"><small>${zoneUser.sign}</small></label>
						</div>
						<div id="rightcorner">
							<!-- 有登录才会有按钮 -->
							<c:if test="${not empty loginUser}">
								<c:choose>
									<c:when test="${loginUser.id eq zoneUser.id}">
										<a class="btn btn-default" role="button"
											href="${ctx}/people/${loginUser.id}/edit"><span
											class="glyphicon glyphicon-edit"></span> 编辑我的资料</a>
									</c:when>
									<c:otherwise>
										<small>个人空间</small>
									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
					</h2>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-7 column col-md-offset-1">
				<div class="tabbable" id="lefttab">
					<ul id="lefttabnav" class="nav nav-tabs">
						<li class="active"><a href="#panel-1" data-toggle="tab">电影</a>
						</li>
						<li><a href="#panel-2" data-toggle="tab">音乐</a></li>
						<li><a href="#panel-3" data-toggle="tab">读书</a></li>
						<li><a href="#panel-4" data-toggle="tab">活动</a></li>
						<li><a href="#panel-6" data-toggle="tab">资料</a></li>

					</ul>
					<div class="tab-content">
						<c:if test="${empty filmReviewList}">
							<h4>还没有影评动态哦</h4>
						</c:if>
						<div class="tab-pane fade in active" id="panel-1">
							<!-- 电影评论 -->
							<div class="row clearfix">
								<c:forEach var="review" items="${filmReviewList}">
									<div class="col-md-12 column">
										<div class="col-md-3 column">
											<a href="${ctx}/film/${review.film.id}"> <img
												class="small_poster" src="${review.film.posterUrl}" />
											</a>
										</div>
										<div class="col-md-9 column">
											<div class="page-header">
												<h4 class="review_header">
													<a href="${ctx}/film/review/${review.id}">
														${review.title} </a> <small class="pull-right"> <fmt:formatDate
															value="${review.createTime}"
															pattern="yyyy-MM-dd HH:mm:ss" />
													</small>
												</h4>
											</div>
											${fn:substring(review.text, 0, 100)}... <a
												href="${ctx}/film/review/${review.id}">(全文)</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<div class="tab-pane fade" id="panel-2">
							<c:if test="${empty musicReviewList}">
								<h4>还没有乐评动态哦</h4>
							</c:if>
							<!-- 音乐评论 -->
							<div class="row clearfix">
								<c:forEach var="review" items="${musicReviewList}">
									<div class="col-md-12 column">
										<div class="col-md-3 column">
											<a href="${ctx}/music/${review.music.id}"> <img
												class="small_poster" src="${review.music.coverUrl}" />
											</a>
										</div>
										<div class="col-md-9 column">
											<div class="page-header">
												<h4 class="review_header">
													<a href="${ctx}/music/review/${review.id}">
														${review.title} </a> <small class="pull-right"> <fmt:formatDate
															value="${review.createTime}"
															pattern="yyyy-MM-dd HH:mm:ss" />
													</small>
												</h4>
											</div>
											${fn:substring(review.text, 0, 100)}... <a
												href="${ctx}/music/review/${review.id}">(全文)</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<div class="tab-pane fade" id="panel-3">
							<c:if test="${empty bookReviewList}">
								<h4>还没有书评动态哦</h4>
							</c:if>
							<!-- 读书评论 -->
							<div class="row clearfix">
								<c:forEach var="review" items="${bookReviewList}">
									<div class="col-md-12 column">
										<div class="col-md-3 column">
											<a href="${ctx}/book/${review.book.id}"> <img
												class="small_poster" src="${review.book.coverUrl}" />
											</a>
										</div>
										<div class="col-md-9 column">
											<div class="page-header">
												<h4 class="review_header">
													<a href="${ctx}/book/review/${review.id}">
														${review.title} </a> <small class="pull-right"> <fmt:formatDate
															value="${review.createTime}"
															pattern="yyyy-MM-dd HH:mm:ss" />
													</small>
												</h4>
											</div>
											${fn:substring(review.text, 0, 100)}... <a
												href="${ctx}/book/review/${review.id}">(全文)</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<div class="tab-pane fade" id="panel-4">
							<c:if test="${empty activityNoteList}">
								<h4>还没有活动动态哦</h4>
							</c:if>
							<!-- 活动评论随笔 -->
							<div class="row clearfix">
								<c:forEach var="note" items="${activityNoteList}">
									<div class="col-md-12 column">
										<div class="col-md-3 column">
											<a href="${ctx}/activity/${note.activity.id}"> <img
												class="small_poster" src="${note.activity.posterUrl}" />
											</a>
										</div>
										<div class="col-md-9 column">
											<div class="page-header">
												<h4 class="note_header">
													<a href="${ctx}/activity/note/${note.id}">
														${note.title} </a> <small class="pull-right"> <fmt:formatDate
															value="${note.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
													</small>
												</h4>
											</div>
											${fn:substring(note.text, 0, 100)}... <a
												href="${ctx}/activity/note/${note.id}">(全文)</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<div class="tab-pane fade" id="panel-6">
							<div id="profile">
								<c:if test="${not empty zoneUser.gender}">
									<div class="row">
										<label class="col-sm-2 key">性别</label> <label class="value">${zoneUser.gender}</label>
									</div>
									<hr />
								</c:if>

								<c:if test="${not empty zoneUser.address}">
									<div class="row">
										<label class="col-sm-2 key">常居地</label> <label class="value">${zoneUser.address}</label>
									</div>
									<hr />
								</c:if>

								<c:if test="${not empty zoneUser.school}">
									<div class="row">
										<label class="col-sm-2 key">学校</label> <label class="value">${zoneUser.school}</label>
									</div>
									<hr />
								</c:if>

								<c:if test="${not empty zoneUser.academy}">
									<div class="row">
										<label class="col-sm-2 key">院系</label> <label class="value">${zoneUser.academy}</label>
									</div>
									<hr />
								</c:if>

								<c:if test="${not empty zoneUser.intro}">
									<div class="row">
										<label class="col-sm-2 key">个人简介</label> <span class="value"><pre>${zoneUser.intro}</pre></span>
									</div>
									<hr />
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-3 column"></div>
		</div>
	</div>
</body>
</html>