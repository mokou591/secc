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

		<style type="text/css">
			.poster_block{
				width: 130px;
				height: 200px;
			}
		
			.poster {
				margin:10px none;
				width: 130px;
			}
			
			.activity_title {
				width: 130px;
				height:40px;
				margin: 10px auto;
				font-size: 14px;
				text-align: center;
			}
			.type_btn{
				margin:10px 0;
			}
			.small_poster{
				width: 100px;
				margin:10px;
				float:none;
			}
			.note_summary{
				margin-bottom:20px;
			}
			.note_summary *{
				font-size:16px;
			}
		</style>

	</head>
	<!-- 引入导航栏 -->
	<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
	<script type="text/javascript">
		$('#activity_link').addClass("active");
	</script>
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
					户外活动
				</h1>
					</div>
					<div class="row clearfix">
						<div class="col-md-8 column">
							<div class="page-header">
								<h3>
									热门活动
								</h3>
							</div>
							<!-- 展示热门户外活动 -->
							<div class="row clearfix">
								<c:forEach items="${hotActivityList}" var="activity">
										<div class="col-md-3 column">
											<a href="${ctx}/activity/${activity.id}">
											<div class="poster_block center-block">
												<img class="poster" src="${activity.posterUrl}" />
											</div>
												<label class="activity_title center-block">${activity.title}</label>
											</a>
										</div>
								</c:forEach>
							</div>

							<div class="page-header">
								<h4>
									音乐
									<small class="pull-right"><a href="#">更多 》</a></small>
								</h4>
							</div>
							<div class="row clearfix">
								<c:forEach items="${musicList}" var="activity">
										<div class="col-md-3 column">
											<a href="${ctx}/activity/${activity.id}">
											<div class="poster_block center-block">
												<img class="poster" src="${activity.posterUrl}" />
											</div>
												<label class="activity_title center-block">${activity.title}</label>
											</a>
										</div>
								</c:forEach>
							</div>
							
							<div class="page-header">
								<h4>
									聚会
									<small class="pull-right"><a href="#">更多 》</a></small>
								</h4>
							</div>
							<div class="row clearfix">
								<c:forEach items="${partyList}" var="activity">
										<div class="col-md-3 column">
											<a href="${ctx}/activity/${activity.id}">
											<div class="poster_block center-block">
												<img class="poster" src="${activity.posterUrl}" />
											</div>
												<label class="activity_title center-block">${activity.title}</label>
											</a>
										</div>
								</c:forEach>
							</div>
							
							
							<div class="page-header">
								<h4>
									讲座
									<small class="pull-right"><a href="#">更多 》</a></small>
								</h4>
							</div>
							<div class="row clearfix">
								<c:forEach items="${lectureList}" var="activity">
										<div class="col-md-3 column">
											<a href="${ctx}/activity/${activity.id}">
											<div class="poster_block center-block">
												<img class="poster" src="${activity.posterUrl}" />
											</div>
												<label class="activity_title center-block">${activity.title}</label>
											</a>
										</div>
								</c:forEach>
							</div>
							
							
							<div class="page-header">
								<h4>
									展览
									<small class="pull-right"><a href="#">更多 》</a></small>
								</h4>
							</div>
							<div class="row clearfix">
								<c:forEach items="${exhiList}" var="activity">
										<div class="col-md-3 column">
											<a href="${ctx}/activity/${activity.id}">
											<div class="poster_block center-block">
												<img class="poster" src="${activity.posterUrl}" />
											</div>
												<label class="activity_title center-block">${activity.title}</label>
											</a>
										</div>
								</c:forEach>
							</div>
							
							
						</div>
						<div class="col-md-4 column">
							<div class="page-header">
								<a href="${ctx}/activity/new" class="btn btn-default">创建新的户外活动条目</a>
							</div>
							<div class="page-header">
								<h3>
									关注我们
								</h3>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>