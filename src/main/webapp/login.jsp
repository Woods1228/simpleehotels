<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .login-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin: 5px;
        }
        .login-btn {
            background-color: #3498db;
            color: white;
        }
        .login-btn:hover {
            background-color: #2980b9;
        }
        .signup-btn {
            background-color: #2ecc71;
            color: white;
        }
        .signup-btn:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form>
            <input type="text" placeholder="Social Security Number" required>
            <button type="submit" class="login-btn">Login</button>
        </form>
        <button class="signup-btn" onclick="window.location.href='update.jsp'">Sign Up</button>
    </div>
</body>
</html>