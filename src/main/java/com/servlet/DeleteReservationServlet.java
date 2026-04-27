package com.servlet;

import com.dao.ReservationDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String idParam = req.getParameter("reservationID");
        try {
            int id = Integer.parseInt(idParam);
            boolean ok = dao.deleteReservation(id);
            req.setAttribute("message", ok
                ? "Reservation #" + id + " cancelled successfully."
                : "No reservation found with ID " + id + ".");
        } catch (NumberFormatException e) {
            req.setAttribute("message", "Invalid Reservation ID.");
        }
        req.getRequestDispatcher("reservationdelete.jsp").forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.sendRedirect("reservationdelete.jsp");
    }
}