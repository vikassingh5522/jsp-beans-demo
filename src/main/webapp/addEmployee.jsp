<jsp:useBean id="newEmployee" class="classes.Employee" scope="request"/>
<jsp:setProperty name="newEmployee" property="*" />
<%@ page import="classes.*" %>

<form action="addEmployee.jsp" method="post">
    Name: <input type="text" name="name"><br>
    Salary: <input type="text" name="salary"><br>
    <input type="submit" value="Add Employee">
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        EmployeeDAO.addEmployee(newEmployee);
        response.sendRedirect("listEmployees.jsp");
    }
%>
