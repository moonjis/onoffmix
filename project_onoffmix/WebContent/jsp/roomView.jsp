<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
룸뷰 확인s : ${room.room_name} &nbsp; &nbsp; &nbsp; &nbsp;  ${room.fullname} 
<img src="${path }/images/room/${room.fullname}"/>
</body>
</html>