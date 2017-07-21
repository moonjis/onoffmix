<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/css/common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	height: 365px;
}

.room-title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	text-align : center;
}

@media screen and (max-width : 767px) {
	#myCarousel {
		display: none;
	}
}

.white, .white a {
	color: #fff;
}
</style>

<title>Insert title here</title>

</head>
<script type="text/javascript">
	if ("${msg}" != "") {
		alert("${msg}");
	}
</script>
<body>
	<%@include file="/jsp/common/navi.jsp"%>
	<div class="search_header" id="jumbotron">
		<div class="row">
			<div class="col-xs-12 text-center">
				<h1 class="font_blue">onoffmix.com</h1>
			</div>
			<div class="col-lg-8 col-sm-10 col-centered">
				<div class="input-group">
					<input type="text" class="form-control search_input"
						placeholder="Search">
					<div class="input-group-btn">
						<button class="btn btn-default search_input search_btn"
							type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="myCarousel" class="carousel slide col-xs-12"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-background="#BED7DB"
					data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-background="#f15a3f"
					data-slide-to="1"></li>
				<li data-target="#myCarousel" data-background="#1d3734"
					data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="${path}/images/1.png" alt="Los Angeles">
				</div>

				<div class="item">
					<img src="${path}/images/2.png" alt="Chicago">
				</div>

				<div class="item">
					<img src="${path}/images/3.png" alt="New York">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="container top-buffer">

		<div class="row">
			<%-- <div class="col-lg-3 col-sm-4 col-md-3">
				<div class="thumbnail content_box">
					<img src="${path}/images/onoffmix1.PNG" alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-4 col-md-3">
				<div class="thumbnail content_box">
					<img src="${path}/images/onoffmix1.PNG" alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-4 col-md-3">
				<div class="thumbnail content_box">
					<img src="${path}/images/onoffmix1.PNG" alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.</p>
					</div>
				</div>
			</div> --%>
			<c:forEach var="room" items="${list}">
				<div class="col-lg-3 col-sm-4 col-md-3">
					<div class="thumbnail content_box roomBox" onclick="location.href='room/roomView?num=${room.room_num}'">
						<img style="height: 70%;" src="${path}/images/room/${room.fullname}" onError="this.src='${path}/images/onoffmix1.PNG'" alt="...">
						<div class="caption">
							<h4 class="room-title">${room.room_name}</h4>
							<%-- <p>${room.room_introduce}</p> --%>
						</div>
					</div>
				</div>
			</c:forEach>			
		</div>

	</div>	
</body>
<%@include file="/jsp/common/footer.jsp"%>
</html>