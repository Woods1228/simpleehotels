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

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Book A Room </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<html>
<body>
    <div id="editModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Book Room</h4>
                    <h6 class="modal-title">Would you like to book this room?</h6>
                </div>
                <div class="modal-body">
                    <form id="modal-form">
                        <div style="text-align: center;">
                            <input type="hidden" name="roomNumber" id="roomNumber">
                            <input type="hidden" name="address" id="address">
                            <input type="hidden" name="price" id="price">
                            <input type="hidden" name="amenities" id="amenities">
                            <input type="hidden" name="capacity" id="capacity">
                            <input type="hidden" name="viewType" id="viewType">
                            <input type="hidden" name="damages" id="damages">
                            <input type="hidden" name="extendible" id="extendible">
                            <p id="roomNumberText">Room Number: </p>
                            <p id="addressText">Address: </p>
                            <p id="priceText">Price: </p>
                            <p id="amenitiesText">Amenities: </p>
                            <p id="capacityText">Capacity: </p>
                            <p id="viewTypeText">View Type: </p>
                            <p id="damagesText">Damages: </p>
                            <p id="extendibleText">Extendible: </p>
                            <input type="text" name="ssn" id="ssn">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="confirm" form="modal-form" class="btn btn-success">Confirm</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <input type="hidden" name="message" id="message" value='<%=msgField%>' >
    <div class="container">
        <div class="row" id="row">
            <div class="col-md-12">
                <div class="card" id="card-container">
                    <div class="card-body" id="card">
                        <% if (rooms.size() == 0) { %>
                            <h1 style="margin-top: 5rem;">No Grades found!</h1>
                        <% } else { %>
                            <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Room Number</th>
                                        <th>Address</th>
                                        <th>Price</th>
                                        <th>Amenities</th>
                                        <th>Capacity</th>
                                        <th>View Type</th>
                                        <th>Damages</th>
                                        <th>Extendible</th>
                                        <th>Book</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% for (Room room : rooms) { %>
                                    <tr>
                                        <td><%= room.getRoomNumber() %></td>
                                        <td><%= room.getRoomAddress() %></td>
                                        <td><%= room.getRoomPrice() %></td>
                                        <td><%= room.getRoomAmenities() %></td>
                                        <td><%= room.getRoomCapacity() %></td>
                                        <td><%= room.getRoomViewType() %></td>
                                        <td><%= room.getRoomDamages() %></td>
                                        <td><%= room.isRoomExtendible() %></td>
                                        <td>
                                            <a type="button" onclick="setModalFields(this)"
                                                data-toggle="modal" 
                                                data-roomnumber="<%= room.getRoomNumber() %>"
                                                data-address="<%= room.getRoomAddress() %>" 
                                                data-price="<%= room.getRoomPrice() %>"
                                                data-ammenities="<%= room.getRoomAmenities() %>"
                                                data-capacity="<%= room.getRoomCapacity() %>"
                                                data-viewtype="<%= room.getRoomViewType() %>"
                                                data-damages="<%= room.getRoomDamages() %>"
                                                data-extendible="<%= room.isRoomExtendible() %>"
                                                data-target="#editModal">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                        </td>
                                    </tr>
                                <% } %>    
                                </tbody>
                            </table>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function setModalFields(row) {
            document.getElementById("roomNumberText").innerText = "Room Number: " + row.dataset.roomnumber;
            document.getElementById("addressText").innerText = "Address: " + row.dataset.address;
            document.getElementById("priceText").innerText = "Price: " + row.dataset.price;
            document.getElementById("amenitiesText").innerText = "Amenities: " + row.dataset.amenities;
            document.getElementById("capacityText").innerText = "Capacity: " + row.dataset.capacity;
            document.getElementById("viewTypeText").innerText = "View Type: " + row.dataset.viewtype;
            document.getElementById("damagesText").innerText = "Damages: " + row.dataset.damages;
            document.getElementById("extendibleText").innerText = "Extendible: " + row.dataset.extendible;

            // Update the hidden input fields in the form
            document.getElementById("roomNumber").value = row.dataset.roomnumber;
            document.getElementById("address").value = row.dataset.address;
            document.getElementById("price").value = row.dataset.price;
            document.getElementById("amenities").value = row.dataset.amenities;
            document.getElementById("capacity").value = row.dataset.capacity;
            document.getElementById("viewType").value = row.dataset.viewtype;
            document.getElementById("damages").value = row.dataset.damages;
            document.getElementById("extendible").value = row.dataset.extendible;

            document.getElementById("modal-form").action = "update-room-controller.jsp";
            document.getElementById("modal-form").method = "POST";
        }
    </script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script src="/assets/js/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <script>
        $(document).ready(function() {
            toastr.options = {
                "closeButton": true,
                "positionClass": "toast-bottom-right",
                "preventDuplicates": false
            };
            /* In order to access variables sent to ejs file to script you must Parse them to string */
            /* then to parse them back to JSON */
            let messages = document.getElementById("message").value;
            if (messages !== "") messages = JSON.parse("[" + messages.slice(0, -1) + "]");
            else messages = [];

            messages
            .forEach(({
                type,
                value
            }) => {
            switch (type) {
                case "error":
                    toastr.error(value)
                    break;
                case "success":
                    toastr.success(value)
                    break;
                case "warning":
                    toastr.warning(value)
                    break;
                default:
                    toastr.info(value)
                        break;
                }
            });
        })
    </script>
</body>
</html>
