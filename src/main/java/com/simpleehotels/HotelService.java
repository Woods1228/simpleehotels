package com.simpleehotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/*
 * This class is used to get rooms from the database.
 */
public class HotelService {
    /*
     * This method is used to get all rooms from the database.
     * @return List<Room>
     * @throws Exception
     */
    public ArrayList<Hotel> getHotels() throws Exception {
        // SQL query to get all rooms
        String query = "SELECT * FROM hotel;";
        ConnectionDB db = new ConnectionDB();
        
        // List to store rooms
        ArrayList<Hotel> hotels = new ArrayList<>();

        // Get rooms from the database
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            // Add rooms to the list
            while (rs.next()) {
                Hotel hotel = new Hotel(
                    rs.getString("address"),
                    rs.getInt("num_of_rooms"),
                    rs.getString("email"),
                    rs.getInt("stars"),
                    rs.getString("chain_address")
                );
                hotels.add(hotel);
            }
            // Close the connection
            rs.close();
            stmt.close();
            db.closeConnection();
            // Return the list of rooms
            return hotels;

        // Handle exceptions
        } catch (Exception e) {
            throw new Exception("Could not get rooms: " + e.getMessage());
        }
    }  
}