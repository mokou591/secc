<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电影</title>
</head>
<body>
	<h3>电影评论</h3>

	<c:choose>
		<c:when test="${empty loginUser}">
			<a href="${ctx }/user/login">登录</a>
			<a href="${ctx }/user/signup">注册</a>
		</c:when>
		<c:otherwise>
			<label>欢迎， ${loginUser.nickname}</label>
			<a href="${ctx }/people/${loginUser.id }">个人中心</a>
			<a href="${ctx }/user/logout">退出账号</a>
		</c:otherwise>
	</c:choose>


</body>
</html>