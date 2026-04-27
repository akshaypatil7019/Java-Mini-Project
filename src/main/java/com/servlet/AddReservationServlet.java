package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            // ❌ REMOVE manual ID input
            // int id = Integer.parseInt(req.getParameter("reservationID"));

            String name = req.getParameter("customerName").trim();
            String room = req.getParameter("roomNumber").trim();
            Date in = Date.valueOf(req.getParameter("checkIn"));
            Date out = Date.valueOf(req.getParameter("checkOut"));

            BigDecimal amt = new BigDecimal(req.getParameter("totalAmount"));

            // ✅ Validation: Prevent negative amount
            if (amt.compareTo(BigDecimal.ZERO) < 0) {
                req.setAttribute("message", "Amount cannot be negative!");
                req.getRequestDispatcher("reservationadd.jsp").forward(req, res);
                return;
            }

            // ✅ Pass 0 or ignore ID (DB will auto-generate)
            Reservation r = new Reservation(0, name, room, in, out, amt);

            boolean ok = dao.addReservation(r);

            req.setAttribute("message",
                    ok ? "Reservation added successfully!" : "Failed to add reservation.");

        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }

        req.getRequestDispatcher("reservationadd.jsp").forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.sendRedirect("reservationadd.jsp");
    }
}