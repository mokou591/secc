<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>活动讨论</title>
		<style type="text/css">
			*{
				font-size: 16px;
			}
			textarea{
				resize: none;
				text-indent:2em;
			}
			label{
				font-weight:normal;
			}
			input[type="radio"]{
				margin: 10px;
			}
			.red{
				color: red;
			}
			#to_activity{
				font-size: 18px;
			}
			#poster{
				width: 200px;
			}
		</style>
</head>
<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
<div class="container">
	<div class="row clearfix">
		<div class="col-md-8 column">
			<div class="page-header">
				<h2>
					讨论 · 随笔  <small> ${mainActivity.title}</small>
				</h2>
			</div>
			<form role="form" action="${ctx}/activity/note_submit" method="post">
				<input type="hidden" name="activityId" value="${mainActivity.id }"  />
				<input type="hidden" name="userId" value="${loginUser.id }"  />
				
				<div class="form-group">
					<label for="title">标题</label>
					<input type="text" class="form-control" id="title" name="title" required="required" />
				</div>
				
				<div class="form-group">
					<label for="text" >正文</label>
					<textarea id="text" class="form-control" rows="20" name="text" required="required" ></textarea>
				</div>
				
				<div class="form-group">
					<label for="isPrivate" >
						<input id="isPrivate" type="checkbox" name="isPrivate" > 不公开</input>
					</label>
				</div>
				
				<div class="form-group">
					<button type="submit" class="btn btn-primary">发布</button>
				</div>
			</form>
		</div>
		<div class="col-md-4 column">
			<div class="page-header">
				<h2>
					<a id="to_activity" href="${ctx }/activity/${mainActivity.id}"> &gt; 返回活动页面</a>
				</h2>
			</div>
			<a href="${ctx}/activity/${mainActivity.id}">
				<img id="poster" src="${mainActivity.posterUrl}" /> 
			</a>
		</div>
	</div>
</div>
</body>
</html>