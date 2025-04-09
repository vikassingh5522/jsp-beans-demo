<jsp:useBean id="updateEmployee" class="classes.Employee" scope="request"/>
<jsp:setProperty name="updateEmployee" property="*" />
<%@ page import="classes.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    for (Employee e : EmployeeDAO.getAllEmployees()) {
        if (e.getId() == id) {
            request.setAttribute("updateEmployee", e);
            break;
        }
    }
%>

<form action="updateEmployee.jsp" method="post">
    <input type="hidden" name="id" value="<jsp:getProperty name='updateEmployee' property='id' />">
    Name: <input type="text" name="name" value="<jsp:getProperty name='updateEmployee' property='name' />"><br>
    Salary: <input type="text" name="salary" value="<jsp:getProperty name='updateEmployee' property='salary' />"><br>
    <input type="submit" value="Update">
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        EmployeeDAO.updateEmployee(updateEmployee);
        response.sendRedirect("listEmployees.jsp");
    }
%>
