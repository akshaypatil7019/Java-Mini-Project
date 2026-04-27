package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("report_form.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setAttribute("reportType", req.getParameter("reportType"));
        req.setAttribute("fromDate",   req.getParameter("fromDate"));
        req.setAttribute("toDate",     req.getParameter("toDate"));
        req.getRequestDispatcher("/ReportServlet").forward(req, res);
    }
}