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
<link rel="stylesheet" href="../css/roomlist.css">
</head>
<body>
<%@include file="/jsp/common/navi.jsp"%>
<%--    <%@include file="/jsp/common/navi.jsp"%> --%>
<%--    <c:forEach var = "room" items = "${roomList}"> --%>
<%--     ${room.room_name}  --%>
<%--    <a href="roomView?num=${room.room_num}">${room.room_name}</a> --%>
<%--    <img src="/project_onoffmix/images/room/${room.fullname}"/> --%>
<%--    </c:forEach> --%>


<%--  <a href="outRoom?num=${room.room_num}">신청자만삭제</a> 개인삭제 --%>
<%--  <a href="modifyRoomForm?num=${room.room_num}">수정</a> --%>
<%--  <a href="deleteRoom?num=${room.room_num}">모임 전체삭제</a> 게시자 삭제--%>


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
              <c:if test="${room != null}">
                     <div class="col-lg-3 col-sm-4  col-md-3">
                        <div style=" border: 1px solid gray; border-radius: 7px;" class="thumbnail content_box">
                           <img style=" width: 300px; height: 250px; padding-top: 20px;" src="/project_onoffmix/images/room/${room.fullname}"/>
                           <div class="caption">
						<h3><a style="border: clear: both; margin-left: 120px; " href="roomView?num=${room.room_num}">${room.room_name}</a><a href="deleteRoom?num=${room.room_num}">모임 전체삭제</a></h3>
					 </div>
                        </div>
                     </div>
              </c:if>
            </c:forEach>
         
         <c:forEach var="i" begin="1" end="${12-roomList.size()}" step="1">
	         <div class="col-lg-3 col-sm-4 col-md-3">
	                     <div style=" border: 1px solid gray; border-radius: 7px; " class="thumbnail content_box">
	                        <img style=" width: 300px; height: 250px; padding-top: 20px;"  src="${path}/images/onoffmix1.PNG" alt="...">
	                           <div class="caption">
	                              <h3 style="border: clear: both; margin-left: 110px; ">비어 있음</h3>
	                           </div>
	                    </div>
	      </div>
	 	 </c:forEach>
	  </div>
   </div>   
</body>
   <%@include file="/jsp/common/footer.jsp"%>

</html>