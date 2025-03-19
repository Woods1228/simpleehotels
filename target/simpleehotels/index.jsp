<%@ page import="com.simpleehotels.RoomService" %>
<%@ page import="com.simpleehotels.Room" %>
<%@ page import="com.simpleehotels.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 

<%
    ArrayList<Message> messages;

    if ((ArrayList<Message>) session.getAttribute("messages") == null) messages = new ArrayList<>();
    else messages = (ArrayList<Message>) session.getAttribute("messages");

    String msgField = "";

    for (Message m : messages) {
        msgField += "{\"type\":\"" + m.type + "\",\"value\":\"" + m.value.replaceAll("['\"]+", "") + "\"},";
    }

    session.setAttribute("messages", new ArrayList<Message>());

    RoomService roomService = new RoomService();
    ArrayList<Room> rooms = null;
    try {
        rooms = roomService.getRooms();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">

<html>
<body>
    <% if (rooms.size() == 0) { %>
        <h1 style="margin-top: 5rem;">No Grades found!</h1>
    <% } else { %>
        <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Room Number</th>
                    <th>Address</th>
                    <th>Price</th>
                    <th>Ammenities</th>
                    <th>Capacity</th>
                    <th>View Type</th>
                    <th>Damages</th>
                    <th>Extendible</th>
                </tr>
            </thead>
            <tbody>
            <% for (Room room : rooms) { %>
                <tr>
                    <td><%= room.getRoomNumber() %></td>
                    <td><%= room.getRoomAddress() %></td>
                    <td><%= room.getRoomPrice() %></td>
                    <td><%= room.getRoomAmmenities() %></td>
                    <td><%= room.getRoomCapacity() %></td>
                    <td><%= room.getRoomViewType() %></td>
                    <td><%= room.getRoomDamages() %></td>
                    <td><%= room.isRoomExtendible() %></td>
                </tr>
            <% } %>    
            </tbody>
        </table>
        </div>
    <% } %>
</body>
</html>
