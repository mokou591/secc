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
				<h2>
					关于 
					<c:forEach items="${keywordList}" var="keyword">
						“${keyword}”
					</c:forEach>
					 的内容 
					<small>共 ${resultCount} 条记录</small>
				</h2>
			</div>
			<div class="row clearfix">
				<div class="col-md-2 column">
					<ul class="nav nav-pills nav-stacked">
						<li <c:if test="${type == 'all'}">class="active"</c:if>>
							 <a href="${ctx}/search/all?keywords=${keywords}">全部</a>
						</li>
						<li <c:if test="${type == 'film'}">class="active"</c:if>>
							 <a href="${ctx}/search/film?keywords=${keywords}">电影</a>
						</li>
						<li <c:if test="${type == 'music'}">class="active"</c:if>>
							 <a href="${ctx}/search/music?keywords=${keywords}">音乐</a>
						</li>
						<li <c:if test="${type == 'book'}">class="active"</c:if>>
							 <a href="${ctx}/search/book?keywords=${keywords}">读书</a>
						</li>
						<li <c:if test="${type == 'activity'}">class="active"</c:if>>
							 <a href="${ctx}/search/activity?keywords=${keywords}">户外活动</a>
						</li>
					</ul>
				</div>
				<div class="col-md-6 column">
					
					<c:forEach items="${resultList}" var="result">
						<c:choose>
							<c:when test="${result.type == 'film'}">
									<div class="row clearfix">
										<div class="col-md-9 column">
											[电影] 
											<a class="btn btn-link" href="${ctx}/film/${result.object.id}">
												${result.object.chsName} <c:if test="${result.object.chsName != result.object.originalName}">${result.object.originalName}</c:if>
											</a>
											<c:if test="${result.object.filmScore.count != 0}">
												<br/>
												评分：<fmt:formatNumber type="number" pattern="#.#" value="${result.object.filmScore.average}" /> (${result.object.filmScore.count}人评价)
												<br/>
											</c:if>
											<br/>
											${fn:substring(result.object.intro, 0, 100)}...<a href="${ctx}/film/${result.object.id}">(全文)</a>
										</div>
										<div class="col-md-3 column">
											<a class="btn btn-link" href="${ctx}/film/${result.object.id}">
												<img style="width:110px" src="${result.object.posterUrl}">
											</a>
										</div>
									</div>
									<hr/>
							</c:when>
							<c:when test="${result.type == 'music'}">
									<div class="row clearfix">
										<div class="col-md-9 column">
											[音乐] 
											<a class="btn btn-link" href="${ctx}/music/${result.object.id}">
												${result.object.originalName}
											</a>
											<c:if test="${result.object.musicScore.count != 0}">
												<br/>
												评分：<fmt:formatNumber type="number" pattern="#.#" value="${result.object.musicScore.average}" /> (${result.object.musicScore.count}人评价)
												<br/>
											</c:if>
											<br/>
											<c:if test="${not empty result.object.intro}">
												${fn:substring(result.object.intro, 0, 100)}...<a href="${ctx}/music/${result.object.id}">(全文)</a>
											</c:if>
										</div>
										<div class="col-md-3 column">
											<a class="btn btn-link" href="${ctx}/music/${result.object.id}">
												<img style="width:130px" src="${result.object.coverUrl}">
											</a>
										</div>
									</div>
									<hr/>
							</c:when>
							<c:when test="${result.type == 'book'}">
									<div class="row clearfix">
										<div class="col-md-9 column">
											[书本] 
											<a class="btn btn-link" href="${ctx}/book/${result.object.id}">
												${result.object.chsName} 
											</a>
											<c:if test="${result.object.bookScore.count != 0}">
												<br/>
												评分：<fmt:formatNumber type="number" pattern="#.#" value="${result.object.bookScore.average}" /> (${result.object.bookScore.count}人评价)
												<br/>
											</c:if>
											<br/>
											<c:if test="${not empty result.object.intro}">
												${fn:substring(result.object.intro, 0, 100)}...<a href="${ctx}/book/${result.object.id}">(全文)</a>
											</c:if>
										</div>
										<div class="col-md-3 column">
											<a class="btn btn-link" href="${ctx}/book/${result.object.id}">
												<img style="width:110px" src="${result.object.coverUrl}">
											</a>
										</div>
									</div>
									<hr/>
							</c:when>
							<c:when test="${result.type == 'activity'}">
									<div class="row clearfix">
										<div class="col-md-9 column">
											[户外活动] 
											<a class="btn btn-link" href="${ctx}/activity/${result.object.id}">
												${result.object.title} 
											</a>
											<c:if test="${result.object.noteCount != 0}">
												<br/>
												(${result.object.noteCount}人讨论)
												<br/>
											</c:if>
											<br/>
											<c:if test="${not empty result.object.info}">
												${fn:substring(result.object.info, 0, 100)}...<a href="${ctx}/activity/${result.object.id}">(全文)</a>
											</c:if>
										</div>
										<div class="col-md-3 column">
											<a class="btn btn-link" href="${ctx}/activity/${result.object.id}">
												<img style="width:110px" src="${result.object.posterUrl}">
											</a>
										</div>
									</div>
									<hr/>
							</c:when>
							
						</c:choose>
					</c:forEach>
				
				
				</div>
				<div class="col-md-4 column">
					<div class="page-header">
						<h4>
							还没有这个条目，我来添加
						</h4>
					</div>
					<a class="btn btn-link" href="${ctx}/film/new"> &gt; 添加条目 电影 </a><br/>
					<a class="btn btn-link" href="${ctx}/music/new"> &gt; 添加条目 音乐 </a><br/>
					<a class="btn btn-link" href="${ctx}/book/new"> &gt; 添加条目 读书 </a><br/>
					<a class="btn btn-link" href="${ctx}/activity/new"> &gt; 发起 户外活动</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>