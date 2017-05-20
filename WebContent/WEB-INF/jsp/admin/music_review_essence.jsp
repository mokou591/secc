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
					乐评精品帖一览
					<a class="btn btn-default pull-right" href="${ctx}/admin/">回到管理人员主页</a>
				</h1>
			</div>
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							标题
						</th>
						<th>
							发布者
						</th>
						<th>
							发布时间
						</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${reviewList}" var="review" varStatus="status">
					<tr>
						<td>
							${status.count}
						</td>
						<td>
							<a href="${ctx}/music/review/${review.id}">
								${review.title}
							</a>
						</td>
						<td>
							<a href="${ctx}/people/${review.user.id}">
								${review.user.nickname}
							</a>
						</td>
						<td>
							<fmt:formatDate value="${review.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
						</td>
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>