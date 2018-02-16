<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h1>Filter</h1>
<c:url var="filterBooks" value="/books"/>
<c:set var="numSize" value="20"/>
<c:set var="stringSize" value="48"/>

<form:form action="${filterBooks}" modelAttribute="filter">
    <table>
        <tr>
            <td>
                <form:label path="printYearStart">
                    <spring:message text="Print Year from"/>
                </form:label>
            </td>
            <td>
                <form:input path="printYearStart"
                            size="${numSize}"
                            pattern="\d*"
                            title="positive number"/>
            </td>
            <td>
                <form:label path="printYearEnd">
                    <spring:message text="to"/>
                </form:label>
            </td>
            <td>
                <form:input path="printYearEnd"
                            size="${numSize}"
                            pattern="\d*"
                            title="positive number"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="title">
                    <spring:message text="Title contains"/>
                </form:label>
            </td>
            <td colspan="3">
                <form:input path="title"
                            size="${stringSize}"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="author">
                    <spring:message text="Author"/>
                </form:label>
            </td>
            <td colspan="3">
                <form:input path="author"
                            size="${stringSize}"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="readAlready">
                    <spring:message text="Already read"/>
                </form:label>
            </td>
            <td>
                <form:checkbox path="readAlready"/>
            </td>
        </tr>
        <tr>
                <%--SET FIRST PAGE AFTER FILTERING--%>
            <td>
                <input type="hidden"
                       name="page"
                       value="${1}"/>
                <input type="submit"
                       value="<spring:message text="Filter Books"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>