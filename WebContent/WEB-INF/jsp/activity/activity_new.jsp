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
<title>户外活动·创建</title>
<style type="text/css">
	.redpoint {
		margin:auto 5px;
		color: red;
	}
</style>
</head>
<!-- 引入导航栏 -->
<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
					发起活动 <small>创建户外活动</small>
				</h1>
					</div>
					<div class="row clearfix">
						<div class="col-md-8 column">
							<form action="${ctx}/activity/submit" method="post"  class="form-horizontal" role="form">
								<div class="form-group">
									<label for="title" class="col-sm-2 control-label" >标题<span class="redpoint">*</span></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="title" name="title" required="required"/>
									</div>
								</div>
								<div class="form-group">
									<label for="posterUrl" class="col-sm-2 control-label" >海报图片网址<span class="redpoint">*</span></label>
									<div class="col-sm-8">
										<input type="url" class="form-control" id="posterUrl" name="posterUrl" placeholder="http://" required="required"/>
									</div>
								</div>
								<div class="form-group">
									<label for="time" class="col-sm-2 control-label" >时间<span class="redpoint">*</span></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="time" name="time" required="required"/>
									</div>
								</div>
								<div class="form-group">
									<label for="place" class="col-sm-2 control-label" >地点<span class="redpoint">*</span></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="place" name="place" required="required"/>
									</div>
								</div>
								<div class="form-group">
									<label for="cost" class="col-sm-2 control-label" >费用<span class="redpoint">*</span></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="cost" name="cost"  required="required"/>
									</div>
								</div>
								<div class="form-group">
									<label for="genre" class="col-sm-2 control-label" >类型<span class="redpoint">*</span></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="genre" name="genre" required="required"/>
									</div>
								</div>
								<div class="form-group">
									<label for="contact" class="col-sm-2 control-label" >联系方式</label>
									<div class="col-sm-8">
										<input class="form-control" id="contact" name="contact"/>
									</div>
								</div>
								<div class="form-group">
									<label for="info" class="col-sm-2 control-label" >活动介绍</label>
									<div class="col-sm-8">
										<textarea placeholder="主题、内容、注意事项等" style="resize: none;" rows="15" class="form-control" id="info" name="info"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-primary">确定</button>
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