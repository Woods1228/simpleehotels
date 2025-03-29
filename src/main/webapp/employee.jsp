<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Employee Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f1f5f9;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }

    .grid-container {
      display: grid; 
      grid-template-columns: repeat(3, 250px);
      grid-gap: 20px;
      justify-content: center;
      align-items: start;
    }

    .card {
      background-color: #cbd5e1;
      border-radius: 20px;
      padding: 20px;
      text-align: center;
      box-shadow: 2px 4px 10px rgba(0,0,0,0.1);
    }

    .card h3 {
      margin-bottom: 10px;
      color: #1e293b;
    }

    .card p {
      font-size: 14px;
      margin-bottom: 15px;
      color: #334155;
    }

    .btn {
      background: linear-gradient(to right, #6366f1, #2ecc71);
      color: white;
      border: none;
      padding: 8px 16px;
      border-radius: 20px;
      cursor: pointer;
      font-weight: bold;
    }

    .btn:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }

    
  </style>
</head>
<body>

  <div class="grid-container">
    <div class="card">
      <h3>Customer Info</h3>
      <p>Modify customer records in the database</p>
      <button class="btn" onclick="window.location.href='createCustomer.jsp'">Open</button>
    </div>
    
    <div class="card">
      <h3>Employee Info</h3>
      <p>Modify employee records in the database</p>
      <button class="btn" onclick="handleClick('employee')">Open</button>
    </div>
    
    <div class="card">
      <h3>Rent a Room</h3>
      <p>Directly rent a room for a walk-in customer or turn booking to renting</p>
      <button class="btn" onclick="handleClick('renting')">Rent</button>
    </div>

    <div class="card">
      <h3>Booking</h3>
      <p>Book a room in advance for a customer</p>
      <button class="btn" onclick="handleClick('booking')">Book</button>
    </div>
  </div>

  <script>
    function handleClick(action) {
      alert("Button clicked for: " + action);
      // You can redirect or call APIs here
      // Example: window.location.href = `/${action}.html`;
    }
  </script>

</body>
</html>
