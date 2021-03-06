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
				width: 140px;
				height: 210px;
			}
		
			.poster {
				margin:10px none;
				width: 140px;
			}
			
			.book_title {
				width: 140px;
				height:60px;
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
	<script type="text/javascript">
		$('#book_link').addClass("active");
	</script>
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
					读书
				</h1>
					</div>
					<div class="row clearfix">
						<div class="col-md-8 column">
							<div class="page-header">
								<h3>
							新书速递
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
											<label class="book_title center-block">${book.chsName}<br/><small>${book.author}</small></label>
											</a>
										</div>
								</c:forEach>
							</div>

							<div class="page-header">
								<h3>
							选书
						</h3>
							</div>
								
							<!-- 选书  -->
							<button class="btn btn-link btn-lg type_btn">随机</button>
							<button class="btn btn-link btn-lg type_btn">名著</button>
							<button class="btn btn-link btn-lg type_btn">小说</button>
							<button class="btn btn-link btn-lg type_btn">言情</button>
							<button class="btn btn-link btn-lg type_btn">传记</button>
							<button class="btn btn-link btn-lg type_btn">科幻</button>
							<button class="btn btn-link btn-lg type_btn">悬疑</button>
							<button class="btn btn-link btn-lg type_btn">设计</button>
							<button class="btn btn-link btn-lg type_btn">历史</button>
							<button class="btn btn-link btn-lg type_btn">青春</button>
							<button class="btn btn-link btn-lg type_btn">古典</button>
							<button class="btn btn-link btn-lg type_btn">文艺</button>
							<!-- ajax -->
							<script type="text/javascript">
								//一开始显示随机的
								$.post("${ctx}/book/genre/随机",{},function(result){
									$('#choose_result').html(result);
								});
								//给按钮添加类型查询事件
								$('.type_btn').click(function(){
									var genre = $(this).html();//获得查询的类型
									$('#choose_result').html("正在查询："+genre);
									$.post("${ctx}/book/genre/"+genre,{},function(result){
										$('#choose_result').html(result);
									});
								});
							</script>
							
							<!-- 结果展示，默认随机-->
							<div id="choose_result" class="row clearfix">
							</div>
							
							<div class="page-header">
								<h3>
									热门影评
								</h3>
							</div>
							
							<!-- 展示热门影评
							其实是随机 -->
							<div class="row clearfix">
								<c:forEach var="review" items="${hotReviewDetailList}" >
								<div class="col-md-12 column">
									<div class="col-md-2 column">
										<a href="${ctx}/book/${review.book.id}">
											<img class="small_poster" src="${review.book.coverUrl}" />
										</a>
									</div>
									<div class="col-md-10 column">
										<div class="page-header">
											<h4 class="review_header">
												<a href="${ctx}/book/review/${review.id}">
													${review.title} 
												</a>
												<small> 
													<a href="${ctx}/people/${review.user.id}">
														${review.user.nickname}
													</a>
												</small>
												<small class="pull-right">
													<fmt:formatDate value="${review.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
												</small>
											</h4>
										</div>
											${fn:substring(review.text, 0, 120)}...
											<a href="${ctx}/book/review/${review.id}">(全文)</a>
									</div>
								</div>
								</c:forEach>
							</div>
							
						</div>
						<div class="col-md-4 column">
							<div class="page-header">
								<a href="${ctx}/book/new" class="btn btn-default">创建新的书条目</a>
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