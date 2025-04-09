<%@ page import="classes.EmployeeDAO, java.sql.SQLException" %>

<%
    // Get the employee ID from request parameter
    String idParam = request.getParameter("id");

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);

            // Delete employee record
            EmployeeDAO.deleteEmployee(id);

            // Redirect to the employee list page
            response.sendRedirect("listEmployees.jsp");
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid Employee ID format.</p>");
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Error deleting employee: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;'>Employee ID is required for deletion.</p>");
    }
%>
