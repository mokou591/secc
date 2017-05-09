<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://cdn.bootcss.com/cropper/2.3.4/cropper.min.js"></script>
		<script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
		<link href="https://cdn.bootcss.com/cropper/2.3.4/cropper.min.css" rel="stylesheet">
		<link href="${ctx}/css/sitelogo.css" rel="stylesheet">
		
		<title>个人资料编辑</title>
		<style type="text/css">
			#page_header {
				margin: 0 0 20px 0;
			}
			
			#head_title {
				font-weight: normal;
				margin: 5px 5px;
			}
			
			#rightcorner {
				float: right;
				margin: auto 10px auto auto;
			}
			
			#avatar {
				width: 160px;
				margin: 0 0 0 0;
			}
			
			form .form-group {
				margin: 0 0;
				padding: 20px 0;
			}
			
			textarea {
				resize: none;
			}
			
			#avatar_block{
				width:160px;
				margin:10px;
			}
			
			#changeAvatar{
				margin:10px 40px;
			}
			
			#upload_btn{
				height:35px;
			}
			
		</style>
	</head>

	<body>
		<!-- 引入导航栏 -->
		<jsp:include page="/WEB-INF/jsp/top_navbar.jsp" />
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-10 column col-md-offset-1">
					<div id="page_header" class="page-header">
						<h2>
							<label id="head_title">编辑个人资料</label>
							<div id="rightcorner">
								<a class="btn btn-default"  role="button" href="${ctx}/people/${loginUser.id}">返回我的主页 <span class="glyphicon glyphicon-chevron-right"></span></a>
							</div>
						</h2>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<c:if test="${isUpdateSuccess}">
					<div class="col-md-10 column col-md-offset-1">
						<div id="updateSuccess" class="alert fade in alert-success">
							<a class="close" data-dismiss="alert">×</a>
							资料保存成功。
						</div>
					</div>
				</c:if>
			
				<div  class="col-md-2 column col-md-offset-1">
					<div id="avatar_block">
						<img id="avatar" class="img-rounded" src="${ctx}/upload/avatar/${loginUser.avatarUrl}" />
						<div id="changeAvatar">
							<button id="changeAvatar_btn" type="button" class="btn btn-default" data-toggle="modal" data-target="#avatar-modal">修改头像</button>
						</div>
					</div>
				</div>
				<div class="col-md-8 column">

					<form class="form-horizontal" role="form" method="post" action="${ctx}/user/updateUserProfile" >
						<input hidden="hidden" name="id" value="${loginUser.id}" />
					
						<div class="form-group">
							<label for="nickname" class="col-sm-2 control-label">昵称</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="nickname" name="nickname" value="${loginUser.nickname}" required="required" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-2">
								<select class="form-control" name="gender" id="gender" >
									<option value="保密" 
									 <c:if test="${loginUser.gender eq '保密'}">selected</c:if>
									>保密</option>
									<option value="男"
									 <c:if test="${loginUser.gender eq '男'}">selected</c:if>
									>男</option>
									<option value="女"
									 <c:if test="${loginUser.gender eq '女'}">selected</c:if>
									>女</option>
									<option value="其他"
									 <c:if test="${loginUser.gender eq  '其他'}">selected</c:if>
									>其他</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="sign" class="col-sm-2 control-label">一句话介绍</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="sign"  name="sign" value="${loginUser.sign}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="address" class="col-sm-2 control-label">常居地</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="address"  name="address" value="${loginUser.address}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="school" class="col-sm-2 control-label">学校</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="school"  name="school" value="${loginUser.school}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="academy" class="col-sm-2 control-label">院系</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="academy"  name="academy" value="${loginUser.academy}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="intro" class="col-sm-2 control-label">个人简介</label>
							<div class="col-sm-6">
								<textarea class="form-control" rows="5" id="intro"  name="intro"  >${loginUser.intro}</textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-1">
								<button type="submit" class="btn btn-default">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
	
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div id="main_panel" class="modal-content">
					<form class="avatar-form" >
						<div class="modal-header">
							<button class="close" data-dismiss="modal" type="button">&times;</button>
							<h4 class="modal-title" id="avatar-modal-label">修改头像</h4>
						</div>
						<div class="modal-body">
							<div class="avatar-body">
								<div class="avatar-upload">
									<button id="upload_btn" class="btn btn-primary" type="button" onclick="$('input[id=avatarInput]').click();">
										 <span class="glyphicon glyphicon-picture" /> 上传图片
									</button>
									<span id="avatar-name"></span>
									<input class="avatar-input hide" id="avatarInput" name="avatar_file" type="file"></div>
								<div id="operPanel">
								<div class="row">
									<div class="col-md-7">
										<div class="avatar-wrapper"></div>
										<label id="tip">可使用鼠标滚轮放大缩小</label>
									</div>
									<div class="col-md-3">
										<div class="avatar-preview preview-lg" id="imageHead"></div>
									</div>
								</div>
								<div id="avatar_btns" class="row avatar-btns">
									<div class="col-md-7">
										<button id="avatar_reset" type="button" class="btn btn-primary fa fa-refresh"  data-method="reset"  data-toggle="tooltip"  data-original-title="$().cropper(&quot;reset&quot;)">
											重置
										</button>
										<button id="avatar-save" class="btn btn-primary" type="button" data-loading-text="正在保存修改，请勿关闭页面...">
											<span class="glyphicon glyphicon-ok" /> 保存
										</button>
									</div>
								</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
<script src="${ctx}/js/sitelogo.js"></script>
<script type="text/javascript">
$("#avatar-save").on("click", function() {
	$(this).button('loading');//按钮进入'加载'模式
	var img_lg = document.getElementById('imageHead');
	// 截图小的显示框内的内容
	html2canvas(img_lg, {
		allowTaint: true,
		taintTest: false,
		onrendered: function(canvas) {
			canvas.id = "mycanvas";
			//生成base64图片数据
			var dataUrl = canvas.toDataURL("image/png");
			var newImg = document.createElement("img");
			newImg.src = dataUrl;
			imagesAjax(dataUrl);
		}
	});
	
})

function imagesAjax(src) {
	$.ajax({
		url: "${ctx}/user/uploadAvatar",
		data: {
			"imgStr":src
		},
		type: 'POST',
		success: function(result) {
			//头像提交成功
			$("#avatar-modal").modal('hide');
			//重置按钮
			$("#avatar-save").button('reset');
			//延迟后刷新页面
			setTimeout(function () {
				//更新头像
				window.location.reload();
		    }, 500);
		}
	});
}
</script>


</html>