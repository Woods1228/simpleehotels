package com.simpleehotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/*
 * This class is used to get rooms from the database.
 */
public class RoomService {
    /*
     * This method is used to get all rooms from the database.
     * @return List<Room>
     * @throws Exception
     */
    public ArrayList<Room> getRooms() throws Exception {
        // SQL query to get all rooms
        String query = "SELECT * FROM rooms";
        ConnectionDB db = new ConnectionDB();
        
        // List to store rooms
        ArrayList<Room> rooms = new ArrayList<>();

        // Get rooms from the database
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            // Add rooms to the list
            System.out.println("Rooms:");
            while (rs.next()) {
                Room room = new Room(
                    rs.getInt("room_num"),
                    rs.getString("address"),
                    rs.getFloat("price"),
                    rs.getString("amenities"),
                    rs.getString("capacity"),
                    rs.getString("view_type"),
                    rs.getString("damages"),
                    rs.getBoolean("extendible")
                );
                System.out.println(room.getRoomNumber());
                rooms.add(room);
            }
            // Close the connection
            rs.close();
            stmt.close();
            db.closeConnection();
            // Return the list of rooms
            return rooms;

        // Handle exceptions
        } catch (Exception e) {
            throw new Exception("Could not get rooms: " + e.getMessage());
        }
    }
}