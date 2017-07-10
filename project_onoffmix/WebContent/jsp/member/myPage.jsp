<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}
</style>
</head>

<body>
	<%@include file="/jsp/common/navi.jsp"%>
	<div class="container">

		
		<div class="row text-center top-double-buffer">
		<div class="col-sm-5 sidenav top-double-buffer">
			<form action="edit" method="post" enctype="multipart/form-data" class="form-horizontal top-buffer center-block" id="joinForm" name="joinForm">
				<div class="form-group">
					<a href="#"><img src="${path}/images/basic.PNG"
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
						<input id="data_name" type="text" value="${attr_member.name}" class="form-control nessesary"
							name="name" placeholder="Name">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">Password</label>
					<div class="col-xs-6">
						<input id="password" type="password"
							class="form-control nessesary" name="pass" placeholder="Password">
					</div>
				</div>				
				<div class="form-group">
					<label class="col-xs-3 control-label">Email</label>
					<div class="col-xs-6">
						<input id="email" type="text" value="${attr_member.email}" class="form-control" name="email"
							placeholder="Email">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">Phone</label>
					<div class="col-xs-6">
						<input id="phone" type="text" value="${attr_member.phone}" class="form-control" name="phone"
							placeholder="Phone">
					</div> 
				</div>
				<div class="form-group top-double-buffer">
					<a href="#" class=" btn btn-md btn-primary col-xs-6" id="btnSubmit"
						style="float: none">Edit</a>
				</div>
			</form>
			</div>
			<div class="col-sm-7">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#create">개설한 모임</a></li>
					<li><a data-toggle="tab" href="#join">참여한 모임</a></li>
				</ul>
				<div class="tab-content">
					<div id="create" class="tab-pane fade in active top-double-buffer">
						<h3>create</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
					<div id="join" class="tab-pane fade top-double-buffer">
						<h3>join</h3>
						<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
							laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="/jsp/common/footer.jsp"%>
<script type="text/javascript">
	if ("${msg}" != "") {
		alert("${msg}");
	}
	$("#btnSubmit").on("click", function() {
		var bool_reject = false;
		$("#joinForm").find('input.nessesary').each(function() {
			if ($(this).val() == "") {
				$(this).parents('.form-group').addClass("has-error");
				bool_reject = true;
			} else {
				$(this).parents('.form-group').removeClass("has-error");
			}
		});
		if (!bool_reject) {
			//submit
			$("#loginForm").submit();
		}

	});
</script>
</html>