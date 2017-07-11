<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>
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
<meta http-equiv="Conte	nt-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/roomlist.css">
</head>
<body>
	<%@include file="/jsp/common/navi.jsp"%>
<%-- 	<c:forEach var = "room" items = "${roomList}"> --%>
<%-- 	 ${room.room_name}  --%>
<%-- 	<a href="roomView?num=${room.room_num}">${room.room_name}</a> --%>
<%-- 	<img src="/project_onoffmix/images/room/${room.fullname}"/> --%>
<%-- 	</c:forEach> --%>
	<div id="roomwrop">
	<div id="listtitle">
	<table>
		<tr>
			<td>
				<img alt="tilte" src="../images/onoffpoto1.png" width="600px;" height="200px;">
			</td>
		</tr>
	</table>
	</div>
	<br>
	<br>
	<br>
		<div class="row">
				<c:forEach var = "room" items = "${roomList}">
<%-- 	 ${room.room_name}  --%>
	
	

			
			<div class="col-lg-3 col-sm-4  col-md-3">
				<div class="thumbnail content_box">
					<img src="/project_onoffmix/images/room/${room.fullname}"/>
					<div class="caption">
						<h3><a href="roomView?num=${room.room_num}">${room.room_name}</a></h3>
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
					</div>
				</div>
			</div>
</c:forEach>
		
			
			
			
			
			
			
			
			
			
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-3 col-sm-4 col-md-3"> -->
<!-- 				<div class="thumbnail content_box"> -->
<%-- 					<img src="${path}/images/onoffmix1.PNG" alt="..."> --%>
<!-- 					<div class="caption"> -->
<!-- 						<h3>Thumbnail label</h3> -->
<!-- 						<input type="button" class="btn1" name="" value="신청하기" -->
<!-- 						style="border-radius: 20px; width: 150px; height: 40px; border: 1px solid #cccccc;  -->
<!-- 						background: #C7B8E4; font-weight: bold; border: 0; outline: 0; margin-left: 190px;"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>	
	<%@include file="/jsp/common/footer.jsp"%>
</body>

</html>