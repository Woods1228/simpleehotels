<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.simpleehotels.RoomService" %>
<%@ page import="com.simpleehotels.Room" %>
<%@ page import="com.simpleehotels.Message" %>
<%@ page import="java.util.ArrayList" %>

<%
    // get student info from the request
    Integer roomNumber = Integer.valueOf(request.getParameter("roomNumber"));
    String address = request.getParameter("address");
    Double price = Double.valueOf(request.getParameter("price"));
    String ammenities = request.getParameter("ammenities");
    Integer capacity = Integer.valueOf(request.getParameter("capacity"));
    String viewType = request.getParameter("viewType");
    String damages = request.getParameter("damages");
    Boolean extendible = Boolean.valueOf(request.getParameter("extendible"));
    Integer ssn = Integer.valueOf(request.getParameter("ssn"));
    
    RoomService roomService = new RoomService();
    // create room object
    Room room = new Room(roomNumber, address, price, ammenities, capacity, viewType, damages, extendible);  

    Message msg;
    // try to update a student
    try {
        String value = roomService.bookRoom(room, ssn);
        // if the value contains error/Error then this is an error message
        if (value) msg = new Message("success", value);
        // else the student was successfully created
        else msg = new Message("error", value);
    } catch (Exception e) {
        e.printStackTrace();
        msg = new Message("error", "Something went wrong!");
    }

    // create an arraylist of messages and append the new message
    ArrayList<Message> messages = new ArrayList<>();
    messages.add(msg);

    // set session attribute named messages to messages value
    session.setAttribute("messages", messages);
    // redirect to students page
    response.sendRedirect("students.jsp");
%>