<%--
  Created by IntelliJ IDEA.
  User: Chaoyi Wang
  Date: 2019/11/26
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Add Contacts</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <center><h3>Add a Contact</h3></center>
    <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
        <div class="form-group">
            <label for="name">Name: </label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Please Enter Name">
        </div>

        <div class="form-group">
            <label>Gender: </label>
            <input type="radio" name="gender" value="Male" checked="checked"/>Male
            <input type="radio" name="gander" value="Female"/>Female
        </div>

        <div class="form-group">
            <label for="age">Age: </label>
            <input type="text" class="form-control" id="age" name="age" placeholder="Please Enter Age">
        </div>

        <div class="form-group">
            <label for="nationality">Nationality:</label>
            <select name="nationality" class="form-control" id="nationality">
                <option value="Australian">Australian</option>
                <option value="Chinese">Chinese</option>
                <option value="Canadian">Canadian</option>
            </select>
        </div>

        <div class="form-group">
            <label for="phone">Phone：</label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="Please Enter Phone Number"/>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="Please Enter Email Address"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="Submit" />
        </div>
    </form>
</div>
</body>
</html>