<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
<table>
    <tr><td>Title:</td><td><input type="text" name="title"/></td></tr>
    <tr><td>Writer:</td><td><input type="text" name="writer"/></td></tr>
    <tr><td>Rate:</td><td><input type="number" name="rate"/></td></tr>
    <tr><td>Picture:</td><td><input type="file" name="profilePicture"/></td></tr>
    <tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
    <tr><td><a href="index.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
</table>
</form>

</body>
</html>