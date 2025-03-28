<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest & Employee Buttons</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            display: flex;
            gap: 20px;
        }
        button {
            padding: 15px 30px;
            font-size: 18px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }
        .guest {
            background-color: #3498db;
            color: white;
        }
        .guest:hover {
            background-color: #2980b9;
        }
        .employee {
            background-color: #2ecc71;
            color: white;
        }
        .employee:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <div class="container">
        <button class="guest" onclick="window.location.href='login.jsp'">Guest</button>
        <button class="employee">Employee</button>
    </div>
</body>
</html>

