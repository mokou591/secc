<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/film_show.css" />
<title>${mainFilm.chsName}</title>
</head>
	<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
							${mainFilm.chsName} 
							<c:if test="${mainFilm.chsName != mainFilm.originalName}">
								${mainFilm.originalName}
							</c:if>
							 <small> (${mainFilm.year })</small>
						</h1>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<div class="row clearfix">
						<div class="col-md-3 column">
							<img id="poster" src="${mainFilm.posterUrl }" />
						</div>
						<div class="col-md-9 column">
							<dl id="profile">
								
								<c:if test="${not empty mainFilm.director }">
									<dt>
									导演
									</dt>
									<dd>
										${mainFilm.director }
									</dd>
								</c:if>
								
								<c:if test="${not empty mainFilm.writer }">
									<dt>
									编剧
									</dt>
									<dd>
										${mainFilm.writer }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.actor }">
									<dt>
									主演
									</dt>
									<dd>
										${mainFilm.actor }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.genre }">
									<dt>
									类型
									</dt>
									<dd>
										${mainFilm.genre }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.region }">
									<dt>
									制片国家/地区
									</dt>
									<dd>
										${mainFilm.region }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.language }">
									<dt>
									语言
									</dt>
									<dd>
										${mainFilm.language }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.length }">
									<dt>
									片长
									</dt>
									<dd>
										${mainFilm.length }分钟
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.imdbnum }">
									<dt>
									IMDb链接
									</dt>
									<dd>
										<a href="http://www.imdb.com/title/${mainFilm.imdbnum}">
											${mainFilm.imdbnum }
										</a>
									</dd>
								</c:if>
								
							</dl>
						</div>
					</div>
					<h3>
						${mainFilm.chsName }的剧情简介 · · · · · ·
					</h3>
					<pre>
						${mainFilm.intro }
					</pre>
					<h3 class="part_header">
					${mainFilm.chsName }的影评 · · · · · ·
					</h3>
					
					<!-- 展示评论列表 -->
					<jsp:include page="/WEB-INF/jsp/component/film_review_list.jsp" />
					
					<!-- 查看全部影评按钮 -->
					<div class="toallreview">
						<a href="${ctx}/film/${mainFilm.id}/review/latest/1"> &gt; 查看影片所有影评（全部${reviewListLength}条）</a>
					</div>
				</div>

				<div class="col-md-4 column">
					<div class="page-header">
						<c:choose>
							<c:when test="${mainScore.count eq 0}">
								<h2>该电影暂无评价 </h2>
							</c:when>
							<c:otherwise>
								<h2>评分：
								<fmt:formatNumber type="number" pattern="#.#" value="${mainScore.average}" />
								 </h2>
								<h3><small>${mainScore.count}人评价</small></h3>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${empty loginUser}">
								<a href="${ctx}/user/login?loginPrevPage=/film/${mainFilm.id}/review_new" class="btn btn-primary">我要评价</a>
							</c:when>
							<c:otherwise>
								<a href="${ctx}/film/${mainFilm.id}/review_new" class="btn btn-primary">我要评价</a>
							</c:otherwise>
						</c:choose>
						
						
						<c:if test="${not empty loginUserScore }">
							<h4>您的评价：${loginUserScore }</h4>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>