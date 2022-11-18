<%--
  Created by IntelliJ IDEA.
  User: chzhv
  Date: 2022-11-18
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String filename="";
    int sizeLimit = 15*1024*1024;
    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest =
            new MultipartRequest(
                    request,
                    realPath,
                    sizeLimit,
                    "utf-8",
                    new DefaultFileRenamePolicy()
            );

    filename = multipartRequest.getFilesystemName("profilePicture");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
