<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/roomview.css">

 <style>

   #btnReply{
  	width: 70px;
    height: 85px;
    border: 1px solid #b8b8b8;
    background: #f6f6f6;
    font-size: 11px;
    font-weight: bold;
    color: #666;
    cursor: pointer;
    letter-spacing: -1px;
    text-indent: 0;
    
  }  
  
  #btnModify{
  	 text-align:right; 
   
  }
  
  
  #btnModify a{
  	font: Normal 12px NanumGothic;
  	color:#8C8C8C;
  	text-decoration:none;
  	
  }
    #modDiv {
 	width: 300px;
		height : 100px;
		background-color: gray;
		position: relative;
		top: 50%; 
		left: 50%;
		margin-top : -50px;
		margin-left: -150px;
		padding : 10px;
		z-index: 1000;
    }
    
    
    #modal-replytext{
	width:284px;
	height:40px;
}
    
table.cherry {
     border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 40px auto;
   
}
table.cherry th {
    width: 150px;
    padding: 10px;
    font: Normal NanumGothic;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.cherry td {
    width: 820px;
    height: 84px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

</style>
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

<script type="text/javascript">

	$(document).ready(function(){
		var num = ${room.room_num};  
		var replyer = "${member.id}";
		listReply();
		
		$("#btnReply").click(function(e){
			 e.preventDefault();
			// $("#replyer").append(replyer);
			//var replyer = $("#replyer").append(replyer);
			var replyer =  $("#replyer").val();
			var replytext = $("#replytext").val();
		
			
			if($("#replytext").val().length == 0){
	               alert("댓글을 입력하세요.");
	                return false;
	         }
			 if($("#replyer").val().length==0){
	           
	        	  alert("로그인 후 이용하세요.");
		             return false;
			 }
			
			$.ajax({
				url:"../replies",
				type:"POST",
				data:{
					num : num,
					replyer : replyer,
					replytext : replytext
					},
					datatype : "text", 
					success: function(result) {
						
					 if (result == "SUCCESS") {
							console.log(result)
							alert("등록되었습니다.");
							listReply();
							
						} 

					},
					error: function(request,status,error){
						
						alert("댓글등록 실패");
						
					}
					
				});
		return false;
	});
		
		//});
	
	
	function listReply(){
		$.ajax({
			url:"../replies/all/" + num,
			type:"GET",
			dataTyape:"json",
			success : function(result){
				console.log(result);
				
				var output = "<table class='cherry'>";
				for(var i in result){
					
					output += "<tr>";
					output += "<th>"+result[i].replyer+"<br>";
					output += "("+changeDate(result[i].regdate)+")<br>";
					output += "<td data-rno='"+result[i].rno+"'>"+result[i].replytext
				
				if("${sessionScope.member.id !=null}" && "${sessionScope.member.id}"==(result[i].replyer)){
				
					output+=	"<div id='btnModify'><a href='#listReply'>수정</a></div>";
					}
					output += "</td></tr>";
				}
				
				output+="</table>";
				
				$("#listReply").html(output);
				
			}
			});
			
	}


	
	$("#listReply").on("click","#btnModify",function(){
		var reply = $(this).parent(); 
		var replytext = reply.text();
		  var le = $("#replytext").val().length-2;
	      var result2 = replytext.slice(0,le);
	      
		console.log(reply.attr("data-rno"));
		var rno = reply.attr("data-rno");
		$(".modal-title").html(rno);
		$("#modal-replytext").val(result2);
		
		$("#modDiv").show("slow");
		
	});
	
	
	$("#replyModBtn").click(function(){
		var rno = $(".modal-title").html();
		var replytext = $("#modal-replytext").val();
		
		$.ajax({
			type : "post",
			url  : "../replies/"+rno,
			datatype : "text",
			data : {
				replytext : replytext
			},
			success : function(result){
				if(result =="SUCCESS"){
					alert("수정 되었습니다.");
					$("#modDiv").hide("slow");
					listReply();
				}
			},
			error : function(){
				alert("실패");
				$("#modDiv").hide("slow");
			}
	});
	});
	
	$("#closeBtn").on("click",function(){
		$("#modDiv").hide("slow");
	});
	
	
	$("#replyDelBtn").on("click",function(){
		//삭제요청을 보내고 결과에 대한 응답을 받는다. 
		var rno = $(".modal-title").html();
		if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type : "delete",
			url  : "../replies/" + rno,
			datatype : "text",
			success : function(result){
				if(result == "SUCCESS"){
					alert("삭제 되었습니다.");
					$("#modDiv").hide("slow");
					listReply();
				}
			
			},
			error : function(){
				alert("실패");
				$("#modDiv").hide("slow");
			}
		
		});
			
	}
	
	
	
	

	});
});
	function changeDate(date){
				 var date = new Date(parseInt(date));
				
				   var d = date.getDate();
				   var m =  date.getMonth();
				   m += 1;  // JavaScript months are 0-11
				   var y = date.getFullYear();
				  var hour = date.getHours();
			       var minute = date.getMinutes();
			       var second = date.getSeconds();
				   
		return y+"-"+m+"-"+d+" "+hour+":"+minute+":"+second;
	}
	

