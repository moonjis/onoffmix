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
			<li style="color: #4195f5;" class="h1">Login</li>			
		</ul>
		
	</div>
	<div class="container">
		<div class="row text-center">
			<form action="login" method="post" class="form-horizontal top-buffer center-block" id="loginForm" name="loginForm">				
				<div class="form-group">
					<label class="col-xs-3 control-label">ID</label>
					<div class="col-xs-6">
						<input id="data_id" type="text" class="form-control nessesary"
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
				<div class="form-group top-double-buffer">
					<a href="#" class=" btn btn-md btn-primary col-xs-6" id="btnSubmit"
						style="float: none" >Login</a>

				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
if ("${msg}" != "") {
	alert("${msg}");		
}
	$("#btnSubmit").on("click", function() {
		var bool_reject = false;
		$("#joinForm").find('input.nessesary').each(function() {
			if ($(this).val() =="") {
				$(this).parents('.form-group').addClass("has-error");
				bool_reject = true;
			} else {
				$(this).parents('.form-group').removeClass("has-error");				
			}
		});
		if(!bool_reject){
			//submit
			$("#loginForm").submit();
		}
		
	});
	
</script>
</html>