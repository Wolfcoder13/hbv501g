<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Employee</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/updateEmployee.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/toolbar.css"/>"/>
</head>
<body>
	<%@ include file="toolbars.jsp" %>
	<div class="container">
		<sf:form action="/employee/update/${employeeId }" method="POST" commandName="employee">
			<h1>Update employee: ${employeeToUpdate.fullName}</h1>
			<div class="form-group">
				<sf:input path="id" type="hidden" id="id" name="id" value="${employeeToUpdate.id }" class="form-control"/>
			</div>
			<table>
				<tr>
					<div class="form-group">
						<td><label for="full_name">Full Name:</label></td>
						<td><sf:input path="fullName" type="text" id="full_name" name="full_name" value="${employeeToUpdate.fullName }" class="form-control"/></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label for="userId">User name:</label></td>
						<td><sf:input path="loginName" type="text" id="userId" name="userId" value="${employeeToUpdate.loginName }" class="form-control"/></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label for="password">Password:</label></td>
						<td><sf:input path="loginPassword" type="password" id="password" name="password" value="" class="form-control"/></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label>Social Security</label></td>
						<td><sf:input path="socialSecurity" type="text" id="social_security" name="social_security" value="${employeeToUpdate.socialSecurity }" class="form-control"/></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label>Phone number:</label></td>
						<td><sf:input path="phoneNumber" type="text" id="phone_number" name="phone_number" value="${employeeToUpdate.phoneNumber }" class="form-control"/></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label>Home Address:</label></td>
						<td><sf:input path="homeAddress" type="text" id="home_address" name="home_address" value="${employeeToUpdate.homeAddress }" class="form-control"/></td>
					</div>
				</tr>
								<tr>
					<div class="form-group">
						<td><label>Email Address:</label></td>
						<td><sf:input path="emailAddress" type="text" id="email_address" name="email_address" value="${employeeToUpdate.emailAddress }" class="form-control"/></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label>Date of Employment:</label></td>
						<td> 
							<fmt:formatDate value="${employeeToUpdate.dateOfEmployment}" var="dateString" pattern="yyyy-MM-dd" />
							<sf:input path="dateOfEmployment" type="text" id="first_day" name="first_day" value="${dateString }" class="form-control"/>
						</td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label>Hourly Rate:</label></td>
						<td><sf:input path="hourlyRate" type="text" id="hourly_rate" name="hourly_rate" value="${employeeToUpdate.hourlyRate }" class="form-control"/> kr/hour</td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label>Default Department:</label></td>
						<td><sf:input path="defaultDepartment" type="text" id="default_department" name="default_department" value="${employeeToUpdate.defaultDepartment }" class="form-control"/></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<td><label>Admin privileges:</label></td>
						<c:choose>
			    			<c:when test="${employeeToUpdate.isAdmin==true}">
			        			<td><sf:checkbox path="isAdmin" id="is_admin" checked="true" class="form-control"/></td>
						    </c:when>
						    <c:otherwise>
						        <td><sf:checkbox path="isAdmin" id="is_admin" class="form-control"/></td>
						    </c:otherwise>
						</c:choose>
					</div>
			</table>
			<button id="createButton" class="form-control">Update</button>
			</sf:form>
		<div class="message">
 			${updateMessage}
 		</div>
		<div>
			<a href="/employee/view/${employeeToUpdate.id}" id="go-back">Return to employee</a>
		</div>


	</div>
</body>
</html>
