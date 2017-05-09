<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="${ctx}/js/jquery.md5.js"></script>
		<title>校园课外娱乐</title>
		
	</head>

	<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
		<div class="page-header col-md-6 col-md-offset-3">
			<h1>创建账户</h1>
		</div>

		<div class="col-md-4 col-md-offset-3">
			<form id="user_reg_form" role="form" action="${ctx}/user/register_submit" method="post">
				<div class="form-group">
					<label for="nickname">昵称</label>
					<input type="text" class="form-control" id="nickname" name="nickname" autofocus="autofocus" placeholder="请输入昵称" required="required" value=${nickname }>
				</div>
				<div class="form-group">
					<label for="username">用户名</label>
					<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" required="required" value=${username }>
				</div>
				<div class="form-group">
					<label for="password">密码</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required="required">
				</div>
				<div class="form-group">
					<button id="check_btn" type="submit" class="btn btn-default">注册</button>
				</div>
				
				<c:if test="${isExist}">
					<div id="alert_exists" class="form-group alert fade in  alert-danger">
						<a class="close" data-dismiss="alert">×</a>
						用户名已存在。
					</div>
				</c:if>
				
			</form>
		</div>
	</body>

	<script type="text/javascript">
		$('#user_reg_form').submit(function() {
			//md5加密密码
			var encpsd = $.md5($('#password').val());
			$('#password').val(encpsd);
			//成功提交
			return true;
		});
	</script>

</html>