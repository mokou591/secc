<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${ctx}/css/activity_show.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>讨论 · 随笔</title>
</head>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h2>
					${note.title}
				</h2>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<a href="${ctx}/people/${note.user.id}" style='text-decoration:none;' >
						<img class="note_avatar" src="${ctx}/upload/avatar/${note.user.avatarUrl}" />
					</a>
					<span class="note_name"><a href="${ctx}/people/${note.user.id}">${note.user.nickname}</a> </span>
					<span class="note_date pull-right">
						<fmt:formatDate value="${note.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
					</span>
					
					<div class="note_text">
						<pre>${note.text}</pre>
					</div>
					
				</div>
				<div class="col-md-4 column">
					<div class="page-header">
						<a href="${ctx}/activity/${note.activity.id}/note_new" class="btn btn-primary">我要写讨论/随笔</a>
					</div>
					<div class="page-header">
						<h4>
							<a id="to_activity" href="${ctx }/activity/${note.activity.id}"> &gt; 转到 ${note.activity.title} </a>
						</h4>
					</div>
					<a href="${ctx }/activity/${note.activity.id}">
						<img id="poster" src="${note.activity.posterUrl}" /> 
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>