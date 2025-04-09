<%@ page import="java.util.*, java.sql.*"%>
<%@ page import="classes.*"%>

<jsp:useBean id="employees" class="java.util.ArrayList" scope="request" />
<jsp:setProperty name="employees" property="*" />

<%
List<Employee> employeeList = EmployeeDAO.getAllEmployees();
request.setAttribute("employees", employeeList);
%>


<h2>Employee List</h2>
<table border="1">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Salary</th>
		<th>Actions</th>
	</tr>
	<%
	for (Employee e : employeeList) {
	%>
	<tr>
		<td><%=e.getId()%></td>
		<td><%=e.getName()%></td>
		<td><%=e.getSalary()%></td>
		<td><a href="updateEmployee.jsp?id=<%=e.getId()%>">Edit</a> | <a
			href="deleteEmployee.jsp?id=<%=e.getId()%>"
			onclick="return confirm('Are you sure you want to delete this employee?');">
				Delete </a></td>
	</tr>
	<%
	}
	%>
</table>
