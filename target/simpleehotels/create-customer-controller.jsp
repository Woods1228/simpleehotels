<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>

<%
    // Get form data
    String ssn = request.getParameter("ssn");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String registrationDate = request.getParameter("registrationDate");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver"); // Update with your DB driver if different
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "your_username", "your_password");

        // SQL query to insert the customer
        String sql = "INSERT INTO customers (ssn, name, address, registration_date) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, ssn);
        pstmt.setString(2, name);
        pstmt.setString(3, address);
        pstmt.setString(4, registrationDate);

        // Execute the query
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            session.setAttribute("messages", new ArrayList<>(List.of(new com.simpleehotels.Message("success", "Customer added successfully!"))));
        } else {
            session.setAttribute("messages", new ArrayList<>(List.of(new com.simpleehotels.Message("error", "Failed to add customer."))));
        }

    } catch (Exception e) {
        e.printStackTrace();
        session.setAttribute("messages", new ArrayList<>(List.of(new com.simpleehotels.Message("error", "An error occurred: " + e.getMessage()))));
    } finally {
        // Close resources
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }

    // Redirect back to the main page
    response.sendRedirect("customerUpdate.jsp");
%>