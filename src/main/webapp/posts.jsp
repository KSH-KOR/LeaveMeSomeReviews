<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>LeaveMeSomeReviews</title>
<style>
.box-container{
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	width: 100%;
}
.box{
	width: 500px;
	box-shadow: 2px 2px 30px #202020;
	background-color: #dddddd;
	padding: 20px;
	margin: 15px;
	cursor: pointer;
}
.profile-img{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	overflow: hidden;
	margin-right: 10px;
}
.profile-img img{
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
}
.profile{
	display: flex;
}
.name-user{
	display: flex;
	flex-direction: column;
}
.title strong{
	color: #252525;
	font-size: 1.1rem;
	letter-spacing: 0.5px;
}
.review{
	color: darkorange;
}
.box-top{
	display:flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}
.context{
	font-size:0.9rem;
}
.box-bottom{
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
	margin-bottom: 5px;
}
.buttons{
	display: flex;
}
.buttons a{
	margin: 0px 5px;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>

<c:forEach items="${list}" var="u">
	<div class="box-container">
		<div class="box">
			<div class = "box-top">
				<div class="profile">
					<div class="profile-img">
                            <img src="${pageContext.request.contextPath}/upload/${u.getProfilePicture() == null ? "defaultImage.png" : u.getProfilePicture()}">
					</div>
					<div class="name-user">
						<strong>${u.getWriter()}</strong>
						<span>ID: ${u.getSeq()}</span>
					</div>

				</div>
				<div class="title"><strong>${u.getTitle()}</strong></div>
				<div class="review">
					<span>rate: ${u.getRate()}</span>
				</div>
			</div>

			<div class="context">
				<p>${u.getContent()}</p>
			</div>
			<div class="box-bottom">
				<div class="post-date">${u.getRegdate()}</div>
				<div class="buttons">
					<a href="editform.jsp?id=${u.getSeq()}">Edit</a>
					<a href="javascript:delete_ok('${u.getSeq()}')">Delete</a>
				</div>
			</div>
		</div>

	</div>
	<!--
	<tr>
		<td>${u.getSeq()}</td>
		<td>${u.getTitle()}</td>
		<td>${u.getWriter()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
	</tr>
	-->
</c:forEach>

</body>
</html>