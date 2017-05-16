<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>校园课外娱乐</title>
</head>
<!-- 引入导航栏 -->
<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h1>
					管理
					<small>管理员：${loginUser.nickname} (账号：${loginUser.username})</small>
				</h1>
				
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<a class="btn btn-link" href="${ctx}/admin/film">管理电影栏目</a>
					<a class="btn btn-link" href="${ctx}/admin/music">管理音乐栏目</a>
					<a class="btn btn-link" href="${ctx}/admin/book">管理读书栏目</a>
					<a class="btn btn-link" href="${ctx}/admin/activity">管理户外活动栏目</a>
				</div>
				<div class="col-md-4 column">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>