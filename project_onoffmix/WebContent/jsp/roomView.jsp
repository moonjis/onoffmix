<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function getOriginalName(fileName){
	/* UUID 가 붙은 file 명을 원래 파일명으로 가져오는 메서드작성*/
	/*  UUID + _ + orginalFileName */
	if(fileName == null){
		return;
	}
	
	var idx = fileName.indexOf("_") + 1;   
	return fileName.substr(idx);
}

// $(function(){
// 	var fileName = getOriginalName("${room.fullname}");
// });
</script>
</head>
<body>
모임 제목 : ${room.room_name}<br>
모임 기간 : ${room.room_day1} ${room.room_day2} ~ 
	 <c:choose> 
	 
	 	<c:when test="${empty room.room_day3}"> ${room.room_day1}</c:when>
	 	<c:otherwise>${room.room_day3}</c:otherwise>
	 
	 </c:choose> ${room.room_day4}<br>
모임 장소 : ${room.location_1} &nbsp; ${room.location_2} <br> 
왼쪽에 띄울 사진 : <img src="/project_onoffmix/images/room/${room.fullname}"/><br>
간단소개 : ${room.room_introduce}<br>
스마트에디터 : ${room.room_detail}

 


</body>
</html>