<%--
  Created by IntelliJ IDEA.
  User: Chaoyi Wang
  Date: 2019/11/26
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Modify Contact</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="container" style="width: 400px";>
    <h3 style="text-align: center;">Modify Contact</h3>
    <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">
        <input type="hidden" name="id" value="${user.id}">
        <div class="form-group">
            <label for="name">Name: </label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly="readonly" placeholder="Pleas Enter Name" />
        </div>

        <div class="form-group">
            <label>Gender: </label>
            <c:if test="${user.gender == 'Male'}">
                <input type="radio" name="gender" value="Male" checked="checked" />Male
                <input type="radio" name="gender" value="Female"  />Female
            </c:if>
            <c:if test="${user.gender == 'Female'}">
                <input type="radio" name="gender" value="Male"  />男
                <input type="radio" name="gender" value="Female" checked="checked" />女
            </c:if>
        </div>

        <div class="form-group">
            <label for="age">Age: </label>
            <input type="text" class="form-control" id="age"  name="age" value="${user.age}" placeholder="Please Enter Age" />
        </div>

        <div class="form-group">
            <label for="nationality">Nationality: </label>
            <select name="nationality" id="nationality" class="form-control" >
                <c:if test="${user.nationality == 'Australian'}">
                    <option value="Australian" selected>Australian</option>
                    <option value="Chinese">Chinese</option>
                    <option value="Canadian">Canadian</option>
                </c:if>
                <c:if test="${user.nationality == 'Chinese'}">
                    <option value="Australian" >Australian</option>
                    <option value="Chinese" selected>Chinese</option>
                    <option value="Canadian">Canadian</option>
                </c:if>
                <c:if test="${user.nationality == 'Canadian'}">
                    <option value="Australian" >Australian</option>
                    <option value="Chinese" >Chinese</option>
                    <option value="Canadian" selected>Canadian</option>
                </c:if>
            </select>
        </div>

        <div class="form-group">
            <label for="phone">Phone：</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" placeholder="Please Enter Phone Number"/>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" id="email" class="form-control" name="email" value="${user.email}"placeholder="Please Enter Email Address"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="Submit" />
        </div>
    </form>
</div>
</body>
</html>