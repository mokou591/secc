<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>创建${mainMusic.chsName}的评论</title>
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
			#to_music{
				font-size: 18px;
			}
			#poster{
				width: 160px;
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
					评价 <small>为音乐 ${mainMusic.chsName} 作出评价</small>
				</h2>
			</div>
			<form role="form" action="${ctx}/music/review_submit" method="post">
				<input type="hidden" name="musicId" value="${mainMusic.id }"  />
				<input type="hidden" name="userId" value="${loginUser.id }"  />
				<div class="form-group">
					<label for="score">评分<span class="red">（必选）</span></label><br />
					<label for="radio1"><input id="radio1" type="radio" name="score" value="10" required="required"/>力荐（10分）</label><br />
					<label for="radio2"><input id="radio2" type="radio" name="score" value="8"/>推荐（ 8分）</label><br />
					<label for="radio3"><input id="radio3" type="radio" name="score" value="6"/>还行（ 6分）</label><br />
					<label for="radio4"><input id="radio4" type="radio" name="score" value="4"/>较差（ 4分）</label><br />
					<label for="radio5"><input id="radio5" type="radio" name="score" value="2"/>很差（ 2分）</label>
				</div>
				
				<div class="form-group">
					<label for="title">标题（可选）</label>
					<input type="text" class="form-control" id="title" name="title" />
				</div>
				
				<div class="form-group">
					<label for="text" >正文（可选）</label>
					<textarea id="text" class="form-control" rows="20" name="text" ></textarea>
				</div>
				
				<div class="form-group">
					<label for="isPrivate" >
						<input id="isPrivate" type="checkbox" name="isPrivate" > 不公开</input>
					</label>
				</div>
				
				<div class="form-group">
					<button type="submit" class="btn btn-primary">提交</button>
				</div>
			</form>
		</div>
		<div class="col-md-4 column">
			<div class="page-header">
				<h2>
					<a id="to_music" href="${ctx }/music/${mainMusic.id}"> &gt; ${mainMusic.chsName}</a>
				</h2>
			</div>
			<a href="${ctx }/music/${mainMusic.id}">
				<img id="poster" src="${mainMusic.coverUrl}" /> 
			</a>
		</div>
	</div>
</div>
</body>
</html>