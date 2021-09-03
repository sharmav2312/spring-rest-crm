<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="com.luv2code.springdemo.util.SortUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Customers</title>


<!--  reference our style sheet -->
<link rel="stylesheet" type="text/css"
	 href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2> CRM - Customer Relationship Manager </h2>		
		</div>
	</div>
	
	<div id="container">
		<div id="content">
		
		<!-- put new button: Add Customer -->
		
		<input type="button" value="Add Customer" 
			onclick="window.location.href='showFormForAdd'; return false;" 
			class="add-button"	
			/><br>
			<!-- add our html table here -->
			<!--  add a search box -->
			<form:form action="search" method="GET">
			
				Search Customer: <input type="text" name="theSearchName" />
				
				<input type="submit" value="Search" class="add-button" />
			
			</form:form>
			
			<!-- construct sorting link for first name -->
				<c:url var="sortLinkFirstName" value="/customer/list">
					<c:param name="sort" value="<%= Integer.toString(SortUtils.FIRST_NAME) %>"></c:param>
				</c:url>
				
				<!-- construct sorting link for last name -->
				<c:url var="sortLinkLastName" value="/customer/list">
					<c:param name="sort" value="<%= Integer.toString(SortUtils.LAST_NAME) %>"></c:param>
				</c:url>
				
				<!-- construct sorting link for email -->
				<c:url var="sortLinkEmail" value="/customer/list">
					<c:param name="sort" value="<%= Integer.toString(SortUtils.EMAIL) %>"></c:param>
				</c:url>
			
			<table>
			
				<tr>
					<th><a href="${sortLinkFirstName}"> First Name </a></th>
					<th><a href="${sortLinkLastName}"> Last Name </a></th>
					<th><a href="${sortLinkEmail}"> Email </a></th>
					<th> Action</th>
				</tr>
				
				<c:forEach var="tempCustomer" items="${customers}">
				
				<!--  construct an update link with customer id -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				</c:url>
				
				<!--  construct a delete link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				</c:url>
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td><a href="${updateLink}">Update</a>
						|
						<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
						
						</td>
					</tr>
				
				</c:forEach>
						
			</table>
			
		</div>
	</div>

</body>
</html>