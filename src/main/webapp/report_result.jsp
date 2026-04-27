<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List, java.util.Map, java.math.BigDecimal" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Report Result</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #f0f4f8; color: #333; }
    header { background: #1a3c5e; color: #fff; padding: 18px 32px; display: flex; align-items: center; gap: 16px; }
    header a { color: #fff; text-decoration: none; font-size: 13px; opacity: .75; }
    header h2 { font-size: 20px; font-weight: 600; }
    .wrapper { padding: 32px; max-width: 900px; margin: auto; }
    h3 { font-size: 17px; margin-bottom: 16px; color: #1a3c5e; }
    table { width: 100%; border-collapse: collapse; background: #fff; border-radius: 10px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,.07); }
    th { background: #1a3c5e; color: #fff; padding: 12px 16px; text-align: left; font-size: 13px; }
    td { padding: 12px 16px; font-size: 13px; border-bottom: 1px solid #f1f5f9; }
    tr:last-child td { border-bottom: none; }
    tr:hover td { background: #f8fafc; }
    .revenue-card { background: #fff; border-radius: 10px; padding: 32px; text-align: center; box-shadow: 0 2px 8px rgba(0,0,0,.07); }
    .revenue-card .amount { font-size: 42px; font-weight: 700; color: #1a3c5e; margin: 12px 0; }
    .revenue-card .period { font-size: 14px; color: #666; }
    .error { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; padding: 16px; border-radius: 8px; }
    .back-btn { display: inline-block; margin-top: 20px; padding: 10px 20px; background: #475569; color: #fff; border-radius: 6px; text-decoration: none; font-size: 13px; }
    .badge { display: inline-block; background: #e0f0ff; color: #1a3c5e; padding: 2px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; }
  </style>
</head>
<body>
  <header>
    <a href="report_form.jsp">&#8592; Reports</a>
    <h2>Report Result</h2>
  </header>
  <div class="wrapper">
    <% String reportType = (String) request.getAttribute("reportType");
       String errorMsg   = (String) request.getAttribute("error");
       if (errorMsg != null) { %>
      <div class="error"><strong>Error:</strong> <%= errorMsg %></div>

    <% } else if ("dateRange".equals(reportType)) {
        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations"); %>
      <h3>Reservations: <%= request.getAttribute("fromDate") %> to <%= request.getAttribute("toDate") %>
        <span class="badge"><%= reservations != null ? reservations.size() : 0 %> records</span>
      </h3>
      <% if (reservations == null || reservations.isEmpty()) { %>
        <p style="color:#888">No reservations found in this date range.</p>
      <% } else { %>
        <table>
          <thead><tr><th>ID</th><th>Customer</th><th>Room</th><th>Check-In</th><th>Check-Out</th><th>Amount</th></tr></thead>
          <tbody>
            <% for (Reservation r : reservations) { %>
            <tr>
              <td><%= r.getReservationID() %></td><td><%= r.getCustomerName() %></td>
              <td><%= r.getRoomNumber() %></td><td><%= r.getCheckIn() %></td>
              <td><%= r.getCheckOut() %></td><td>&#8377; <%= r.getTotalAmount() %></td>
            </tr>
            <% } %>
          </tbody>
        </table>
      <% } %>

    <% } else if ("mostBooked".equals(reportType)) {
        List<Map<String, Object>> rooms = (List<Map<String, Object>>) request.getAttribute("roomStats"); %>
      <h3>Most Frequently Booked Rooms</h3>
      <% if (rooms == null || rooms.isEmpty()) { %>
        <p style="color:#888">No booking data available.</p>
      <% } else { %>
        <table>
          <thead><tr><th>Rank</th><th>Room Number</th><th>Total Bookings</th></tr></thead>
          <tbody>
            <% int rank = 1; for (Map<String, Object> row : rooms) { %>
            <tr><td><%= rank++ %></td><td><%= row.get("roomNumber") %></td><td><%= row.get("bookingCount") %></td></tr>
            <% } %>
          </tbody>
        </table>
      <% } %>

    <% } else if ("revenue".equals(reportType)) {
        BigDecimal revenue = (BigDecimal) request.getAttribute("revenue"); %>
      <div class="revenue-card">
        <div style="font-size:14px;color:#888;font-weight:600;text-transform:uppercase;letter-spacing:1px">Total Revenue</div>
        <div class="amount">&#8377; <%= revenue != null ? revenue : "0.00" %></div>
        <div class="period">Period: <%= request.getAttribute("fromDate") %> &mdash; <%= request.getAttribute("toDate") %></div>
      </div>
    <% } %>

    <a class="back-btn" href="report_form.jsp">&#8592; Run Another Report</a>
  </div>
</body>
</html>