<%@ page import="com.simpleehotels.CustomerService" %>
<%@ page import="com.simpleehotels.Customer" %>
<%@ page import="com.simpleehotels.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    ArrayList<Message> messages;

    if ((ArrayList<Message>) session.getAttribute("messages") == null)
        messages = new ArrayList<>();
    else
        messages = (ArrayList<Message>) session.getAttribute("messages");

    String msgField = "";
    for (Message m : messages) {
        msgField += "{\"type\":\"" + m.type + "\",\"value\":\"" + m.value.replaceAll("['\"]+", "") + "\"},";
    }
    session.setAttribute("messages", new ArrayList<Message>());

    CustomerService customerService = new CustomerService();
    ArrayList<Customer> customers = null;
    try {
        customers = customerService.getCustomers();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Management</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Customer List</h2>
            <button class="btn btn-success" data-toggle="modal" data-target="#createModal">+ Add Customer</button>
        </div>

        <% if (customers == null || customers.size() == 0) { %>
            <p>No customers found.</p>
        <% } else { %>
        <div class="table-responsive">
        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>SSN</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Registration Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Customer customer : customers) { %>
                    <tr>
                        <td><%= customer.getSsn() %></td>
                        <td><%= customer.getName() %></td>
                        <td><%= customer.getAddress() %></td>
                        <td><%= customer.getRegistrationDate() %></td>
                        <td>
                            <button class="btn btn-sm btn-primary"
                                data-toggle="modal"
                                data-target="#editModal"
                                data-ssn="<%= customer.getSsn() %>"
                                data-name="<%= customer.getName() %>"
                                data-address="<%= customer.getAddress() %>"
                                data-date="<%= customer.getRegistrationDate() %>"
                                onclick="setModalFields(this)">
                                Update
                            </button>
                            <a href="delete-customer-controller.jsp?ssn=<%= customer.getSsn() %>" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        </div>
        <% } %>
    </div>

    <!-- Update Customer Modal -->
    <div id="editModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <form id="modal-form" action="update-customer-controller.jsp" method="POST" class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update Customer</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="ssn" id="modal-ssn">
                    <div class="form-group">
                        <label for="modal-name">Name</label>
                        <input type="text" class="form-control" name="name" id="modal-name" required>
                    </div>
                    <div class="form-group">
                        <label for="modal-address">Address</label>
                        <input type="text" class="form-control" name="address" id="modal-address" required>
                    </div>
                    <div class="form-group">
                        <label for="modal-date">Registration Date</label>
                        <input type="date" class="form-control" name="registrationDate" id="modal-date" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Save Changes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Create Customer Modal -->
    <div id="createModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <form action="create-customer-controller.jsp" method="POST" class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Customer</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="create-ssn">SSN</label>
                        <input type="text" class="form-control" name="ssn" id="create-ssn" required>
                    </div>
                    <div class="form-group">
                        <label for="create-name">Name</label>
                        <input type="text" class="form-control" name="name" id="create-name" required>
                    </div>
                    <div class="form-group">
                        <label for="create-address">Address</label>
                        <input type="text" class="form-control" name="address" id="create-address" required>
                    </div>
                    <div class="form-group">
                        <label for="create-date">Registration Date</label>
                        <input type="date" class="form-control" name="registrationDate" id="create-date" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Add Customer</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <input type="hidden" id="message" value='<%= msgField %>'>

    <script src="/assets/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <script>
        function setModalFields(button) {
            document.getElementById("modal-ssn").value = button.dataset.ssn;
            document.getElementById("modal-name").value = button.dataset.name;
            document.getElementById("modal-address").value = button.dataset.address;
            document.getElementById("modal-date").value = button.dataset.date;
        }

        $(document).ready(function() {
            toastr.options = {
                "closeButton": true,
                "positionClass": "toast-bottom-right"
            };
            let messages = document.getElementById("message").value;
            if (messages !== "") messages = JSON.parse("[" + messages.slice(0, -1) + "]");
            else messages = [];

            messages.forEach(({ type, value }) => {
                toastr[type](value);
            });
        });
    </script>
</body>
</html>
