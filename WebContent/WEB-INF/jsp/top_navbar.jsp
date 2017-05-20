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
					<li id="film_link">
						<a  href="${ctx}/film">电影</a>
					</li>
					<li id="music_link">
						<a href="${ctx}/music">音乐</a>
					</li>
					<li id="book_link">
						<a href="${ctx}/book">读书</a>
					</li>
					<li id="activity_link">
						<a href="${ctx}/activity">户外活动</a>
					</li>
				</ul>
				
				<!-- 搜索框 -->
				<form action="${ctx}/search/all/" method="get" class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input id="keywords" type="text" class="form-control" name="keywords" placeholder="搜索" value="${keywords}" />
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
							<c:if test="${not empty userAuthority}">
								<li><a href="${ctx}/admin">管理</a></li>
							</c:if>
							
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，${loginUser.nickname}<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li>
										<a href="${ctx}/people/${loginUser.id}">个人中心</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="#" id="logout_btn">退出账号</a>
									</li>
								</ul>
								
								<!-- 退出账号按钮，ajax -->
								<script type="text/javascript">
									$('#logout_btn').click(function(){
										$.post("${ctx}/user/logout",
												{},
												function(result){
													location.reload();
												});
									});
								</script>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</div>
	
</div>