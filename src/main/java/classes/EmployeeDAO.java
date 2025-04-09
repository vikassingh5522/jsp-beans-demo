package classes;
import java.sql.*;
import java.util.*;

public class EmployeeDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/empdb";
    private static final String USER = "root";
    private static final String PASSWORD = "Vikas@9156";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<Employee> getAllEmployees() throws SQLException {
        List<Employee> list = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM employees")) {
            while (rs.next()) {
                list.add(new Employee(rs.getInt("id"), rs.getString("name"), rs.getDouble("salary")));
            }
        }
        return list;
    }

	public static void addEmployee(Employee emp) throws SQLException {
        String sql = "INSERT INTO employees (name, salary) VALUES (?, ?)";
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, emp.getName());
            stmt.setDouble(2, emp.getSalary());
            stmt.executeUpdate();
        }
    }

    public static void updateEmployee(Employee emp) throws SQLException {
        String sql = "UPDATE employees SET name=?, salary=? WHERE id=?";
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, emp.getName());
            stmt.setDouble(2, emp.getSalary());
            stmt.setInt(3, emp.getId());
            stmt.executeUpdate();
        }
    }

    public static void deleteEmployee(int id) throws SQLException {
        String sql = "DELETE FROM employees WHERE id=?";
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
