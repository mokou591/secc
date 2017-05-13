<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/activity_show.css" />
<title>${mainActivity.title}</title>
</head>
	<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
							${mainActivity.title} 
						</h1>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<div class="row clearfix">
						<div class="col-md-4 column">
							<img id="poster" src="${mainActivity.posterUrl }" />
						</div>
						<div class="col-md-8 column">
							<dl id="profile">
								
								<c:if test="${not empty mainActivity.time }">
									<dt>
									时间
									</dt>
									<dd>
										${mainActivity.time }
									</dd>
								</c:if>
								
								<c:if test="${not empty mainActivity.place }">
									<dt>
									地点
									</dt>
									<dd>
										${mainActivity.place }
									</dd>
								</c:if>

								<c:if test="${not empty mainActivity.cost }">
									<dt>
									花费
									</dt>
									<dd>
										${mainActivity.cost }
									</dd>
								</c:if>

								<c:if test="${not empty mainActivity.genre }">
									<dt>
									类型
									</dt>
									<dd>
										${mainActivity.genre }
									</dd>
								</c:if>


								<c:if test="${not empty mainActivity.contact }">
									<dt>
									联系
									</dt>
									<dd>
										${mainActivity.contact }
									</dd>
								</c:if>
								
								<hr/>
								
								<!-- 报名参与 -->
								<c:choose>
									<c:when test="${hasPartake}">
										<label>已报名参与此活动。</label>
										<a href="${ctx}/activity/${mainActivity.id}/partake_cancel" class="btn btn-warning">取消报名</a>
									</c:when>
									<c:otherwise>
										<a href="${ctx}/activity/${mainActivity.id}/partake" class="btn btn-primary">报名参与</a>
									</c:otherwise>
								</c:choose>
							</dl>
						</div>
					</div>
					<h3>
						活动介绍 · · · · · ·
					</h3>
					<pre>${mainActivity.info }</pre>
					<h3 class="part_header">
					活动 · 讨论 · 随笔
					</h3>
					
					<!-- 展示讨论列表 -->
					<jsp:include page="/WEB-INF/jsp/component/activity_note_list.jsp" />
					
					<!-- 查看全部活动讨论按钮 -->
					<div class="toallnote">
						<a href="${ctx}/activity/${mainActivity.id}/note/all/1"> &gt; 查看所有（全部${noteListLength}条）</a>
					</div>
				</div>

				<div class="col-md-4 column">
					<div class="page-header">
						<c:choose>
							<c:when test="${empty loginUser}">
								<a href="${ctx}/user/login?loginPrevPage=/activity/${mainActivity.id}/note_new" class="btn btn-primary">发起讨论 / 写随笔</a>
							</c:when>
							<c:otherwise>
								<a href="${ctx}/activity/${mainActivity.id}/note_new" class="btn btn-primary">发起讨论 / 写随笔</a>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="page-header">
						<h4>
							<c:choose>
								<c:when test="${partakeCount eq 0}">
									目前还没有人报名参与。
								</c:when>
								<c:otherwise>
									已有${partakeCount}人报名参与。
								</c:otherwise>
							</c:choose>
						</h4>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>