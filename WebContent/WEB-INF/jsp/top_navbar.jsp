<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp"%>
<div id="bar_contianer" style="margin: 0 0 45px 0;padding: 0;width: 100%;" class="container"  class="clearfix">
	<div id="nav_bar_top">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			 	<span class="sr-only">屏幕切换</span>
			 	<span class="icon-bar"></span>
			 	<span class="icon-bar"></span>
			 	<span class="icon-bar"></span>
			 </button>
			<a class="navbar-brand" href="${ctx}/">校园课外娱乐</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			
				<!-- 栏目  -->
				<ul class="nav navbar-nav">
					<li>
						<a href="#">电影</a>
					</li>
					<li>
						<a href="#">音乐</a>
					</li>
					<li>
						<a href="#">读书</a>
					</li>
					<li>
						<a href="#">线上活动</a>
					</li>
				</ul>
				
				<!-- 搜索框 -->
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" name="keyword" placeholder="搜索" />
					</div> <button type="submit" class="glyphicon glyphicon-search btn btn-default"></button>
				</form>

				<!-- 导航栏靠右项 -->
				<ul style="margin-right:10px" class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty loginUser}">
							<li><a href="${ctx}/user/login"><span class="glyphicon glyphicon-user"></span> 登录</a></li>
							<li><a href="${ctx}/user/signup"><span class="glyphicon glyphicon-log-in"></span> 注册</a></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，${loginUser.nickname}<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li>
										<a href="${ctx}/people/${loginUser.id}">个人中心</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="${ctx}/user/logout">退出账号</a>
									</li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</div>
	
</div>