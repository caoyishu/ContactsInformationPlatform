<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>Contacts Information Platform</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        function deleteUser(id) {
            if (confirm("Are you sure?")){
                location.href="${pageContext.request.contextPath}/delUserServlet?id="+id;
            }
        }

        window.onload = function () {
            document.getElementById("delSelected").onclick = function () {
                if (confirm("Are you sure you want to delete the selected contacts? ")) {
                    var flag = false;
                    var cbs = document.getElementsByName("uid");
                    for (var i = 0; i < cbs.length; i++) {
                        if (cbs[i].checked){
                            flag = true;
                            break;
                        }
                    }
                    if (flag){
                        document.getElementById("form").submit();
                    }
                }
            }
            document.getElementById("firstCb").onclick = function () {
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">Contacts Information</h3>

    <div style="float: left;margin: 5px;">

        <form class="form-inline" action="${pageContext.request.contextPath}/findUserByPageServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName2">Name</label>
                <input type="text" name="name" value="${condition.name[0]}" class="form-control" id="exampleInputName2" >
            </div>
            <div class="form-group">
                <label for="exampleInputName3">Nationality</label>
                <input type="text" name="nationality" value="${condition.natnionality[0]}" class="form-control" id="exampleInputName3" >
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2">Email</label>
                <input type="text" name="email" value="${condition.email[0]}" class="form-control" id="exampleInputEmail2"  >
            </div>
            <button type="submit" class="btn btn-default">Discover</button>
        </form>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">Add New</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">Delete Selected</a>

    </div>
    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th><input type="checkbox" id="firstCb"></th>
            <th>Number</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Nationality</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Edit</th>
        </tr>

        <c:forEach items="${pb.list}" var="user" varStatus="s">
            <tr>
                <td><input type="checkbox" name="uid" value="${user.id}"></td>
                <td>${s.count}</td>
                <td>${user.name}</td>
                <td>${user.gender}</td>
                <td>${user.age}</td>
                <td>${user.nationality}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">Modify</a>&nbsp;<a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id})">Delete</a></td>
            </tr>

        </c:forEach>

    </table>
    </form>

    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pb.currentPage == 1}">
                    <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage != 1}">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage - 1}&rows=10&&name=${condition.name[0]}&nationality=${condition.nationality[0]}&email=${condition.email[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                    <c:if test="${pb.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=10&name=${condition.name[0]}&nationality=${condition.nationality[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=10&name=${condition.name[0]}&nationality=${condition.nationality[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                </c:forEach>

                 <c:if test="${pb.currentPage == pb.totalPage}">
                    <li class="disabled">
                 </c:if>
                 <c:if test="${pb.currentPage != pb.totalPage}">
                    <li>
                 </c:if>
                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage + 1}&rows=10&&name=${condition.name[0]}&nationality=${condition.nationality[0]}&email=${condition.email[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">
                    ${pb.totalCount} Contacts / ${pb.totalPage} Pages
                </span>

            </ul>
        </nav>


    </div>


</div>


</body>
</html>
