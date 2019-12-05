<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/nav.jsp"%>


<!-- Page Header -->
<header class="masthead"
	style="background-image: url('img/home-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1>Clean Blog</h1>
					<span class="subheading">A Blog Theme by Start Bootstrap</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
		
			<div class="clearfix">
				<a class="btn btn-primary float-right" href="/board/writeForm">Posting&rarr;</a>
			</div>
			
			<c:forEach var="board" items="${boards}">
			
			<div class="post-preview">
				<a href="/board/${board.id}">
					<h2 class="post-title">${board.title}</h2>
					<h3 class="post-subtitle"
							style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.content }</h3>
					</a>
				<p class="post-meta">
					<img src="${board.userProfile }" class="rounded-circle" width="30px" height="30px"> Posted by <a href="#">${board.username}</a>${board.createDate}
				</p>
			</div>
			<hr>
			</c:forEach>
			
			<!-- Pager -->
			<div class="clearfix">
				<a class="btn btn-primary float-right" href="#">Older Posts
					&rarr;</a>
			</div>
		</div>
	</div>
</div>





<%@ include file="include/footer.jsp"%>