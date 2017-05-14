<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/music_show.css" />
<title>${mainMusic.originalName}</title>
</head>
	<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
						<c:choose>
							<c:when test="${empty mainMusic.chsName}">
								${mainMusic.originalName}
							</c:when>
							<c:otherwise>
								${mainMusic.chsName}
							</c:otherwise>
						</c:choose>
						</h1>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<div class="row clearfix">
						<div class="col-md-4 column">
							<img id="poster" src="${mainMusic.coverUrl }" />
						</div>
						<div class="col-md-8 column">
							<dl id="profile">
							
								<c:if test="${not empty mainMusic.originalName and mainMusic.originalName != mainMusic.chsName }">
									<dt>
									原名
									</dt>
									<dd>
										${mainMusic.originalName }
									</dd>
								</c:if>
								
								<c:if test="${not empty mainMusic.artist }">
									<dt>
									艺术家
									</dt>
									<dd>
										${mainMusic.artist }
									</dd>
								</c:if>
								
								<c:if test="${not empty mainMusic.press }">
									<dt>
									出版社
									</dt>
									<dd>
										${mainMusic.press }
									</dd>
								</c:if>

								<c:if test="${not empty mainMusic.year }">
									<dt>
									发行时间
									</dt>
									<dd>
										${mainMusic.year }
									</dd>
								</c:if>
								
								<c:if test="${not empty mainMusic.genre }">
									<dt>
									类型
									</dt>
									<dd>
										${mainMusic.genre }
									</dd>
								</c:if>

								<c:if test="${not empty mainMusic.barcode }">
									<dt>
									条形码
									</dt>
									<dd>
										${mainMusic.barcode }
									</dd>
								</c:if>
								
							</dl>
						</div>
					</div>
					<h3>
						简介 · · · · · ·
					</h3>
					<pre>${mainMusic.intro }</pre>
					
					<c:if test="${not empty mainMusic.catalog }">
						<h3 class="part_header">
							曲目 · · · · · ·
						</h3>
						<pre>${mainMusic.catalog}</pre>
					</c:if>
					
					<h3 class="part_header">
					${mainMusic.chsName }的音乐评论 · · · · · ·
					</h3>
					
					<!-- 展示评论列表 -->
					<jsp:include page="/WEB-INF/jsp/component/music_review_list.jsp" />
					
					<!-- 查看全部音乐评论按钮 -->
					<div class="toallreview">
						<a href="${ctx}/music/${mainMusic.id}/review/latest/1"> &gt; 查看所有音乐评论（全部${reviewListLength}条）</a>
					</div>
				</div>

				<div class="col-md-4 column">
					<div class="page-header">
						<c:choose>
							<c:when test="${mainScore.count eq 0}">
								<h2>该音乐暂无评价 </h2>
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
								<a href="${ctx}/user/login?loginPrevPage=/music/${mainMusic.id}/review_new" class="btn btn-primary">我要评价</a>
							</c:when>
							<c:otherwise>
								<a href="${ctx}/music/${mainMusic.id}/review_new" class="btn btn-primary">我要评价</a>
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