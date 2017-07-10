<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>id : ${id }, name : ${name}, tel : ${tel }, email: ${email}</title>
<link rel="stylesheet" href="../css/room.css">
<script src=""></script>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCr4twUOUTc8amgDmnzl6GkNPS6mBxqz94&callback=initMap"></script>
<script src="https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyAyjPu8GiR7EEPLncsIaRfTmgS19CipPPI"></script>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	//[1] 기본값 설정
	$(function(){
		
		$("#file-upload").hide("fast");
		
		$("#setup1").on("click", function() {
			$("#file-upload").click();
		});
		$("#file-upload").on("change", function(response) {
			var tmppath = URL.createObjectURL(this.files[0]);
			console.log(tmppath);
			$("#setup1").attr('src', tmppath);
		//alert(this.files[0]);
		});
		
		
		$(".time").show(); //region 영역 보이기
		$(".time1").hide(); //more...숨기기
		
		//[2] more...클릭시 보이기 및 숨기기
		$(".so").change(function() {
			
			if($(this).is(":checked")){
				 $(".time1").show('3000');
			}else{
				$(".time1").hide('3000');
			}
		
		});
	
		var oEditors = [];
			   // 에디터
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "ir1",
				//SmartEditor2Skin.html 파일이 존재하는 경로
				sSkinURI: "../se2/SmartEditor2Skin.html",	
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,		
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,			
				},
				fCreator: "createSEditor2",
				htParams: { fOnBeforeUnload : function(){}}	
			});
			
		    //전송버튼
		    $("#savebutton").click(function(){
		        //id가 smarteditor인 textarea에 에디터에서 대입
		        oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		        //폼 submit
		        $("#roomForm").submit();
		    });
		
  		
			$("span.tooltip").css({
			    opacity:"0.9",
			    position:"absolute",
			    display:"none"
			});
			
			$("img.point2").mouseover(function(){
			    $("span.tooltip").fadeIn();
			}).mouseout(function(){
			    $("span.tooltip").fadeOut();
			}).mousemove(function(e){
			    $("span.tooltip").css({
				"top":e.pageY+10+"px",
				"left":e.pageX+10+"px"
			    });
			});
		
			
		$("#setup").attr("disabled",true);
		
		$("#setby").change(function(){
			
			if($(this).is(":checked")){
				$("#setup").attr("disabled",false);
				
			
			}else{
				$("#setup").attr("disabled",true);
			}
		
		});
		
	//위도 경도 저장 변수
	//lat : latitude , lng = longitude
		var defaultLatLng ={lat: 37.570439, lng :126.985332}; 
	
		/*브라우저가 geoLocation을 지원하는지 안하는지 검사*/
		
		//window.navigator : 방문자의 브라우저 정보를 포함..
	
		if(navigator.geolocation){ 
			//true 이면 gelocation 지원, false 이면 지원하지 않음
			
			//사용자 현재 위치 받아오기
			//("성공시 콜백","실패시 콜백","현재위치 가져오기 옵션: 시간제한, 정확도")
			navigator.geolocation.getCurrentPosition(success,fail,{timeout:6000, enableHighAccuracy:true }); //사용자 현재위치 가져오기
			
			function success(pos){
				//성공시 콜백함수는 파라미터로 현재 위치를 전달받음
				//coords coordinates 객체  >> 현재 위치를 정의 하는 객체
				//latitude : 위도   longitude: 경도  소수점을 포함하는 숫자
				
				drawMap({lat:pos.coords.latitude , lng:pos.coords.longitude})
				
				
			}
			function fail(){
				//실패 콜백은 파라미터로 에러를 전달 받음
				//1 : 권한없음  2: 위치 확인불가  3: 시간초과
				
				drawMap(defaultLatLng);
			}
			
			
		}else{
			alert("현재위치 사용불가");
			drawMap(defaultLatLng);
		}
	
	//위도 경도 기준으로 맵가져오기
	
		
		/*
			MapTypeId : 
				ROADMAP : 기본 도로뷰  
				SATELLITE 위성이미지 
				HYBRID 일반 뷰와 위성뷰를 섞어서 표시
				TERRAIN 실제지도 표시
		
		*/
	

		function drawMap(latlng){
			//map 객체 생성후, 요소에 출력하기	
			
			var myOptions = {
				zoom: 16,
				center : latlng,
				myTypeId: google.maps.MapTypeId.ROADMAP
			}
			
			var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
			
			var marker = new google.maps.Marker({
				
				position : latlng,
				map : map,
				title : "한빛 교육센터"
			});
			
		}
	
		//searchBtn버튼을 누르면 위도와 경도를 다시 세팅
		$("#searchBtn").click(function(){
			/*
				1. 주소를 검색한다. |           검색form        ||검색버튼|
				2. 검색 버튼을 누르면 위도,경도를 받아오는 api를 이용하여 lat와 lng를 구한다. ->변수로 저장됨
					https://developers.google.com/maps/documentation/geocoding/intro?hl=ko
				3. drawMap('api로 받아온 위도,경도 배열')을 호출 한다. -> drawMap({lat: 37.317625, lng :126.836988})
			*/
			var addr = $("#place").val();
// 			drawMap(geoCode(addr));

			var geocoder;
			
			geocoder = new google.maps.Geocoder();

			geocoder.geocode( { 'address': addr}, function(results, status) {

				if (status == google.maps.GeocoderStatus.OK) {

					var lat = results[0].geometry.location.lat();	//위도
					var lng = results[0].geometry.location.lng();	//경도
					drawMap({lat: lat, lng: lng});	
				} else {
					alert("실패!");
					return;
				}

			});
				
			
			//검색 api 이용하는 부분 변수
			
		});
		
	
	});
	
	function geoCode(addr) {

			var geocoder;
			
			geocoder = new google.maps.Geocoder();

			var latlng = geocoder.geocode( { 'address': addr}, function(results, status) {

				if (status == google.maps.GeocoderStatus.OK) {

					var lat = results[0].geometry.location.lat();	//위도
					var lng = results[0].geometry.location.lng();	//경도
					
					
				} else {
					var lat = "";
					var lng = "";
					
				}
				
				var result = {lat:lat, lng:lng}
				return result;
				
			});
			
			return latlng;

		}
	
