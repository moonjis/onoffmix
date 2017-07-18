<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${path}"><strong>OnOffmix.com</strong></a></li>
				<li><a href="${path}/room/roomList">
				<span class="glyphicon glyphicon-th-list"></span></a></li>
				<c:choose>
					<c:when test="${member.name != null}">
						<li><a href="${path}/member/mypage"><span class="white underline">"${member.name}" 님</span></a></li>
						<li><a href="${path}/member/logout">logout</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${path}/member/join">join</a></li>
						<li><a href="${path}/member/login">login</a></li>
					</c:otherwise>
				</c:choose>
<!-- 				<li><a href="room/roomForm">모임 개설</a></li> -->
			</ul>
		</div>
	</div>
</nav>