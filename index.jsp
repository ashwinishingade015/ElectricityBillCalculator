<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Electricity Bill Calculator</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .card { border: 1px solid #ccc; padding: 20px; width: 400px; border-radius: 8px; }
        input[type=text], input[type=number] { width: 95%; padding: 8px; margin: 8px 0; }
        input[type=submit] { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; cursor: pointer; }
        .result { margin-top: 20px; border-top: 2px solid #333; padding-top: 10px; }
    </style>
</head>
<body>

<div class="card">
    <h2>Electricity Bill Calculator</h2>
    
    <form method="post">
        <label>Consumer Name:</label><br>
        <input type="text" name="name" required><br>
        
        <label>Consumer Number:</label><br>
        <input type="text" name="number" required><br>
        
        <label>Units Consumed:</label><br>
        <input type="number" name="units" required><br><br>
        
        <input type="submit" value="Calculate Bill">
    </form>

    <%
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String unitsStr = request.getParameter("units");

        if (name != null && number != null && !unitsStr.isEmpty()) {
            int units = Integer.parseInt(unitsStr);
            double bill = 0;

            if (units <= 100) {
                bill = units * 5;
            } else if (units <= 200) {
                bill = (100 * 5) + ((units - 100) * 7);
            } else {
                bill = (100 * 5) + (100 * 7) + ((units - 200) * 10);
            }
    %>
        <div class="result">
            <h3>Calculated Bill Details</h3>
            <p><b>Consumer Name:</b> <%= name %></p>
            <p><b>Consumer Number:</b> <%= number %></p>
            <p><b>Units Consumed:</b> <%= units %></p>
            <p><b>Total Amount:</b> ₹<%= bill %></p>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
