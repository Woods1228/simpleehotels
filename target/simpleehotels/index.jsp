<%@ page import="com.demo.RoomService" %>
<%@ page import="com.demo.Room" %>
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
    <% if (grades.size() == 0) { %>
        <h1 style="margin-top: 5rem;">No Grades found!</h1>
    <% } else { %>
        <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Course Name</th>
                    <th>Grade</th>
                    <th>Student ID</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <% for (Room room : rooms) { %>
                <tr>
                    <td><%= room.getId() %></td>
                    <td><%= room.getName() %></td>
                    <td><%= room.getCapacity() %></td>
                    <td><%= room.getBuilding() %></td>
                    <td><%= room.getFloor() %></td>
                    <td><%= room.getRoomNumber() %></td>
                    <td><%= room.getRoomType() %></td>
                    <td><%= room.getRoomStatus() %></td>
                    <td><%= room.getRoomDescription() %></td>
                </tr>
            <% } %>    
            </tbody>
        </table>
        </div>
    <% } %>
</body>
</html>
