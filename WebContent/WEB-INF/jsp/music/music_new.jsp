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
		<title>音乐</title>
		<style type="text/css">
			textarea {
				resize: none;
			}
			
			.redpoint {
				margin:0 5px;
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
						<div class="col-md-8 column">
							<div class="page-header">
								<h2>添加音乐 <small>提交新的音乐条目</small></h2>
							</div>
							<form class="form-horizontal" role="form" action="${ctx }/music/submit" method="post" >

								<div class="form-group">
									<label for="original_name" class="col-sm-3 control-label">原名<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="original_name" name="originalName" required="required" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="chs_name" class="col-sm-3 control-label">简体中文名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="chs_name" name="chsName" />
									</div>
								</div>
								<div class="form-group">
									<label for="cover_url" class="col-sm-3 control-label">封面图片网址<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="url" class="form-control" id="cover_url" name="coverUrl" />
									</div>
								</div>
								<div class="form-group">
									<label for="artist" class="col-sm-3 control-label">艺人<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="artist" name="artist" required="required"  />
									</div>
								</div>
								
								<div class="form-group">
									<label for="genre" class="col-sm-3 control-label">流派/曲风/类型<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="genre" name="genre" />
									</div>
								</div>
								<div class="form-group">
									<label for="year" class="col-sm-3 control-label">发行时间<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="year" name="year"  required="required" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="barcode" class="col-sm-3 control-label">条形码</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="barcode" name="barcode" />
									</div>
								</div>
								<div class="form-group">
									<label for="press" class="col-sm-3 control-label">出版社</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="press" name="press" />
									</div>
								</div>

								<div class="form-group">
									<label for="intro" class="col-sm-3 control-label">简介</label>
									<div class="col-sm-9">
										<textarea class="form-control" rows="10" id="intro" name="intro"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="catalog" class="col-sm-3 control-label">曲目</label>
									<div class="col-sm-6">
										<textarea class="form-control" rows="15" id="catalog" name="catalog"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-10">
										<button type="submit" class="btn btn-primary">提交</button>
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