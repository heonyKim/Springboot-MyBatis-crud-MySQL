<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<!-- Page Header -->
<header class="masthead"
	style="background-image: url('/img/join-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="page-heading">
					<h1>Join US :)</h1>
					<span class="subheading">회원가입</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">

			<form id="joinForm" name="joinForm" action="/user/join" method="POST" onsubmit="return joinFormCheck()" novalidate>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>username</label> <input type="text" class="form-control"
							placeholder="username" name="username" id="username" required
							data-validation-required-message="아이디를 입력하세요.">
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
							<input type="button" style="background:#585858;border-radius:0px; padding:8px 20px;color:#ffffff; display:inline-block; text-align:center;" id="idCheck" value="중복확인">
						<p class="help-block text-danger"></p>
					</div>
				</div>
				

				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>password</label> <input type="password"
							class="form-control" placeholder="password" name="password"
							id="password" required
							data-validation-required-message="비밀번호를 입력하세요.">
						<p class="help-block text-danger"></p>
					</div>
				</div>

				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>passwordCheck</label> <input type="password"
							class="form-control" placeholder="password Check"
							id="passwordCheck" required
							data-validation-required-message="비밀번호를 입력하세요.">
						<p class="help-block text-danger"></p>
					</div>
				</div>

				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						<p class="help-block text-danger"></p>
					</div>
				</div>


				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>email</label> <input type="email" class="form-control"
							placeholder="email" name="email" id="email" required
							data-validation-required-message="이메일을 입력하세요.">
						<p class="help-block text-danger"></p>
					</div>
				</div>



				<br>
				<div id="success"></div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary"
						id="sendMessageButton">가입</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>

 	function joinFormCheck(){
 	 	var password = document.querySelector("#password");
 	 	var passwordCheck = document.querySelector("#passwordCheck");
 	 	
 		if(password.value!=passwordCheck.value){
 			password.focus;
 			alert("비밀번호를 확인하세요.")
 			return false;
 		}else{
 			return true;
 		}
 	}
 	

 	$(function(){
 		$("#idCheck").click(function(){
 			var username=$("#username").val();
 			
 			$.ajax({
 				async:true,
 				type:"post",
 				data:username,
 				url:"/user/join/IdCheck",
 				dataType:"json",
 				contentType:"application/json; charset=UTF-8",
 				success:function(data){
 					if(data!=1){
 						alert("사용가능한 아이디 입니다.");
 					}else{
 						alert("이미 존재하는 아이디 입니다.");
 					}
 				},
 				error:function(error){
 					alert("아이디를 입력하세요");
 				}
 			});			
 		});
 	});
 	
 	
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#password").val();
			var pwd2 = $("#passwordCheck").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
		
	});
	
	
	
</script>


<%@ include file="../include/footer.jsp"%>