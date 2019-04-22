<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>나의 도서 리스트</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	
	$(function(){
		$(".book_tr").click(function(){
			let id =$(this).attr("data-id")
			location.href="<c:url value='book_view'/>" + "?id=" + id
		})
		
	})
</script>
</script>
</head>
<body>
<!-- varStatus로 i값을 지정해주고 icount로 해야지 1부터의 값이 나온다
		 vo의 pk인 id값으로 하면 임의의 수가 나온다.
		 그리고 아래에서 data-id를 선언해주어야 위에 attr의 값을 받을 수 있다. -->
<table>
	<tr>
	<th>NO</th>
	<th>사용자ID</th>
	<th>도서코드</th>
	<th>도서제목</th>
	<th>독서일자</th>
	<th>별점</th>
	<th>내용</th>
	</tr>
	<c:choose>
	<c:when test="${empty BOOKS}">
	<tr><td colspan=7>책 목록이 없습니다</td></tr>
	</c:when>
		<c:otherwise>
		<c:forEach var="book" items="${BOOKS}" varStatus="i">
		<tr class="book_tr" data-id="${book.b_id}">
		<td>${i.count}</td>
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
<hr/>

</body>
</html>