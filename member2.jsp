<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<c:set var="url"></c:set>
<c:set var="drv"></c:set>
<c:set var="usr"></c:set>
<c:set var="pwd"></c:set>
 
<sql:setDataSource var="mariadb"
url="${url}" driver="${drv}" user="${usr}" password="${pwd}" />

<sql:query dataSource="${mariadb}" var="rs">
	select mbno, userid, name, regdate from NMember
	order by mbno desc
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
</head>
<body>
<h1>회원 정보 조회</h1>

<c:forEach var="row" items="${rs.rows}">
<p>${row.mbno} ${row.userid} ${row.passwd} ${row.name} </p>
<p>${row.birth} ${row.gender} ${row.email} ${row.hp} ${fn:substring(row.regdate, 0, 10)} </p>
<hr>
</c:forEach>

</body>
</html>