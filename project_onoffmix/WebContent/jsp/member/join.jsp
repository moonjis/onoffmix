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
	<div class="jumbotron" style="margin-top: -20px; border-bottom: 0.5px solid #a6a6a6; padding-left:30px">
		<ul class="list-inline">
			<li style="color: #4195f5;" class="h1">
				온오프믹스
			</li>
			<li class="h2">에 오신것을 환영합니다</li>
		</ul>
		<p>간단한 절차에 맞게 기본 정보를 입력해 주시면 회원가입이 완료됩니다.</p>
	</div>
	<div class="container">

		<div class="row text-center">
			<form class="form-horizontal top-buffer">
				<div class="form-group">
					<label class="col-xs-3 control-label">ID</label>
					<div class="col-xs-6">
						<input id="email" type="text" class="form-control  col-xs-5"
							name="id" placeholder="ID">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">Password</label>
					<div class="col-xs-6">
						<input id="password" type="password" class="form-control col-xs-5"
							name="pw" placeholder="Password">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">Name</label>
					<div class="col-xs-6">
						<input id="name" type="text" class="form-control col-xs-5"
							name="name" placeholder="Name">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">Email</label>
					<div class="col-xs-6">
						<input id="email" type="text" class="form-control col-xs-5"
							name="email" placeholder="Email"> 
					</div>
				</div>
				<div class="form-group text-center top-buffer">
					<a href="#" class=" btn btn-md btn-primary col-xs-5" style="float:none">Join</a>
				</div>
			</form> 
		</div>
	</div>
</body>
</html>