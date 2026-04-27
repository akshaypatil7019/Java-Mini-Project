package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String idParam = req.getParameter("reservationID");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                Reservation r = dao.getReservationById(id);
                req.setAttribute("reservation", r);
            } catch (NumberFormatException e) {
                req.setAttribute("message", "Invalid ID.");
            }
        }
        req.getRequestDispatcher("reservationupdate.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            int        id  = Integer.parseInt(req.getParameter("reservationID"));
            String   name  = req.getParameter("customerName").trim();
            String   room  = req.getParameter("roomNumber").trim();
            Date       in  = Date.valueOf(req.getParameter("checkIn"));
            Date      out  = Date.valueOf(req.getParameter("checkOut"));
            BigDecimal amt = new BigDecimal(req.getParameter("totalAmount"));

            Reservation r = new Reservation(id, name, room, in, out, amt);
            boolean ok = dao.updateReservation(r);

            req.setAttribute("message", ok ? "Reservation updated successfully!" : "Update failed. Check ID.");
            req.setAttribute("reservation", r);
        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }
        req.getRequestDispatcher("reservationupdate.jsp").forward(req, res);
    }
}