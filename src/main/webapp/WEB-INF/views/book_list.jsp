<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border-collapse:collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid lightgreen;
}

tr{
	border: 1px solid green;
}

td{
	text-align: center;
}

td,th{
	padding: 8px 8px;
	vertical-align: top;
}
</style>
<script>
	
</script>
</head>
<body>
<table>
	<tr>
	<th>NO</th>
	<th>사용자ID</th>
	<th>도서코드</th>
	<th>도서제목</th>
	<th>독서일자</th>
	<th>별점</th>
	</tr>
	<c:choose>
	<c:when test="${empty BOOKS}">
	<tr><td colspan=6>책 목록이 없습니다</td></tr>
	</c:when>
		<c:otherwise>
		<c:forEach var="book" items="${BOOKS}">
		<tr class="book_tr">
		<td>${book.b_id}</td>
		<td>${book.b_userid}</td>
		<td>${book.b_isbn}</td>
		<td>${book.b_title}</td>
		<td>${book.b_date}</td>
		<td>${book.b_star}</td>
		<td>${book.b_text}</td>
		
		</tr>
		</c:forEach>
		</c:otherwise>
		
	</c:choose>
</table>

</body>
</html>