</script>

</head>

<body>
	<div id="roomWrap">
		<form action="createRoom" method="post" enctype="multipart/form-data" class="form-horizontal top-buffer center-block" id="roomForm" name="roomForm">
			<div id="roomImg">
				<div>
					<a href="#"><img src="../images/thumbnail_null.jpg" alt="photo" id="setup1" width="170" height="170"></a>
				</div>
				<div>
					<input type="file" name="image" id="file-upload" accept="image/gif, image/jpeg, image/png">
				</div>
			</div>
			<div id="roomTitle">
				<table>
					<tr>
						<td>
							<font size="4">카테고리/모임명</font>
						</td>
					</tr>
					
					<tr>
						<td>
							<select name="category_name">
							<c:forEach var="category" items="${categoryList}">
											<option value="${category.category_name}">${category.category_name}</option>
							</c:forEach>
<!-- 								<option>기타</option> -->
<!-- 								<option>교육</option> -->
<!-- 								<option>강연</option> -->
<!-- 								<option>세미나/레퍼런스</option> -->
<!-- 								<option>문화/예술</option> -->
<!-- 								<option>방송/연예</option> -->
<!-- 								<option>취미활동</option> -->
<!-- 								<option>소모임/친목행사</option> -->
<!-- 								<option>공모전</option> -->
<!-- 								<option>전시회/박람회</option> -->
<!-- 								<option>패션/뷰티</option> -->
<!-- 								<option>이벤트/파티</option> -->
<!-- 								<option>여행</option> -->
<!-- 								<option>후원금 모금</option> -->
							</select>
							<input type="text" name="room_name" placeholder="모임명을 입력해 주세요.">
						</td>
					</tr>
					
					<tr>
						<td>
							<font size="2">* 개설하고자 하는 모임과 어울리는 카테고리/이름으로 입력하면 모임을 찾기가 쉬워집니다.</font>
						</td>
					</tr>
				</table>
			</div>
			
			<div id="roomTime">
				<table>
					<tr>
						<td rowspan="2">
							<font size="4">모임일시</font>
						</td>
						<td>
							<input type="date" name="room_day1">
							<input type="time" name="room_day2"> 부터 &nbsp;&nbsp;&nbsp;
							<input type="date" class="time1" name="room_day3">
							<input type="time" class="time" name="room_day4"> 까지
						</td>
					</tr>
					
					<tr>
						<td>
							<label>
								<input type="checkbox" class="so">
								<font size="2">모임기간이 하루이상일 경우</font>
							</label>
						</td>
					</tr>
				</table>
			</div>
			
			<div id="roomDate">
				<table>
					<tr>
						<td rowspan="2">
							<font size="4">접수기간</font> &nbsp;&nbsp;&nbsp;
						</td>
					
						<td>
							<input style="background: #f8f8f8; border: 1px solid #cccccc; position: relative;" type="date" name="recruit_day1">
							<input style="border: 1px solid #cccccc;" type="time" name="recruit_day2"> 부터 &nbsp;&nbsp;&nbsp;
							<input style="background: #f8f8f8; border: 1px solid #cccccc; position: relative;" type="date" name="recruit_day3">
							<input style="border: 1px solid #cccccc;" type="time" name="recruit_day4"> 까지
						</td>
					</tr>
					<tr>
						<td>
							<font size="2">* 신청 기간에만 모임에 참여 신청 / 취소를 할 수 있습니다.</font>
						</td>
					</tr>
				</table>
			</div>
			
			<div id="roomplace">
				<table>
					<tr>
						<td rowspan="2">
							<font size="4">모임장소</font> &nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" id="place" placeholder="장소를 입력해 주세요." name="location_1">
							<button id="searchBtn" type="button">검색</button>
						</td>	
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<div id="map_canvas" style="width:700px; height:200px; margin-bottom: 10px; "></div>					
						</td>	
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<input style=" border: 1px solid #cccccc; margin-left: 100px; "  type="text" id="place" placeholder="주소를 입력해 주세요." name="location_2">
						</td>
					</tr>
					<tr>
						<td>
							<font size="2" style=" margin-left: 100px; ">
								*상세 주소를 입력해 주시면, 신청자가 모임 장소에 찾아오기가 쉬워집니다.<br>
							</font>
							<font size="2" style=" margin-left: 100px; ">
								ex) [논현역 5번 출구] 서울특별 시 서초구 신반포로 45길 22 은양빌딩 5층 501호
							</font>
						</td>
					</tr>
				</table>
			</div>
			
			<div id="roommember">
				<table>
					<tr>
						<td rowspan="2">
							<font size="4">모임 인원 수</font><font size="2" color="red">(필수)</font> &nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
				<table border="1" style="border: 2px solid #cccccc; border-collapse: collapse; background: #f8f8f8; margin-left: 270px; margin-top: -40px;">
					<tr>
						<td>
							<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 인원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
						</td>
						<td>
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="text-align: center;"  size="5" name="group_capacity">명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</div>
					
				<div id="roommeeting">
					<table>
						<tr>
							<td rowspan="2">
								<font size="4">간단한<br>
											      모임소개 입력</font><font size="2" color="red">(필수)</font> &nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<textarea name="room_introduce" rows="20" cols="20" style=" width: 500px; height: 100px; resize: none; "></textarea>
							</td>
						</tr>
					</table>	
				</div>
				
				<div id="roomdetail">
					<table style=" margin-top: -20px; ">
						<tr>
							<td rowspan="2">
								<font size="4">상세 내용 입력</font><font size="2" color="red">(필수)</font> &nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
					<table style="width: 700px; ">
						<tr>
							<td>
								<textarea rows="10" cols="30" id="ir1" style=" width:100%; " name="room_detail"></textarea>
							</td>
						</tr>					
					</table>
				</div>
				
				<div id="roomnumver">
				<table>
					<tr>
						<td width="200px" height="100px;">
							<font size="4">신청 문의<br>
										       연락처 설정</font><font size="2" color="red">(필수)</font> &nbsp;&nbsp;&nbsp;
						</td>
						<td>
							 <input type="text" style="text-align: center; border: 2px solid #cccccc; width: 100px; height: 25px; "  size="10"  value = "${tel }" readonly="readonly" name="owner_phone">
						</td>
						
