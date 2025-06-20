package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/detail")
public class LabDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String labNumber = req.getParameter("labNumber");
        req.setAttribute("labNumber", labNumber);
        req.getRequestDispatcher("/WEB-INF/detail.html").forward(req,resp);
    }
}
