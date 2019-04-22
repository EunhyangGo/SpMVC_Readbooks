<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Insert title here</title>
<style>

.head{
	border: 3px solid green;
	padding: 50px;
	text-align: center;
	color: lightgreen;
	font-size: 30pt;
}


label{
	display: block; /*한개의 라인을 두개의 라인으로 분리*/
	width: 100px;
	float: left; /* 분리된 두개의 라인을 한 라인으로 정렬*/
	
	
	font-weight: bold; /* 글씨체 두껍게*/
	color: green;
	font-size: 11pt;
}

input, textarea{
	display : inline-block;
	width: 85%; /*입력칸 가로넓이 늘리기*/
	
	margin: 3px; /* 입력칸 마다 사이 넓이 늘리기*/
	padding: 8px; /* 입력칸 크기 늘리기*/
	border: 1px solid black;
}

button{
	margin-bottom: 10px;
	width: 120px; /*전송버튼 넓이 늘리기*/
	background-color: green;
	color: white;
	font-size: bold;
	padding: 0.5em; /* 세로 크기가 더 커짐*/
	border: none;

}

button:hover{
	background-color: white;
	color: green;
	border: 1px solid green;
	
}
</style>
<script>
$(function(){
	
	$("#save").click(function(){
		
		var userid = $("#b_userid").val()
		var isbn = $("#b_isbn").val()
		var title = $("#b_title").val()
		var date = $("#b_date").val()
		
		
		alert(userid)
		if(userid ==""){
			alert("사용자 아이디는 반드시 입력해야 합니다")
			$("#b_userid").focus()
			return false;
		}
		
		if(isbn ==""){
			alert("도서코드는 반드시 입력해야 합니다")
			$("#b_isbn").focus()
			return false;
		}
		
		if(title ==""){
			alert("도서제목은 반드시 입력해야 합니다")
			$("#b_title").focus()
			return false;
		}
		
		if(date ==""){
			alert("독서일자는 반드시 입력해야 합니다")
			$("#b_date").focus()
			return false;
		}
		
		let fdata=("form").serialize()
		
		$.ajax({
			url:"<c:url value='book_write'/>",
			method:"post",
			data:fdata,
			success:function(r){
				alert(ok)
			},
			error:function(){
				alert(no)
			}
		})
		
	})

})
</script>
</head>
<body>
<article>
	<h3 class="head">나의 도서 리스트</h3>
</article>
<section>
<!-- value를 book으로 받는다는것은 controller의 book으로 간다는 것. -->
 <form action=<c:url value="book" /> method="POST">
<label for="b_id">ID</label>
<input type="text" name="b_id" 
	   value="${BOOK.b_id}"
	   id="b_id"><br/>


<label for="b_userid">사용자ID</label>
<input type="text" name="b_userid" 
	   value="${BOOK.b_userid}"
	   placeholder="사용자 ID를 입력하세요"
	   id="b_userid"><br/>


<label for="b_isbn">도서코드</label>
<input type="text" value="${BOOK.b_isbn}"
	   placeholder="도서코드를  입력하세요"
	   id="b_isbn" name="b_isbn"><br/>

<label for="b_title">도서제목</label>
<input type="text" value="${BOOK.b_title}"
	   placeholder="도서제목을 입력하세요"
	   id="b_title" name="b_title"><br/>

<label for="b_date">독서일자</label>
<input type="date" value="${BOOK.b_date}"
	   id="b_date" name="b_date"><br/>

<label for="b_star">별점</label>
<input type="text" value="${BOOK.b_star}"
	    placeholder="별점을 입력하세요"
		id="b_star" name="b_star"><br/>


<label for="b_text">내용</label>
<textarea id="b_text" name="b_text" rows="10"></textarea>



<hr />
<button id="save" type="submit"> 전송 </button>
</form>
</section>

</body>
</html>