<!-- 						<td> -->
<!-- 							<hr  style="width:40px; border: 1px solid #cccccc; "/> -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<input type="text" style="text-align: center; border: 2px solid #cccccc; width: 100px; height: 25px;"  size="7">  -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<hr  style="width:40px; border: 1px solid #cccccc; "/> -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<input type="text" style="text-align: center; border: 2px solid #cccccc; width: 100px; height: 25px;"  size="7">  -->
<!-- 						</td> -->
					</tr>
				</table>
			</div>
			
			<div id="roomemail">
				<table>
					<tr>
						<td width="200px" height="50px;">
							<font size="4">신청 문의<br>
										      에메일 설정</font><font size="2" color="red">(필수)</font> &nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" style="width: 300px; height: 22px; border: 2px solid #cccccc; text-align: center;" value = "${email}" readonly="readonly"  name="owner_email"> 
<!-- 							@ -->
<!-- 							<input type="text" style=" width: 150px; height: 22px; border: 2px solid #cccccc; text-align: center;"> -->
						</td>
					</tr>
				</table>
			</div>
			
			
			<div id="roomstart">
				<input type="submit" value="확인" style=" border-radius: 10px; margin-left: 600px; width: 80px; height: 50px; border: 1px outset #cccccc;">
			</div>
			
			</form>
		</div>	
</body>
</html>