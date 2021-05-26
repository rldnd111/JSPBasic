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
	select employee_id, last_name, job_id, manager_id, department_id
	from EMPLOYEES
	order by employee_id desc
	
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 조회</title>
</head>
<body>
<h1>사원정보 조회</h1>
<c:forEach var="row" items="${rs.rows}">
<p>${row.employee_id} ${row.last_name} ${row.job_id}</p>
<p>${row.manager_id} ${row.department_id}</p>
<hr>
</c:forEach>



</body>
</html>