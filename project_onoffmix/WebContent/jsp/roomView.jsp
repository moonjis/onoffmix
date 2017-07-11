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
룸뷰 확인s : ${room.room_name}<br>
<img src="/project_onoffmix/images/room/${room.fullname}"/><br>
 ${room.room_day1} ${room.room_day2} ~ 
	 <c:choose> 
	 
	 	<c:when test="${empty room.room_day3}"> ${room.room_day1}</c:when>
	 	<c:otherwise>${room.room_day3}</c:otherwise>
	 
	 </c:choose> ${room.room_day4}<br>
${room.room_detail}

</body>
</html>