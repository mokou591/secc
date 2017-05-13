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
		<title>书</title>
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
						<div class="col-md-8 column col-sm-offset-1">
							<div class="page-header">
								<h2>添加书 <small>提交新的书条目</small></h2>
							</div>
							<form class="form-horizontal" role="form" action="${ctx }/book/submit" method="post" >

								<div class="form-group">
									<label for="chs_name" class="col-sm-2 control-label">简体中文名<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="chs_name" name="chsName" />
									</div>
								</div>
								<div class="form-group">
									<label for="original_name" class="col-sm-2 control-label">原作名<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="original_name" name="originalName" required="required" />
									</div>
								</div>
								<div class="form-group">
									<label for="author" class="col-sm-2 control-label">作者<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="author" name="author" required="required"  />
									</div>
								</div>
								<div class="form-group">
									<label for="translator" class="col-sm-2 control-label">译者</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="translator" name="translator" />
									</div>
								</div>
								<div class="form-group">
									<label for="genre" class="col-sm-2 control-label">类型 / 标签<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="genre" name="genre" />
									</div>
								</div>
								<div class="form-group">
									<label for="year" class="col-sm-2 control-label">出版年<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="year" name="year"  required="required" />
									</div>
								</div>
								<div class="form-group">
									<label for="cover_url" class="col-sm-2 control-label">封面图片网址<span class="redpoint">*</span></label>
									<div class="col-sm-6">
										<input type="url" class="form-control" id="cover_url" name="coverUrl" />
									</div>
								</div>
								<div class="form-group">
									<label for="isbn" class="col-sm-2 control-label">ISBN</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="isbn" name="isbn" />
									</div>
								</div>
								<div class="form-group">
									<label for="press" class="col-sm-2 control-label">出版社</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="press" name="press" />
									</div>
								</div>
								<div class="form-group">
									<label for="page" class="col-sm-2 control-label">页数</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="page" name="page" />
									</div>
								</div>
								<div class="form-group">
									<label for="price" class="col-sm-2 control-label">定价</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="price" name="price" />
									</div>
								</div>
								<div class="form-group">
									<label for="intro" class="col-sm-2 control-label">内容简介</label>
									<div class="col-sm-10">
										<textarea class="form-control" rows="15" id="intro" name="intro"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="intro" class="col-sm-2 control-label">目录</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="20" id="catalog" name="catalog"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
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