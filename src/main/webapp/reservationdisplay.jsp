<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>All Reservations</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #f0f4f8; color: #333; }
    header { background: #1a3c5e; color: #fff; padding: 18px 32px; display: flex; align-items: center; gap: 16px; }
    header a { color: #fff; text-decoration: none; font-size: 13px; opacity: .75; }
    header h2 { font-size: 20px; font-weight: 600; }
    .wrapper { padding: 32px; max-width: 1100px; margin: auto; }
    .count { font-size: 14px; color: #555; margin-bottom: 16px; }
    table { width: 100%; border-collapse: collapse; background: #fff; border-radius: 10px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,.07); }
    th { background: #1a3c5e; color: #fff; padding: 12px 16px; text-align: left; font-size: 13px; font-weight: 600; }
    td { padding: 12px 16px; font-size: 13px; border-bottom: 1px solid #f1f5f9; }
    tr:last-child td { border-bottom: none; }
    tr:hover td { background: #f8fafc; }
    .empty { text-align: center; padding: 40px; color: #888; }
    .amt { font-weight: 600; color: #1a3c5e; }
  </style>
</head>
<body>
  <header>
    <a href="index.jsp">&#8592; Home</a>
    <h2>All Reservations</h2>
  </header>
  <div class="wrapper">
    <% List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
       if (reservations == null || reservations.isEmpty()) { %>
      <div class="empty">No reservations found.</div>
    <% } else { %>
      <p class="count"><%= reservations.size() %> reservation(s) found</p>
      <table>
        <thead>
          <tr><th>ID</th><th>Customer Name</th><th>Room</th><th>Check-In</th><th>Check-Out</th><th>Total Amount</th></tr>
        </thead>
        <tbody>
          <% for (Reservation r : reservations) { %>
          <tr>
            <td><%= r.getReservationID() %></td>
            <td><%= r.getCustomerName() %></td>
            <td><%= r.getRoomNumber() %></td>
            <td><%= r.getCheckIn() %></td>
            <td><%= r.getCheckOut() %></td>
            <td class="amt">&#8377; <%= r.getTotalAmount() %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    <% } %>
  </div>
</body>
</html>