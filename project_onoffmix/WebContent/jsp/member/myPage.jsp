<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="room_img_path"
	value="${pageContext.request.contextPath }/images/room/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/css/common.css" />
<style type="text/css">
.container{
		height:680px;
	}
</style>
</head>

<body>
	<%@include file="/jsp/common/navi.jsp"%>
	<div class="container">
		<div class="row text-center top-double-buffer">
			<div class="col-sm-5 sidenav top-double-buffer">
				<form action="edit" method="post" enctype="multipart/form-data"
					class="form-horizontal top-buffer center-block" id="editForm"
					name="editForm">
					<div class="form-group">
						<a href="#"><img src="${path}/images/member/${attr_member.photo}"
						onError="this.src='${path}/images/basic.PNG'"
							class="img-rounded" alt="Cinque Terre" id="imgSetter" width="150"
							height="150"></a>
					</div>
					<div class="hidden">
						<input type="file" name="photo" id="btnPhoto"
							accept="image/gif, image/jpeg, image/png">
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">Name</label>
						<div class="col-xs-6">
							<input id="data_name" type="text" value="${attr_member.name}"
								class="form-control nessesary" name="name" placeholder="Name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">Password</label>
						<div class="col-xs-6">
							<input id="password" type="password"
								class="form-control nessesary" name="pass"
								placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">Email</label>
						<div class="col-xs-6">
							<input id="email" type="text" value="${attr_member.email}"
								class="form-control" name="email" placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">Phone</label>
						<div class="col-xs-6">
							<input id="phone" type="text" value="${attr_member.phone}"
								class="form-control" name="phone" placeholder="Phone">
						</div>
					</div>
					<div class="form-group top-double-buffer">
						<a href="#" class=" btn btn-md btn-primary col-xs-6"
							id="btnSubmit" style="float: none">Edit</a>
					</div>
				</form>
			</div>
			<div class="col-sm-7">
				<ul class="nav nav-tabs" id="tab_list">
					<li class="active" data-type="create"><a data-toggle="tab"
						href="#create">개설한 모임</a></li>
					<li data-type="join"><a data-toggle="tab" href="#join">참여한
							모임</a></li>
				</ul>
				<div class="tab-content">
					<div id="create" class="tab-pane fade in active top-double-buffer">
						<div class="top-buffer">
							<div class="row" id="listDivCreate">
								
							</div>
							<div class="row hidden emptyDiv">
									<h3>생성한 모임이 없습니다.</h3>
									<p>
										많은 사람들과 함께할 <a href="${path}/room/roomForm">다양한 모임</a>을 만들어보세요!
									</p>
								</div>
						</div>
					</div>
					<div id="join" class="tab-pane fade top-double-buffer">
						<div class="row" id="listDivJoin">
							
						</div>
						<div class="row hidden emptyDiv">
								<h3>참여한 모임이 없습니다.</h3>
								<p>
									지금 모임에 참여해보세요! <a href="${path}/room/roomList">다양한 모임</a>이 준비되어
									있습니다.
								</p>
							</div>
					</div>
					<ul id="pagination" class="pagination">

					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-4 hidden" id="template_room">
		<div class="thumbnail content_box roomBox">
			<img class="tr_image" onError="${path}/images/onoffmix1.PNG" alt="...">
			<div class="caption">
				<h3 class="tr_title"></h3>
				<p class="tr_description">
				</p>
			</div>
		</div>
	</div>
</body>
<%@include file="/jsp/common/footer.jsp"%>
<script type="text/javascript">
	//텝누르면 리스트 바뀌는지 확인!!!
	$("#btnSubmit").on("click", function() {
		var bool_reject = false;
		$("#editForm").find('input.nessesary').each(function() {
			if ($(this).val() == "") {
				$(this).parents('.form-group').addClass("has-error");
				bool_reject = true;
			} else {
				$(this).parents('.form-group').removeClass("has-error");
			}
		});
		if (!bool_reject) {
			//submit
			updateMember();
		}
	});
	
	function updateMember(){
		var $editForm = $("#editForm");
		$.ajax({
			url:'edit',
			data : $editForm.serialize(),
			method : 'POST',
			success : function(response){
				alert("업데이트 되었습니다."); 
			}
		});
	}
	
	$("#tab_list").on("click","li",function(){
		listType = $(this).attr("data-type");
		console.log(listType);
		getList(1);
	});
	$(function() {
		getList(1);
	});
	var listType = "create";
	function getList(page) {
		$.ajax({
			url : "myroomlist",
			data : {
				page : page,
				type : listType
			},
			success : function(response) {
				var $listDiv;
				if(listType == 'create'){
					$listDiv = $("#listDivCreate");
				}else if(listType == 'join'){
					$listDiv = $("#listDivJoin");
				}
				$listDiv.empty();
				for (var idx in response.list) {
					$listDiv.append(makeRow(response.list[idx]));
				}
				//empty시 처리
				if(response.list.length == 0){
					$listDiv.next('.emptyDiv').removeClass("hidden");
				}
				//페이징 처리하기
				makePagination(response.firstPage, response.lastPage,response.nowPage);
			}
		});
	}

	function makePagination(firstPage, lastPage,nowPage) {
		var $pagination = $("#pagination");
		$pagination.empty();
		for (var i = firstPage; i <= lastPage; i++) {
			var $li = $('<li />',{
				click : function(e) {
					e.preventDefault();
					if ($(this).hasClass("active")) {
						$(this).removeClass("active");
					} else {
						$(this).addClass("active");
					}
				}
			});
			$pagination.append($li);
			var $a = $('<a />', {
				href : '#',
				text : i,
				click : function(e) {
					getList($(this).text());
				}
			});
			if (nowPage == i) {	
				$li.addClass("active");
			}
			$li.append($a);

		}
	}

	function makeRow(row_info) {
		var $newRow = $("#template_room").clone();
		$newRow.find(".tr_image").attr("src", "${room_img_path}" + row_info.fullname);
		$newRow.find(".tr_title").text(row_info.room_name);
		$newRow.find(".tr_description").text(row_info.room_introduce);
		$newRow.on("click", function() {
			location.href = "${path}/room/roomView?num=" + row_info.room_num
		})

		$newRow.removeClass("hidden");
		return $newRow;
	}
</script>
</html>