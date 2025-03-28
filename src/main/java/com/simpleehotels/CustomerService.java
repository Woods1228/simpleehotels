package com.simpleehotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomerService{
    public ArrayList<Customer> getCustomers() throws Exception {
        String query = "SELECT * FROM customer ";
        ConnectionDB db = new ConnectionDB();
        ArrayList<Customer> customers = new ArrayList<>();

        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                Customer customer = new Customer(
                    rs.getString("ssn"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getDate("registration_date")
                );
                customers.add(customer);
            }
            // Close the connection
            rs.close();
            stmt.close();
            db.closeConnection();
            // Return the list of rooms
            return customers;
        } catch (Exception e) {
            throw new Exception("Could not get customers: " + e.getMessage());
        }
    }
    


}