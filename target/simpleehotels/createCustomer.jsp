<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Create Customer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-3">
        <div class="d-flex justify-content-end">
          <!-- Create Button -->
          <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#customerModal">Create</button>
        </div>
      </div>

<!-- Customer Modal -->
<div class="modal fade" id="customerModal" tabindex="-1" aria-labelledby="customerModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form id="customerForm" action="create-customer-controller.jsp" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="customerModalLabel">Create Customer</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        
        <div class="modal-body">
          <div class="mb-3">
            <label for="fullName" class="form-label">Full Name</label>
            <input type="text" class="form-control" name="name" id="fullName" required>
          </div>
          <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <textarea class="form-control" name="address" id="address" rows="2" required></textarea>
          </div>
          <div class="mb-3">
            <label for="idNumber" class="form-label">ID Number</label>
            <input type="text" class="form-control" name="ssn" id="idNumber" required>
          </div>
          <div class="mb-3">
            <label for="registrationDate" class="form-label">Registration Date</label>
            <input type="date" class="form-control" name="registrationDate" id="registrationDate" required>
          </div>
        </div>
        
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Save Customer</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS and Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
