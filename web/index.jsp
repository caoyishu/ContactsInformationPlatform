<%--
  Created by IntelliJ IDEA.
  User: Chaoyi Wang
  Date: 2019/11/26
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Welcome</title>

  <!-- 1. 导入CSS的全局样式 -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
  <script src="js/jquery-2.1.0.min.js"></script>
  <!-- 3. 导入bootstrap的js文件 -->
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
  </script>
</head>
<body>


<div class="jumbotron" align="center">
  <h1 >Welcome, ${user.name}!</h1>
  <p>Welcome to this platform. In this platform, you are able to add, edit, delete or view contacts information by simply clicking the button below:)</p>
  <p><a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/findUserByPageServlet" style="text-decoration:none;font-size:28px" role="button">Discover</a></p>
</div>


