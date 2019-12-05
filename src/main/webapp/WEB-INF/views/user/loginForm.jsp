<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<!-- Page Header -->
<header class="masthead"
	style="background-image: url('/img/login-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="page-heading">
					<h1>Login Here :D</h1>
					<span class="subheading">로그인</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">

			<form id="joinForm" action="/user/login" method="POST" novalidate>

				<div class="form-group">
					<label for="username">Username:</label> <input type="text"
						class="form-control" placeholder="Enter username" name="username" id="text">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" placeholder="Enter password" name="password" id="password">
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox"> Remember me
					</label>
				</div>
				<button type="submit" class="btn btn-primary float-right">로그인</button>

			</form>
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp"%>