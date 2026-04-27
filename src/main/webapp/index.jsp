<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hotel Management System</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #f0f4f8; color: #333; }
    header { background: #1a3c5e; color: #fff; padding: 24px 40px; }
    header h1 { font-size: 26px; font-weight: 600; }
    header p  { font-size: 14px; opacity: 0.75; margin-top: 4px; }
    .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 20px; padding: 40px; max-width: 1000px; margin: auto; }
    .card { background: #fff; border-radius: 10px; padding: 28px 24px; text-align: center; box-shadow: 0 2px 8px rgba(0,0,0,.08); text-decoration: none; color: #333; transition: transform .15s, box-shadow .15s; }
    .card:hover { transform: translateY(-3px); box-shadow: 0 6px 18px rgba(0,0,0,.13); }
    .card .icon { font-size: 36px; margin-bottom: 12px; }
    .card h3 { font-size: 16px; font-weight: 600; margin-bottom: 6px; }
    .card p  { font-size: 13px; color: #666; }
    .section-title { padding: 32px 40px 0; font-size: 13px; text-transform: uppercase; letter-spacing: 1px; color: #888; max-width: 1000px; margin: auto; }
  </style>
</head>
<body>
  <header>
    <h1>&#127968; Hotel Management System</h1>
    <p>Manage reservations, billing, and reports from one place</p>
  </header>

  <p class="section-title">Reservations</p>
  <div class="grid">
    <a class="card" href="reservationadd.jsp">
      <div class="icon">&#10133;</div>
      <h3>Add Reservation</h3>
      <p>Book a new room for a customer</p>
    </a>
    <a class="card" href="UpdateReservationServlet">
      <div class="icon">&#9998;</div>
      <h3>Update Reservation</h3>
      <p>Modify existing booking details</p>
    </a>
    <a class="card" href="reservationdelete.jsp">
      <div class="icon">&#10060;</div>
      <h3>Cancel Reservation</h3>
      <p>Remove a reservation by ID</p>
    </a>
    <a class="card" href="DisplayReservationsServlet">
      <div class="icon">&#128203;</div>
      <h3>View All Reservations</h3>
      <p>See current occupancy and bookings</p>
    </a>
  </div>

  <p class="section-title" style="margin-top:8px">Reports</p>
  <div class="grid">
    <a class="card" href="ReportCriteriaServlet">
      <div class="icon">&#128202;</div>
      <h3>Generate Reports</h3>
      <p>Date range, revenue &amp; room frequency</p>
    </a>
  </div>
</body>
</html>