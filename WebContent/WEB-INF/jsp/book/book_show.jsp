<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/book_show.css" />
<title>${mainBook.chsName}</title>
</head>
	<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
							${mainBook.chsName}
						</h1>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<div class="row clearfix">
						<div class="col-md-4 column">
							<img id="poster" src="${mainBook.coverUrl }" />
						</div>
						<div class="col-md-8 column">
							<dl id="profile">
								
								<c:if test="${not empty mainBook.author }">
									<dt>
									作者
									</dt>
									<dd>
										${mainBook.author }
									</dd>
								</c:if>
								
								<c:if test="${not empty mainBook.press }">
									<dt>
									出版社
									</dt>
									<dd>
										${mainBook.press }
									</dd>
								</c:if>

								<c:if test="${not empty mainBook.originalName and mainBook.originalName != mainBook.chsName }">
									<dt>
									原作名
									</dt>
									<dd>
										${mainBook.originalName }
									</dd>
								</c:if>

								<c:if test="${not empty mainBook.translator }">
									<dt>
									译者
									</dt>
									<dd>
										${mainBook.translator }
									</dd>
								</c:if>

								<c:if test="${not empty mainBook.year }">
									<dt>
									出版年
									</dt>
									<dd>
										${mainBook.year }
									</dd>
								</c:if>

								<c:if test="${not empty mainBook.page }">
									<dt>
									页数
									</dt>
									<dd>
										${mainBook.page }
									</dd>
								</c:if>

								<c:if test="${not empty mainBook.price }">
									<dt>
									定价
									</dt>
									<dd>
										${mainBook.price }
									</dd>
								</c:if>
								
								<c:if test="${not empty mainBook.genre }">
									<dt>
									类型
									</dt>
									<dd>
										${mainBook.genre }
									</dd>
								</c:if>

								<c:if test="${not empty mainBook.isbn }">
									<dt>
									ISBN
									</dt>
									<dd>
										${mainBook.isbn }
									</dd>
								</c:if>
								
							</dl>
						</div>
					</div>
					<h3>
						内容简介 · · · · · ·
					</h3>
					<pre>${mainBook.intro }</pre>
					
					<c:if test="${not empty mainBook.catalog }">
						<h3 class="part_header">
							目录 · · · · · ·
						</h3>
						<pre>${mainBook.catalog}</pre>
					</c:if>
					
					<h3 class="part_header">
					${mainBook.chsName }的书评 · · · · · ·
					</h3>
					
					<!-- 展示评论列表 -->
					<jsp:include page="/WEB-INF/jsp/component/book_review_list.jsp" />
					
					<!-- 查看全部书评按钮 -->
					<div class="toallreview">
						<a href="${ctx}/book/${mainBook.id}/review/latest/1"> &gt; 查看所有书评（全部${reviewListLength}条）</a>
					</div>
				</div>

				<div class="col-md-4 column">
					<div class="page-header">
						<c:choose>
							<c:when test="${mainScore.count eq 0}">
								<h2>该书暂无评价 </h2>
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
								<a href="${ctx}/user/login?loginPrevPage=/book/${mainBook.id}/review_new" class="btn btn-primary">我要评价</a>
							</c:when>
							<c:otherwise>
								<a href="${ctx}/book/${mainBook.id}/review_new" class="btn btn-primary">我要评价</a>
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