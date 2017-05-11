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
		<title>个人空间</title>
		<style type="text/css">
			#page_header {
				margin: 0 0 20px 0;
			}
			
			#avatar {
				height:160px;
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
				margin-top: 5px;
			}
			
			#rightlist li {
				font-size: 14px;
			}
			
			#profile {
				margin: 30px 30px;
				font-size: 16px;
				font-family:"微软雅黑";
			}
			
			#profile .row {
				margin: 20px 0;
			}
			
			#profile .key {
				font-weight: normal;
			}
			
			#profile .value{
				font-weight: normal;
				width: 300px;
				margin:0 0 0 30px;
				padding:0;
			}
			
			#profile pre {
				font-size: 16px;
				font-family:"微软雅黑";
				width: 300px;
				padding:0 0 0 30px;
				border:none;
				background-color:white;
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
							<img id="avatar"  class="img-rounded" src="${ctx}/upload/avatar/${zoneUser.avatarUrl}" />
							<div id="name_and_intro">
								<label id="nickname">${zoneUser.nickname }</label>
								<label id="sign"><small>${zoneUser.sign}</small></label>
							</div>
							<div id="rightcorner">
								<!-- 有登录才会有按钮 -->
								<c:if test="${not empty loginUser}">
									<c:choose>
										<c:when test="${loginUser.id eq zoneUser.id}">
											<a class="btn btn-default"  role="button" href="${ctx}/people/${loginUser.id}/edit"><span class="glyphicon glyphicon-edit"></span> 编辑我的资料</a>
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
							<li class="active">
								<a href="#panel-1" data-toggle="tab">动态</a>
							</li>
							<li>
								<a href="#panel-6" data-toggle="tab">资料</a>
							</li>

						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="panel-1">
								<p>
									还没有动态哦。
								</p>
							</div>
							<div class="tab-pane fade" id="panel-6">
								<div id="profile">
									<c:if test="${not empty zoneUser.gender}">
										<div class="row">
											<label class="col-sm-2 key">性别</label>
											<label class="value">${zoneUser.gender}</label>
										</div>
										<hr />
									</c:if>
									
									<c:if test="${not empty zoneUser.address}">
									<div class="row">
										<label class="col-sm-2 key">常居地</label>
										<label class="value">${zoneUser.address}</label>
									</div>
									<hr />
									</c:if>
									
									<c:if test="${not empty zoneUser.school}">
									<div class="row">
										<label class="col-sm-2 key">学校</label>
										<label class="value">${zoneUser.school}</label>
									</div>
									<hr />
									</c:if>
									
									<c:if test="${not empty zoneUser.academy}">
									<div class="row">
										<label class="col-sm-2 key">院系</label>
										<label class="value">${zoneUser.academy}</label>
									</div>
									<hr />
									</c:if>
									
									<c:if test="${not empty zoneUser.intro}">
									<div class="row">
										<label class="col-sm-2 key">个人简介</label>
										<span class="value"><pre>${zoneUser.intro}</pre></span>
									</div>
									<hr />
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-3 column">

				</div>
			</div>
		</div>
	</body>
</html>