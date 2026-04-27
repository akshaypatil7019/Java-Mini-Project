package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String reportType = (String) req.getAttribute("reportType");
        String fromStr    = (String) req.getAttribute("fromDate");
        String toStr      = (String) req.getAttribute("toDate");

        if (reportType == null) reportType = req.getParameter("reportType");
        if (fromStr    == null) fromStr    = req.getParameter("fromDate");
        if (toStr      == null) toStr      = req.getParameter("toDate");

        req.setAttribute("reportType", reportType);

        try {
            switch (reportType) {
                case "dateRange": {
                    Date from = Date.valueOf(fromStr);
                    Date to   = Date.valueOf(toStr);
                    req.setAttribute("reservations", dao.getReservationsByDateRange(from, to));
                    req.setAttribute("fromDate", fromStr);
                    req.setAttribute("toDate",   toStr);
                    break;
                }
                case "mostBooked": {
                    req.setAttribute("roomStats", dao.getMostBookedRooms());
                    break;
                }
                case "revenue": {
                    Date from = Date.valueOf(fromStr);
                    Date to   = Date.valueOf(toStr);
                    req.setAttribute("revenue",  dao.getTotalRevenue(from, to));
                    req.setAttribute("fromDate", fromStr);
                    req.setAttribute("toDate",   toStr);
                    break;
                }
                default:
                    req.setAttribute("error", "Unknown report type selected.");
            }
        } catch (Exception e) {
            req.setAttribute("error", "Error generating report: " + e.getMessage());
        }

        req.getRequestDispatcher("report_result.jsp").forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.sendRedirect("report_form.jsp");
    }
}