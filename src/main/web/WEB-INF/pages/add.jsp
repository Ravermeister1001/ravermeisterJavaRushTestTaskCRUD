<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

    </style>
</head>
<body>
<h1>Add a Book</h1>
<c:url var="addAction" value="/books/add"/>
<c:set var="stringSize" value="50"/>

<form:form action="${addAction}" modelAttribute="book">
    <table width="100%">
        <c:if test="${!empty book.id}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id"
                                size="${stringSize}"
                                readonly="true"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="title">
                    <spring:message text="Title"/>
                </form:label>
            </td>
            <td>
                <form:input path="title"
                            size="${stringSize}"
                            required="true"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="Description"/>
                </form:label>
            </td>
            <td>
                <form:input path="description"
                            size="${stringSize}"
                            required="true"/>
            </td>
        </tr>

        <c:if test="${book.id == 0}">
        <tr>
            <td>
                <form:label path="author">
                    <spring:message text="Author"/>
                </form:label>
            </td>
            <td>
                <form:input path="author"
                            size="${stringSize}"
                            required="true"/>
            </td>
        </tr>
        </c:if>
        <c:if test="${book.id != 0}">
            <tr>
                <td>
                    <form:label path="author">
                        <spring:message text="Author"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="author"
                                size="${stringSize}"
                                required="true"
                                readonly="true"/>
                </td>
            </tr>
        </c:if>
            <%--        <tr>
            <td>
                <form:label path="readAlready">
                    <spring:message text="Already read"/>
                </form:label>
            </td>
            <td>
                <form:checkbox path="readAlready"/>
            </td>
        </tr>--%>
        <tr>
            <td>
                <form:label path="printYear">
                    <spring:message text="Print year"/>
                </form:label>
            </td>
            <td>
                <form:input path="printYear"
                            size="${stringSize}"
                            required="true"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isbn">
                    <spring:message text="ISBN"/>
                </form:label>
            </td>
            <td>
                <form:input path="isbn"
                            size="${stringSize}"
                            required="true"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty book.title}">
                    <input type="submit"
                           value="<spring:message text="Edit Book"/>"/>
                </c:if>
                <c:if test="${empty book.title}">
                    <input type="submit"
                           value="<spring:message text="Add Book"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>