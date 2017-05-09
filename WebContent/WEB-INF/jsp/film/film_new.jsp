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
		<title>电影</title>
		<style type="text/css">
			textarea {
				resize: none;
			}
			
			.redpoint {
				color: red;
			}
		</style>
	</head>

	<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
	
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="row clearfix">
						<div class="col-md-8 column col-sm-offset-1">
							<div class="page-header">
								<h2>添加电影 <small>提交新的电影条目</small></h2>
							</div>
							<form class="form-horizontal" role="form" action="${ctx }/film/submit" method="post" >

								<div class="form-group">
									<label for="original_name" class="col-sm-2 control-label">原名<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="original_name" name="originalName" required="required" />
									</div>
								</div>
								<div class="form-group">
									<label for="region" class="col-sm-2 control-label">制片国家/地区<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="region" name="region" required="required"  />
									</div>
								</div>
								<div class="form-group">
									<label for="year" class="col-sm-2 control-label">年份<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="number" class="form-control" id="year" name="year"  required="required" />
									</div>
								</div>
								<div class="form-group">
									<label for="chs_name" class="col-sm-2 control-label">简体中文名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="chs_name" name="chsName" />
									</div>
								</div>
								<div class="form-group">
									<label for="poster_url" class="col-sm-2 control-label">海报图片网址</label>
									<div class="col-sm-6">
										<input type="url" class="form-control" id="poster_url" name="posterUrl" />
									</div>
								</div>
								<div class="form-group">
									<label for="imdbnum" class="col-sm-2 control-label">IMDb编号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="imdbnum" name="imdbnum" />
									</div>
								</div>
								<div class="form-group">
									<label for="director" class="col-sm-2 control-label">导演</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="director" name="director" />
									</div>
								</div>
								<div class="form-group">
									<label for="writer" class="col-sm-2 control-label">编剧</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="writer" name="writer" />
									</div>
								</div>
								<div class="form-group">
									<label for="actor" class="col-sm-2 control-label">主演</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="actor" name="actor" />
									</div>
								</div>
								<div class="form-group">
									<label for="language" class="col-sm-2 control-label">语言</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="language" name="language" />
									</div>
								</div>
								<div class="form-group">
									<label for="length" class="col-sm-2 control-label">片长(分钟)</label>
									<div class="col-sm-6">
										<input type="number" class="form-control" id="length" name="length" />
									</div>
								</div>
								<div class="form-group">
									<label for="genre" class="col-sm-2 control-label">类型</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="genre" name="genre" />
									</div>
								</div>
								<div class="form-group">
									<label for="intro" class="col-sm-2 control-label">剧情简介</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="6" id="intro" name="intro"></textarea>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-default">提交</button>
									</div>
								</div>
							</form>
						</div>
						<div class="col-md-4 column">
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>