<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
table {
	margin: auto;
}
</style>
</head>
<body>
	<c:set var="list" value="${requestScope.list}"></c:set>
	<div></div>
	<table>
		<thead>
			<tr>
				<th>��ȣ</th>
				<th>����</th>
				<th>����</th>
				<th>��¥</th>
				<th>����</th>
				<th>����</th>
				<th>���Թ�ȣ</th>
				<th>���̵�</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${board.reviewno}</td>
					<td><a href="detail.do?num=${board.reviewno}">${board.title}</a></td>
					<td>${board.content}</td>
					<td>${board.date}</td>
					<td>${board.photo}</td>
					<td>${board.gpa}</td>
					<td>${board.shopno}</td>
					<td>${board.id}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="addreviewform.do">�۾���</a>
</body>
</html>