<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Manager</title>

    <style type="text/css">
        .tHead {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
            background-color: #f9f9f9
        }

        .tHead td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tHead th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tAddFilter {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: white;
        }

    </style>
</head>
<body bgcolor="#dcdcdc">
<table width="100%">
    <tr>
        <td width="20%"></td>
        <td width="60%" bgcolor="white">
            <table class="tAddFilter" width="100%">
                <tr>
                        <%--ADD PAGE--%>
                    <td width="50%">
                        <jsp:include page="add.jsp"/>
                    </td>
                        <%--FILTER PAGE--%>
                    <td width="50%">
                        <jsp:include page="filter.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h1>List of books</h1>
                    </td>
                </tr>
                <tr>
                        <%--PAGING MENU--%>
                    <td colspan="2">
                        <jsp:include page="paging.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table class="tHead" width="100%">
                            <tr>
                                <th width="30">ID</th>
                                <th width="100">Title</th>
                                <th width="240">Description</th>
                                <th width="60">Author</th>
                                <th width="40">Print year</th>
                                <th width="70">ISBN</th>
                                <th width="40">Already ridden</th>
                                <th width="70">Edit</th>
                                <th width="40">Delete</th>
                            </tr>
                            <c:if test="${!empty listBooks}">
                                <c:forEach items="${listBooks}"
                                           var="book">
                                    <tr>
                                        <td>${book.id}</td>
                                        <td>${book.title}</td>
                                        <td>${book.description}</td>
                                        <td>${book.author}</td>
                                        <td>${book.printYear}</td>
                                        <td>${book.isbn}</td>
                                        <td>
                                            <c:if test="${true == book.readAlready}">
                                                <img src="/resources/check.png"/>
                                            </c:if>
                                        </td>
                                        <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a> | <a href="<c:url value='/read/${book.id}'/>">Read</a></td>
                                        <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </table>
                    </td>
                </tr>
                <tr>
                        <%--PAGING MENU--%>
                    <td colspan="2">
                        <jsp:include page="paging.jsp"/>
                    </td>
                </tr>
            </table>
        </td>
        <td width="20%"></td>
    </tr>
</table>
</body>
</html>
