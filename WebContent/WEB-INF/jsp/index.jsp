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

	.music_poster {
		margin:10px none;
		width: 130px;
	}
	
	.music_poster_block{
		width: 140px;
		height: 145px;
	}

	.poster {
		margin:10px none;
		width: 140px;
	}
	
	.column_title {
		width: 130px;
		height:40px;
		margin: 10px auto;
		font-size: 16px;
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
	.review_summary{
		margin-bottom:20px;
	}
	.review_summary *{
		font-size:16px;
	}
</style>
</head>
<!-- 引入导航栏 -->
<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-8 column">
				<h1>
					新品速递 <small>热门</small>
				</h1>
			
			<div class="page-header">
				<h3>
					电影
				</h3>
			</div>
			<!-- 展示热门电影 -->
				<div class="row clearfix">
					<c:forEach items="${hotFilmList}" var="film">
						<div class="col-md-3 column">
							<a href="${ctx}/film/${film.id}">
							<div class="poster_block center-block">
								<img class="poster" src="${film.posterUrl}" />
							</div>
								<label class="column_title center-block">${film.chsName}</label>
							</a>
						</div>
					</c:forEach>
				</div>
			
			<div class="page-header">
				<h3>
					读书
				</h3>
			</div>
			<!-- 展示热门书 -->
				<div class="row clearfix">
					<c:forEach items="${hotBookList}" var="book">
						<div class="col-md-3 column">
							<a href="${ctx}/book/${book.id}">
							<div class="poster_block center-block">
								<img class="poster" src="${book.coverUrl}" />
							</div>
							<label class="column_title center-block">${book.chsName}<br/><small>${book.author}</small></label>
							</a>
						</div>
					</c:forEach>
				</div>
				
				
			<div class="page-header">
				<h3>
					音乐
				</h3>
			</div>
			<!-- 展示新品音乐 -->
				<div class="row clearfix">
					<c:forEach items="${hotMusicList}" var="music">
						<div class="col-md-3 column">
							<a href="${ctx}/music/${music.id}">
							<div class="music_poster_block center-block">
								<img class="music_poster" src="${music.coverUrl}" />
							</div>
							<label class="column_title center-block">${music.originalName}</label>
							</a>
						</div>
					</c:forEach>
				</div>
			
			
		</div>
		<div class="col-md-4 column">
			<div class="page-header">
				<h3>
					关注我们
				</h3>
			</div>
		</div>
	</div>
</div>
</body>
</html>