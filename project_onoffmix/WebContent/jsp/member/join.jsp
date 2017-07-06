<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel="stylesheet" href="${path}/css/common.css" />
</head>

<body>
	<%@include file="/jsp/common/navi.jsp"%>
	<div class="jumbotron"
		style="margin-top: -20px; border-bottom: 0.5px solid #a6a6a6; padding-left: 30px">
		<ul class="list-inline">
			<li style="color: #4195f5;" class="h1">온오프믹스</li>
			<li class="h2">에 오신것을 환영합니다</li>
		</ul>
		<p>간단한 절차에 맞게 기본 정보를 입력해 주시면 회원가입이 완료됩니다.</p>
	</div>
	<div class="container">

		<div class="row text-center">
			<form action="join" method="post" class="form-horizontal top-buffer center-block" id="joinForm" name="joinForm">
				<div class="form-group">
					<a href="#"><img src="${path}/images/basic.PNG"
						class="img-rounded" alt="Cinque Terre" id="imgSetter" width="200"
						height="200"></a>
				</div>
				<div class="hidden">
					<input type="file" name="photo" id="btnPhoto"
						accept="image/gif, image/jpeg, image/png">
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">ID</label>
					<div class="col-xs-6">
						<input id="email" type="text" class="form-control nessesary"
							name="id" placeholder="ID">
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
					<label class="col-xs-3 control-label">Name</label>
					<div class="col-xs-6">
						<input id="name" type="text" class="form-control nessesary"
							name="name" placeholder="Name">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-xs-3 control-label">Email</label>
					<div class="col-xs-6">
						<input id="email" type="text" class="form-control" name="email"
							placeholder="Email">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">Phone</label>
					<div class="col-xs-6">
						<input id="phone" type="text" class="form-control" name="phone"
							placeholder="Phone">
					</div> 
				</div>
				<div class="form-group top-double-buffer">
					<a href="#" class=" btn btn-md btn-primary col-xs-6" id="btnSubmit"
						style="float: none" >Join</a>

				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#imgSetter").on("click", function() {
		$("#btnPhoto").click();
	});
	$("#btnPhoto").on("change", function(response) {
		var tmppath = URL.createObjectURL(this.files[0]);
		console.log(tmppath);
		$("#imgSetter").attr('src', tmppath);
	//alert(this.files[0]);
	});
	$("#btnSubmit").on("click", function() {
		$("#joinForm").find('input.nessesary').each(function() {
			if ($(this).val() =="") {
				$(this).parents('.form-group').addClass("has-error");
			} else {
				$(this).parents('.form-group').removeClass("has-error");				
			}
		});
		$("#joinForm").submit();
	});
</script>
</html>