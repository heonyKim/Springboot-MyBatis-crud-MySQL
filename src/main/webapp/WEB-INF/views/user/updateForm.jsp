<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<!-- Page Header -->
<header class="masthead"
	style="background-image: url('img/contact-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="page-heading">
					<h1>Profile :)</h1>
					<span class="subheading">프로필 수정이 필요하세요?</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">


	<!-- 프로필 DIV캡처 저장 -->
<%-- 			<div class="card" style="width: 400px">
				<div id="downloadImage">
				<img class="card-img-top" id="userProfilePreview"
					src="${sessionScope.user.userProfile }" alt="Card image">
				</div>
				<div class="card-body">

						<input class="btn btn-primary" type="file" name="profileImg"
							id="profileImg">

						<p class="card-text">
							이미지를 클릭하시면<br>사진을 변경 할 수 있습니다.
						</p>

						<button type="button" onClick="fileUpload()"
							class="btn btn-primary" id="saveImg">이미지 저장</button>
				</div>
			</div>
 --%>
			
<%-- 

			<div class="card" style="width: 400px">
				<img class="card-img-top" id="userProfilePreview"
					src="${sessionScope.user.userProfile }" alt="Card image">

				<div class="card-body">
					<form id="ajaxForm" method="post">
						<input class="btn btn-primary" type="file" name="profileImg"
							id="profileImg">

						<p class="card-text">
							이미지를 클릭하시면<br>사진을 변경 할 수 있습니다.
						</p>

						<button type="button" onClick="fileUpload()"
							class="btn btn-primary">이미지 저장</button>
					</form>
				</div>
			</div>

 --%>




			<br> <br>
			<form id="updateForm" action="/user/update" method="POST" novalidate>
				<input type="hidden" name="id" value="${sessionScope.user.id }">

				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>username</label> <input type="text" class="form-control"
							placeholder="username" name="username"
							value="${sessionScope.user.username }" id="username" required
							data-validation-required-message="아이디를 입력하세요." readonly>
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
						<label>email</label> <input type="email" class="form-control"
							placeholder="email" name="email"
							value="${sessionScope.user.email }" id="email" required
							data-validation-required-message="이메일을 입력하세요.">
						<p class="help-block text-danger"></p>
					</div>
				</div>

				<br>
				<div id="success"></div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary"
						id="sendMessageButton">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>




<!--------------- script area --------------->
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#userProfilePreview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);

		}
	}

	$("#profileImg").change(function() {
		readURL(this);
	});

	</script>

	<script>
	$(function(){
   		$("#saveImg").click(function() { 
       	 html2canvas($("#downloadImage"), {
       	     onrendered: function(canvas) {
       	         canvas.toBlob(function(blob) {
       	             saveAs(blob, 'testFile.png');
       	             alert("success");
       	         });
       	     }
       	 });
    	});
	});
	</script>



<!-- aJax 파일 전송  -->
<!-- 
<script>
	function fileUpload() {
							
		var form = $("#ajaxForm")[0];
		var formData = new FormData(form);
							
		$.ajax({
			url:"/uploadImg",
			type:"POST",
			processData:false,
			contentType:false,
			data:formData,
			success:function(data){
			alert("성공 "+data)
			}
			});
	}
						
</script>
 -->
<!-- -------------------------------------- -->






<%@ include file="../include/footer.jsp"%>