</script>


</head>
<body>
<%@include file="/jsp/common/navi.jsp"%>
   <div id="viewwrop">
         <div id="viewimg">
            <img style=" float: right; margin-top: 20px; " alt="poto7" src="../images/poto7.png">
         </div>
            <div style="height: 320px; margin: 50px 0px;">
               <img  style="position: relative; display:inline-block; margin-left: 50px; width: 300px; height: 300px; float: left;" src="/project_onoffmix/images/room/${room.fullname}"/><br>
               
               <div id="viewimg1">
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
               
               <div style=" width: 550px; position: relative; float: right; margin: 10px 40px 0px 0px; ">간단소개 : ${room.room_introduce} </div>       
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
            <input type="submit" value="신청하기" style=" float: right; clear: both; display:inline-block; margin: 0px 25px 0px 0px; width: 170px; height: 50px; border-radius: 10px; border: 0; outline: 0; background: #71B1FA; font-weight: bold; font-size: larger;">
            </form>
      </div>
         
      <div id="viewwrup">
         <div style="margin: 40px 0px 0px 60px;">
            <h1>상세정보</h1><br><br>
         ${room.room_detail}
         </div>
         <div style=" clear: both; margin-top: 60px;">
         <font style=" font-weight: bold; font-size:larger; display: inline-block; ">참여신청/취소 안내</font>
            <table style="width: 930px; height: 350px; border-spacing: 0; border: 1px solid gray;  background: #D9F1FB; margin: 0px 0px 20px 0px;">
               <tr>
                  <td>
                     <font size="2" style="margin-left: 20px;">* 모임의 신청/취소/변경/환불은 참여신청 기간 내에만 가능합니다.</font><br>
                     <br>
                     <font size="2" style="margin-left: 20px;">* 결제한 유료모임은 환불 시 결제 수단과 환불 시점에 따라 수수료가 부과될 수 있습니다. 자세한 사항은 취소/환불약관을 확인해주세요.</font><br>
                     <br>
                     <font size="2" style="margin-left: 20px;">* 결제, 환불, 참여신청 수정/취소, 참여상태 확인, 참여내역 확인은 마이페이지에서 할 수 있습니다.</font><br>
                     <br>
                     <font size="2" style="margin-left: 20px;">* 모임 또는 그룹의 설정, 모집정원 초과 여부에 따라 대기자로 선정될 수 있습니다. 자세한 사항은 FAQ를 확인해주세요.</font><br>
                     <br>
                     <font size="2" style="margin-left: 20px;">* 온오프믹스 결제서비스를 이용하는 모임은 개설자의 사업자 여부에 따라 결제증빙 발행이 가능합니다. 자세한 사항은 FAQ를 확인해 주세요.</font><br>
                     <br>
                     <font size="2" style="margin-left: 20px;">* 개설자 선정방식 또는 개설자 통장입금 방식의 모임 참여/결제 확인은 개설자에게 문의 바랍니다.</font><br>
                     <br>
                     <font size="2" style="margin-left: 20px;">* 온오프믹스는 참여신청 및 참가비 결제 기능을 제공하는 회사로 모임개설자(주최측)가 아닙니다. </font><br>
                     <br>
                     <font size="2" style="margin-left: 34px;"> 모임 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.</font>
                  </td>
               </tr>
               
            </table>
            <!-- <div>
               <img alt="poto6" src="../images/poto6.png" style="clear: both; float: right; margin-top: -10px;">
            </div> --> 
         </div>
      </div>
      


<div id = "modDiv" style="display: none;"  >

		<div class = "modal-title"></div>
		<div>
			<input type = "text" id = "modal-replytext">
		</div>
		<div>
		
	<%-- 	<c:if test="${sessionScope.member.id != null} "> --%>
			<button type = "button" id = "replyModBtn">수정</button>
			<button type = "button" id = "replyDelBtn">삭제</button>
<%-- 		</c:if> --%>
			<button type = "button" id = "closeBtn">닫기</button>
			
		</div>
		
	</div>

	
<form name = "replyForm" id ="replyForm">
	<input type="hidden" value="${member.id}" id="replyer">
	<!-- 	REPLYER<input type ="text" name = "replyer" id = "replyer"/><br><br> -->
		<%-- 	REPLYER :${member.id}<br><br> --%>

<table style="margin:auto;">
    <tr>
   <!--  <div style="width:800px; height: 85px;"> -->
        
        <td>
         <textarea rows="4" cols="130" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
       </td>
         <td>
       <button type="button" id="btnReply">내용 입력</button>
       </td>
  <!--   </div> -->
   </table>
      
    </form>
    
    <div id="listReply" >
    	
    </div>
      
     
      
      
 


</body>
   <%@include file="/jsp/common/footer.jsp"%>
</html>