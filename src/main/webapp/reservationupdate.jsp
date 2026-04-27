<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Reservation</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #f0f4f8; color: #333; }
    header { background: #1a3c5e; color: #fff; padding: 18px 32px; display: flex; align-items: center; gap: 16px; }
    header a { color: #fff; text-decoration: none; font-size: 13px; opacity: .75; }
    header h2 { font-size: 20px; font-weight: 600; }
    .container { max-width: 520px; margin: 40px auto; background: #fff; border-radius: 10px; padding: 32px; box-shadow: 0 2px 10px rgba(0,0,0,.08); }
    .search-row { display: flex; gap: 10px; margin-bottom: 24px; }
    .search-row input { flex: 1; padding: 10px 12px; border: 1px solid #cdd5df; border-radius: 6px; font-size: 14px; }
    .search-row button { padding: 10px 18px; background: #475569; color: #fff; border: none; border-radius: 6px; cursor: pointer; }
    label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 4px; margin-top: 16px; }
    input[type=text], input[type=number], input[type=date] { width: 100%; padding: 10px 12px; border: 1px solid #cdd5df; border-radius: 6px; font-size: 14px; }
    input:focus { outline: none; border-color: #1a3c5e; }
    button[type=submit] { margin-top: 24px; width: 100%; padding: 12px; background: #1a3c5e; color: #fff; border: none; border-radius: 6px; font-size: 15px; cursor: pointer; }
    button[type=submit]:hover { background: #14304d; }
    .msg-ok  { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; padding: 12px; border-radius: 6px; margin-bottom: 16px; }
    .msg-err { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; padding: 12px; border-radius: 6px; margin-bottom: 16px; }
    hr { border: none; border-top: 1px solid #e5e7eb; margin: 20px 0; }
  </style>
</head>
<body>
  <header>
    <a href="index.jsp">&#8592; Home</a>
    <h2>Update Reservation</h2>
  </header>
  <div class="container">
    <%
      String msg = (String) request.getAttribute("message");
      if (msg != null) { boolean ok = msg.contains("successfully"); %>
      <div class="<%= ok ? "msg-ok" : "msg-err" %>"><%= msg %></div>
    <% } %>

    <form method="get" action="UpdateReservationServlet">
      <div class="search-row">
        <input type="number" name="reservationID" placeholder="Enter Reservation ID to load" required>
        <button type="submit">Load</button>
      </div>
    </form>

    <% Reservation r = (Reservation) request.getAttribute("reservation");
       if (r != null) { %>
    <hr>
    <form method="post" action="UpdateReservationServlet">
      <input type="hidden" name="reservationID" value="<%= r.getReservationID() %>">
      <label>Customer Name</label>
      <input type="text" name="customerName" value="<%= r.getCustomerName() %>" required>
      <label>Room Number</label>
      <input type="text" name="roomNumber" value="<%= r.getRoomNumber() %>" required>
      <label>Check-In Date</label>
      <input type="date" name="checkIn" value="<%= r.getCheckIn() %>" required>
      <label>Check-Out Date</label>
      <input type="date" name="checkOut" value="<%= r.getCheckOut() %>" required>
      <label>Total Amount (&#8377;)</label>
      <input type="number" step="0.01" name="totalAmount" value="<%= r.getTotalAmount() %>" required>
      <button type="submit">Update Reservation</button>
    </form>
    <% } %>
  </div>
</body>
</html>