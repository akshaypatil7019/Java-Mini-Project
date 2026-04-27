<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Generate Report</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #f0f4f8; color: #333; }
    header { background: #1a3c5e; color: #fff; padding: 18px 32px; display: flex; align-items: center; gap: 16px; }
    header a { color: #fff; text-decoration: none; font-size: 13px; opacity: .75; }
    header h2 { font-size: 20px; font-weight: 600; }
    .container { max-width: 500px; margin: 40px auto; background: #fff; border-radius: 10px; padding: 32px; box-shadow: 0 2px 10px rgba(0,0,0,.08); }
    label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 6px; margin-top: 18px; }
    select, input[type=date] { width: 100%; padding: 10px 12px; border: 1px solid #cdd5df; border-radius: 6px; font-size: 14px; background: #fff; }
    .date-group { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-top: 16px; }
    button { margin-top: 28px; width: 100%; padding: 12px; background: #1a3c5e; color: #fff; border: none; border-radius: 6px; font-size: 15px; cursor: pointer; }
    button:hover { background: #14304d; }
    #dateSection { display: none; }
  </style>
  <script>
    function toggleDates() {
      var type = document.getElementById('reportType').value;
      var show = type === 'dateRange' || type === 'revenue';
      document.getElementById('dateSection').style.display = show ? 'block' : 'none';
    }
  </script>
</head>
<body>
  <header>
    <a href="index.jsp">&#8592; Home</a>
    <h2>Generate Report</h2>
  </header>
  <div class="container">
    <form method="post" action="ReportCriteriaServlet">
      <label>Report Type</label>
      <select name="reportType" id="reportType" onchange="toggleDates()" required>
        <option value="">-- Select a report --</option>
        <option value="dateRange">Reservations in a Date Range</option>
        <option value="mostBooked">Most Frequently Booked Rooms</option>
        <option value="revenue">Total Revenue Over a Period</option>
      </select>
      <div id="dateSection">
        <div class="date-group">
          <div><label>From Date</label><input type="date" name="fromDate"></div>
          <div><label>To Date</label><input type="date" name="toDate"></div>
        </div>
      </div>
      <button type="submit">Generate Report</button>
    </form>
  </div>
</body>
</html>