<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/setting/constant.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>${mainFilm.chsName}</title>
<style type="text/css">
			*{
				font-size: 16px;
			}
		
			.part_header{
				margin-top: 50px;
			}
		
			#poster {
				width: 160px;
				margin-left: 10px;
			}
			
			#profile dt {
				font-size: 14px;
			}
			
			#profile dd {
				font-size: 14px;
				margin-bottom: 4px;
			}
			
			.review{
				margin: 20px auto;
			}
			
			.review_header {
				background: rgb(243, 245, 247);
				color: rgb(51, 119, 170);
				font-size: 16px;
				padding: 8px 20px;
			}
			
			.showorhide {
				width: 100px;
				float: right
			}
			
			.user_avatar {
				width: 50px;
				height: 50px;
			}
			.review_name{
				margin-left: 20px;
			}
			.review_mark {
				margin: auto 10px;
			}
			
			.review_date {
				color: grey;
			}
			
			.review_text{
				margin: 10px;
			}
			.review_ooxx{
				color: grey;
				margin-left: 10px;
			}
			.toallreview {
				font-size: 20px;
				margin: 100px 0 100px 0;
			}
		</style>
</head>
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
							${mainFilm.chsName} ${mainFilm.originalName} <small> (${mainFilm.year })</small>
						</h1>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<div class="row clearfix">
						<div class="col-md-3 column">
							<img id="poster" src="${mainFilm.posterUrl }" />
						</div>
						<div class="col-md-9 column">
							<dl id="profile">
								
								<c:if test="${not empty mainFilm.director }">
									<dt>
									导演
									</dt>
									<dd>
										${mainFilm.director }
									</dd>
								</c:if>
								
								<c:if test="${not empty mainFilm.writer }">
									<dt>
									编剧
									</dt>
									<dd>
										${mainFilm.writer }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.actor }">
									<dt>
									主演
									</dt>
									<dd>
										${mainFilm.actor }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.genre }">
									<dt>
									类型
									</dt>
									<dd>
										${mainFilm.genre }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.region }">
									<dt>
									制片国家/地区
									</dt>
									<dd>
										${mainFilm.region }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.language }">
									<dt>
									语言
									</dt>
									<dd>
										${mainFilm.language }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.length }">
									<dt>
									片长
									</dt>
									<dd>
										${mainFilm.length }
									</dd>
								</c:if>

								<c:if test="${not empty mainFilm.imdbnum }">
									<dt>
									IMDb链接
									</dt>
									<dd>
										<a href="http://www.imdb.com/title/${mainFilm.imdbnum}">
											${mainFilm.imdbnum }
										</a>
									</dd>
								</c:if>
								
							</dl>
						</div>
					</div>
					<h3>
						${mainFilm.chsName }的剧情简介 · · · · · ·
					</h3>
					<p>
						${mainFilm.intro }
					</p>
					<h3 class="part_header">
					${mainFilm.chsName }的影评 · · · · · ·
					</h3>

					<div class="review">
						<h4 class="review_header">《闻香识女人》——通往天堂的窄门  
							<a data-toggle="collapse" href="#content61" class="showorhide">
								查看全部
							</a> 
						</h4>
						<a href="#">
							<img class="review_avatar" src="https://img3.doubanio.com/icon/u1010094-1.jpg" />
						</a>
						<span class="review_name"><a href="#">九尾黑猫</a> </span>
						<span class="review_mark"> 评分：8 </small></span>
						<span class="review_date"> 2005-08-13 21:05:17 </span>
						<div class="review_text">
							<blockquote>这篇影评可能有剧透</blockquote>
							干掉对手那一场，是金子总要发光，在“教父2”中，帕西诺彻底征服了我，尽管他没有凭借此片获得奥斯卡小金人。当然在“教父2”中还有位牛人，德尼罗，他演绎第一代教父的青年时代，也很棒，惟妙惟肖模
							<div class="resttext panel-collapse collapse" id="content61">
								干掉对手那一场，是金子总要发光，在“教父2”中，帕西诺彻底征服了我，尽管他没有凭借此片获得奥斯卡小金人。当然在“教父2”中还有位牛人，德尼罗，他演绎第一代教父的青年时代，也很棒，惟妙惟肖模仿白兰度的嗓音和神态令人叫绝，揽得奥斯卡最佳男配角，至于后来他主演的“美国往事”更是颠峰之作，不过今天不打算讨论他。
							    	如果认为帕西诺的水平仅局限于用眼神来征服观众，那么就大错了，在“闻香识女人”中，帕西诺扮演一名瞎眼的退役军官，而正是这个角色反而令他问鼎小金人。此片几乎是帕西诺的一场个人秀，其他所有的配角均可忽略不计。
							    <br><br>名字中有女人，可故事完全和女人没关系，纯粹是两个男人之间的故事。我平时看电影有些没心没肺，总是让导演失望，该哭的时候笑，该笑的时候叫，但看完“闻香识女人”后还是觉得挺感动。一方面，故事不错，另一方面，帕西诺的确没得说。
							</div>
						</div>
						<div class="review_ooxx">
							<a href="javascript:void(0)">有用</a>:892  /  
							<a href="javascript:void(0)">没用</a>:92
							<div id="ooxx61"></div>
						</div>
					</div>



					<div class="toallreview">
						<a href="#"> &gt; 去这部影片的讨论区（全部153条）</a>
					</div>
				</div>

				<div class="col-md-4 column">
					<div class="page-header">
						<h2>评分：8.9 </h2>
						<h3><small>304552人评价</small></h3>
						<a href="${ctx}/film/${mainFilm.id}/new_review" class="btn btn-primary">我要评价</a>
						<h4>您的评价：8</h4>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>