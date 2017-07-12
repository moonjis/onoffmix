<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/roomview.css">
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
//    var fileName = getOriginalName("${room.fullname}");
// });
</script>
</head>
<body>
   <div id="viewwrop">
         <div id="viewimg">
            <img style=" float: right; margin-top: 20px; " alt="poto7" src="../images/poto7.png">
         </div>
            <div style="height: 320px; margin: 50px 0px;">
               <img  style="position: relative; display:inline-block; margin-left: 50px; width: 300px; height: 300px; float: left;" src="/project_onoffmix/images/room/${room.fullname}"/><br>
               
               <div id="viewimg1" style="position: relative; float: right; margin: 0px 40px 0px 0px; line-height: 40px;">
                  <div style="margin: 0px 0px 15px 0px; font-size: 25px; font-weight: bold;">
                     ${room.room_name}
                  </div>
                  
                  <div>
                     <span style="display: inline-block; position: relative; top: 3px; margin-right: 7px; width: 13px; height: 16px; background: url(../images/icon_eventInfo.png) no-repeat 0px 0px;"></span>
                     <span>
                        모임 기간 : ${room.room_day1} ${room.room_day2} ~
                  <c:choose> 
                     <c:when test="${empty room.room_day3}"> ${room.room_day1}</c:when>
                     <c:otherwise>${room.room_day3}</c:otherwise>
                  </c:choose> 
                  ${room.room_day4}
               </span>
                  </div>
                  
                  <div>
                     <span style="display: inline-block; position: relative; top: 3px; margin-right: 7px; width: 13px; height: 16px; background: url(../images/icon_eventInfo.png) no-repeat -14px 0px;"></span>
                     <span>
                        모임 장소 : ${room.location_1} &nbsp; ${room.location_2}
                     </span>
                  </div>
                  
                  <div>
                     <span style="display: inline-block; position: relative; top: 3px; margin-right: 7px; width: 13px; height: 16px; background: url(../images/icon_eventInfo.png) no-repeat -28px 0px;"></span>
                     <span>
                        신청 인원 : ${room.count}명
                     </span>
                  </div>
                  
               </div>
               
               <div style="width: 750px; position: relative; float: right; margin: 10px 40px 0px 0px;">간단소개 : ${room.room_introduce} </div>       
            </div>
            
         <div id="viewimg2" style="clear: both;">
            <font size="5" style=" font-weight: bold; margin-left: 8px; font-style: normal;">개설자정보</font>
         </div>   
         <div id="viewimg3" style=" line-height: 25px; ">
            <font style="display: block; margin: 0 auto; margin-top: 20px; text-align: center;">${room.owner_name}</font><br>
            
            <div>
               <span style="display: inline-block; width:10px; height: 9px; margin-right: 7px; background: url('../images/icon_host.png') no-repeat 0px -2px;"></span>
               ${room.owner_email}   
            </div>
            
            <div>
               <span style="display: inline-block; width:10px; height: 9px; margin-right: 7px; background: url('../images/icon_host.png') no-repeat -11px -1px;"></span>
               ${room.owner_phone}
            </div>
            
<!--             <img alt="poto1" src="../images/poto1.png" style="border:1px solid red; width: 22px; height: 20px; "><font size="3" style="border: 1px solid red; font-weight: bold; display: inline-block; margin: 0px 0px 10px 0px;" ></font><br> -->
<%--             <img alt="poto2" src="../images/poto2.png" style="width: 22px; height: 20px; ">${room.owner_phone} --%>
         </div>
            <font size="2" style=" margin-left: 50px;">· 문의사항은 메일 / 전화 / 댓글을 이용해주세요.</font>
            <form action="joinRoom" method="post" name="joinRoom">
            <input type="hidden" value ="${member.id}" name="id">
            <input type="hidden" value ="${room.room_num}" name="room_num">
            <input type="submit" value="신청하기" style="margin-left: 990px; margin-bottom: 20px; width: 170px; height: 50px; border-radius: 10px; border: 0; outline: 0; background: #71B1FA; font-weight: bold; font-size: larger;">
      		</form>
      </div>
         
      <div id="viewwrup">
         <div style=" margin-top: 80px;">
            상세정보<br>
         ${room.room_detail}
         </div>
         <div style=" clear: both; margin-top: 60px;">
            <table style="width: 1190px; height: 400px; border-spacing: 0; border: 1px solid #cccccc;  background: #D9F1FB; margin-left: -23px;">
               <tr>
                  <td>
                     <font size="4" style="margin-left: 20px;">* 모임의 신청/취소/변경/환불은 참여신청 기간 내에만 가능합니다.</font><br>
                     <br>
                     <font size="4" style="margin-left: 20px;">* 결제한 유료모임은 환불 시 결제 수단과 환불 시점에 따라 수수료가 부과될 수 있습니다. 자세한 사항은 취소/환불약관을 확인해주세요.</font><br>
                     <br>
                     <font size="4" style="margin-left: 20px;">* 결제, 환불, 참여신청 수정/취소, 참여상태 확인, 참여내역 확인은 마이페이지에서 할 수 있습니다.</font><br>
                     <br>
                     <font size="4" style="margin-left: 20px;">* 모임 또는 그룹의 설정, 모집정원 초과 여부에 따라 대기자로 선정될 수 있습니다. 자세한 사항은 FAQ를 확인해주세요.</font><br>
                     <br>
                     <font size="4" style="margin-left: 20px;">* 온오프믹스 결제서비스를 이용하는 모임은 개설자의 사업자 여부에 따라 결제증빙 발행이 가능합니다. 자세한 사항은 FAQ를 확인해 주세요.</font><br>
                     <br>
                     <font size="4" style="margin-left: 20px;">* 개설자 선정방식 또는 개설자 통장입금 방식의 모임 참여/결제 확인은 개설자에게 문의 바랍니다.</font><br>
                     <br>
                     <font size="4" style="margin-left: 20px;">* 온오프믹스는 참여신청 및 참가비 결제 기능을 제공하는 회사로 모임개설자(주최측)가 아닙니다. </font><br>
                     <br>
                     <font size="4" style="margin-left: 34px;"> 모임 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.</font>
                  </td>
               </tr>
            </table>
            <div>
               <img alt="poto6" src="../images/poto6.png" style="clear: both; float: right;">
            </div>
         </div>
      
      
      </div>
      
      
      
      
   

 


</body>
</html>