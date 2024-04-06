package com.shopNest.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/log")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");
        boolean val = Validator.isValid(uname, pass);

        if (val == true && uname.equals("admin")) {
            HttpSession session = request.getSession();
            session.setAttribute("user", "admin");
            response.sendRedirect("admin.jsp");
        } else if (val == true) {
            HttpSession session = request.getSession();
            session.setAttribute("user", uname);
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
