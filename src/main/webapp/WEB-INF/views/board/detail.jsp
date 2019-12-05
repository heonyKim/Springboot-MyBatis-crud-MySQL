<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<!-- Page Header -->
<header class="masthead"
	style="background-image: url('../img/post-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="post-heading">
					<h1>${board.title}</h1>
					<span class="meta">Posted by <a href="#">${board.username }</a>
						${board.createDate}
					</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Post Content -->
<article>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">${board.content}</div>
		</div>

		<div class="clearfix">
			<!-- 삭제버튼 -->
			<a class="btn btn-danger float-right" href="/board/delete/${board.id}"><i
				class="fa fa-trash" aria-hidden="true"></i> </a>
			<!-- 수정하기 버튼 -->
			<a class="btn btn-primary float-right" href="/board/updateForm/${board.id}"> <i
				class="fa fa-pencil-square-o" aria-hidden="true"></i>
			</a>
		</div>
	</div>
</article>
<%@ include file="../include/footer.jsp"%>