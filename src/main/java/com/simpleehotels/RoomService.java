package com.simpleehotels;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

    public boolean bookRoom(Room room, int ssn) throws Exception{
        String query1 = "INSERT INTO booking (booking_id, start_date, end_date, price, customer_ssn, room_num, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String query2 = "SELECT max(booking_id) FROM booking;";
        ConnectionDB db = new ConnectionDB();
        System.out.println(room.toString());

        try (Connection con = db.getConnection()) {
            System.out.println("2");
            PreparedStatement stmt1 = con.prepareStatement(query1);
            PreparedStatement stmt2 = con.prepareStatement(query2);
            ResultSet rs2 = stmt2.executeQuery();

            System.out.println("3");
            stmt1.setInt(1, /*rs2.getInt(1) + */1);
            System.out.println("3.1");
            stmt1.setDate(2, getDate(false));
            System.out.println("3.2");
            stmt1.setDate(3, getDate(true));
            System.out.println("3.3");
            stmt1.setFloat(4, room.getRoomPrice());
            System.out.println("3.4");
            stmt1.setInt(5, ssn);                                         ///////////////////////////////////////////////// DUMMY DATES AND SSN
            System.out.println("3.5");
            stmt1.setInt(6, room.getRoomNumber());
            System.out.println("3.6");
            stmt1.setString(7, room.getRoomAddress());

            System.out.println("4");
            int rs1 = stmt1.executeUpdate();
            System.out.println("5");
            if (rs1 == 1){
                System.out.println("6");
                rs2.close();
                stmt1.close();
                stmt2.close();
                db.closeConnection();
                return true;
            } else {
                System.out.println("7");
                rs2.close();
                stmt1.close();
                stmt2.close();
                db.closeConnection();
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

    public Date getDate(boolean end) {
        // Get the current date
        LocalDate currentDate = LocalDate.now();

        // Add one week to the current date
        if (end){
            currentDate = currentDate.plusWeeks(1);
        }

        // Format the date as "year-month-day"
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);

        // Return the formatted date
        return Date.valueOf(formattedDate);
    }

    public Date getDateEnd() {
        // Get the current date
        LocalDate currentDate = LocalDate.now();

        // Format the date as "year-month-day"
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);

        // Return the formatted date
        return Date.valueOf(formattedDate);
    }
}