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
		<script type="text/javascript" src="${ctx}/js/jquery.md5.js"></script>
		<title>校园课外娱乐</title>
	</head>

	<body>
		<div class="page-header col-md-6 col-md-offset-3">
			<h1>登录账户</h1>
		</div>

		<div class="col-md-4 col-md-offset-3">
			<form id="user_login_form" role="form" action="${ctx}/user/login_submit" method="post">
				<div class="form-group">
					<label for="username">用户名</label>
					<input type="text" class="form-control" id="username" name="username" autofocus="autofocus" placeholder="请输入用户名" required="required"  value=${username }>
				</div>
				<div class="form-group">
					<label for="password">密码</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required="required">
				</div>
				<div class="form-group">
					<button id="check_btn" type="button" class="btn btn-default">登录</button>
				</div>
				
				<c:if test="${isloginFailed}">
					<div id="alert_exists" class="form-group alert fade in  alert-danger">
						<a class="close" data-dismiss="alert">×</a>
						　用户名或密码不正确。
					</div>
				</c:if>
				
			</form>
		</div>
	</body>

	<script type="text/javascript">
		$('#check_btn').click(function() {
			//check

			//md5加密密码
			var encpsd = $.md5($('#password').val());
			$('#password').val(encpsd);

			//submit
			$('#user_login_form').submit();
		});
	</script>

</html>