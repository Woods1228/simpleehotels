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
    HotelService hotelService = new HotelService();
    //HotelChainService hotelChainService = new HotelChainService();
    ArrayList<Room> rooms = null;
    try {
        rooms = roomService.getRooms();
        hotels = hotelService.getHotels();
        //hotelChains = hotelChainService.getHotelChains();
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
    <div class="filter-container mb-3">
        <label for="filter" class="mr-2">Capacity:</label>
        <select id="capacityFilter"  onchange="filterRooms()">
            <option value="">All</option>
            <option value="single">Single</option>
            <option value="double">Double</option>
            <option value="queen">Queen</option>
            <option value="double queen">Double Queen</option>
            <option value="suite">Suite</option>
        </select>
        <label for="filter" class="mr-2">Price:</label>
        <select id="priceFilter" onchange="filterRooms()">
            <option value="">All</option>
            <option value="low">Below $100</option>
            <option value="medium">Below $250</option>
            <option value="high">Below $500</option>
        </select>
        <label for="filter" class="mr-2">Hotel Category:</label>
        <select id="categoryFilter" onchange="filterRooms()">
            <option value="">All</option>
            <option value="1">1 Star</option>
            <option value="2">2 Star</option>
            <option value="3">3 Star</option>
            <option value="4">4 Star</option>
            <option value="5">5 Star</option>
        </select>

    </div>
    These criteria should be: 
    the dates (start, end) of booking or renting, 
                    the room capacity, 
    the area,
    the hotel chain, 
    the category of the hotel, 
    the total number of rooms in the hotel, 
                    the price of the rooms.
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
        <script>
            function filterRooms() {
                const capacityFilter = document.getElementById("capacityFilter").value;
                const priceFilter = document.getElementById("priceFilter").value;
                const categoryFilter = document.getElementById("categoryFilter").value;
                const rows = document.querySelectorAll("tbody tr");

                rows.forEach(row => {
                    const price = parseFloat(row.querySelector("td:nth-child(3)").innerText.replace('$', ''));
                    const capacity = row.querySelector("td:nth-child(5)").innerText;
                    const roomAddress = row.querySelector("td:nth-child(2)");
                    <% for (Hotel hotel : hotels) { %>
                        if (roomAddress.innerText === "<%= hotel.getHotelAddress()%>") {
                            const category = "<%= hotel.getHotelCategory() %>";
                        }
                    <% } %>


                    // Show all rows by default
                    row.style.display = "";

                    // Apply filters
                    // Capacity filter logic
                    if (capacityFilter === "single" && capacity !== "single") {
                        row.style.display = "none"; // Example: Hide rooms that don't match the selected capacity
                    } else if ( capacityFilter === "double" && capacity !== "double") {
                        row.style.display = "none"; 
                    } else if (capacityFilter === "queen" && capacity !== "queen") {
                        row.style.display = "none"; 
                    } else if (capacityFilter === "double queen" && capacity !== "double queen") {
                        row.style.display = "none"; 
                    } else if (capacityFilter === "suite" && capacity !== "suite") {
                        row.style.display = "none";
                    }
                    // Price filter logic
                    if (priceFilter === "low" && price > 100) {
                        row.style.display = "none"; // Example: Hide rooms with price > 100
                    } else if (priceFilter === "medium" && price > 250) {
                        row.style.display = "none"; 
                    } else if (priceFilter === "high" && price > 500) {
                        row.style.display = "none"; 
                    }
                    // Category filter logic
                    if (categoryFilter === "1" && category !== "1") {
                        row.style.display = "none"; // Example: Hide rooms that don't match the selected category
                    } else if (categoryFilter === "2" && category !== "2") {
                        row.style.display = "none"; 
                    } else if (categoryFilter === "3" && category !== "3") {
                        row.style.display = "none"; 
                    } else if (categoryFilter === "4" && category !== "4") {
                        row.style.display = "none"; 
                    } else if (categoryFilter === "5" && category !== "5") {
                        row.style.display = "none"; 
                    }
                });
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