<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>도서 리스트 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
	#book_view{
		border: 1px solid black;
	}
	
	.book_box{
		width:50%;
		margin-bottom: 10px;
		text-align: center;
		padding: 0.5em;
	}
	
	.book-button{
		width: 50px;
		padding: 0.2em;
	}
</style>
<script>

$(function(){
	$("#book-update").click(function(){
		let id = ${bookVO.b_id}
		location.href ="<c:url value='book_update'/>" +"?id=" +id
		//뒤로가기
	})
	
	$("#book-delete").click(function(){
		
		let id = ${bookVO.b_id}
		if(confirm("게시물을 삭제할까요?")){
			location.replace("<c:url value='book_delete'/>" + "?id=" + id)
			// 뒤로가기
		}
	})
	
})

</script>
</head>
<body>
	<article id="book_view" class="book_box">
	<h3>${bookVO.b_id}</h3>
	<p>사용자 ID : ${bookVO.b_userid}</p>
	<p>도서 코드 : ${bookVO.b_isbn}</p>
	<p>도서 제목 : ${bookVO.b_title}</p>
	<p>독서 일자 : ${bookVO.b_date}</p>
	<p>독서록 : ${bookVO.b_text}</p>
	</article>
	<div class="book-box">
	<button type="button" class="book-button" id="book-update">편집</button>
	<button type="button" class="book-button" id="book-delete">삭제</button>
	</div>
	
	</article>
</body>