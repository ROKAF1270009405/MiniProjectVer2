
<%@page import="com.teatime.shop.model.ShopDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>List</title>
<style>
.mo{
	width:80%;
    margin: 50px auto;
}
table {
	width:100%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
thead th {
	/* width: 130px; */
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #288cd2;
    margin: 20px 10px;
    text-align: center;
}
th:nth-child(1) {
	width: 5%;
}
th:nth-child(2){
	width: 20%;
}
th:nth-child(3){
	width: 20%;
}
th:nth-child(4){
	width: 20%;
}
td{
    padding: 10px;
    vertical-align: top;
}
tr:nth-child(2n) {
    background-color: #9DCFFF;
}
a {
	text-decoration: none;
	color: black;
}
#page{
	padding-top:10px;
	width:100%;
	text-align: center;
	font-size: 20px;
}
.site{
	width:100%;
}
.site img{
	
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
  $(document).ready(function(){
	  $('.trs:odd').css("background-color","#9DCFFF");
	  /* let kind = $('.btn').val();
	  console.log(kind);
	   */
	  $('#kind').on('change',function () {
		  console.log('change!!!');
	    console.log( $(this).val());	 
		/*   if(kindtitle==="좋아요 베스트"){
			  kindtitle = "평점 베스트";
			  $('.btn').val('gpa');
		  } else if(kindtitle==="평점 베스트"){
			  kindtitle = "좋아요 베스트";
			  $('.btn').val('good');
		  }
		  kind = $('.btn').val();
		  $(this).text(kindtitle); */
		  $('form').submit();
		 /*  $.ajax({
			  url:"http://localhost:8080/MiniPro2/best.do",
			  type:'GET',
			  data:kind,
			  success:function(data){
				  console.log("ajax : "+kind);
			  },
			  error:function(){
				  
			  }
		  }); */
	  });
	  
  });
</script>
</head>
<body>
<c:set var="bestlist" value="${requestScope.bestlist }"></c:set>


<div class="mo">
<form method="post" action="best.do" name="frm">
	<select name="kind" id="kind">
	<option value="">선택하시오</option>
		<option value="good">좋아요</option>
		<option value="gpa">평점</option>
	</select>
</form>
<!-- <form method="post" action="best.do">
	<button class="btn" value="good" id="kind" name="kind">좋아요 베스트</button>
</form> -->
	<table>
		<thead>
			<tr><th>사진</th><th>매장명</th><th>매장평점</th><th>매장주소</th><th>좋아요수</th></tr>
		</thead>
		<tbody>
		<c:forEach var="best" items="${bestlist }">
			<tr class="trs">
				<td><div class="site"><img alt="이미지" src="${best.photo }"></div></td>
				<td><c:out value="${best.name }"></c:out></td>
				<td><fmt:formatNumber value="${best.gpa }" pattern=".0"/></td>
				<td><c:out value="${best.addr }"></c:out></td>
				<td><c:out value="${best.count }"></c:out></td>
			</tr>	
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>