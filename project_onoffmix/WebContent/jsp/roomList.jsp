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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var result = '${msg}';
	if(result == "SUCCESS"){
		alert("처리가 완료 되었습니다.");
	}else if(result == "FAIL"){
		alert("처리 실패");
	}
</script>
</head>
<body>
	<c:forEach var = "room" items = "${roomList}">
<%-- 	 ${room.room_name}  --%>
	<a href="roomView?num=${room.room_num}">${room.room_name}</a>
	
	</c:forEach>
	
	

	
</body>
</html>