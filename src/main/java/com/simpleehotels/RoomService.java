package com.simpleehotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomService {

    public List<Room> getRooms() throws Exception {
        String query = "SELECT * FROM room";
        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Room room = new Room(
                    rs.getInt("roomNumber"),
                    rs.getString("address"),
                    rs.getFloat("price"),
                    rs.getString("ammenities"),
                    rs.getString("capacity"),
                    rs.getString("viewType"),
                    rs.getString("damages"),
                    rs.getBoolean("extendible")
                );
                rooms.add(room);
            }

            rs.close();
            stmt.close();
            db.closeConnection();

            return rooms;
        } catch (Exception e) {
            throw new Exception("Could not get rooms: " + e.getMessage());
        }
    }
}