package com.shopNest.customer;


import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/createOrder")
public class OrderCreationServlet extends HttpServlet {
    
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    double amount = Double.parseDouble(req.getParameter("amount"));
	    Order order = null;
	    try {
	        RazorpayClient razorpay = new RazorpayClient("rzp_test_ANiFbfIjOIx3EF", "jgHc0g5bAebbeilwWX1uXP45");

	        JSONObject orderRequest = new JSONObject();
	        orderRequest.put("amount", amount * 100); // amount in the smallest currency unit
	        orderRequest.put("currency", "INR");
	        orderRequest.put("receipt", "order_rcptid_11");

	        order = razorpay.orders.create(orderRequest);
	        
	    } catch (RazorpayException e) {
	        e.printStackTrace();
	    }

	    resp.setContentType("text/plain");
	    PrintWriter out = resp.getWriter();
	    out.print(order != null ? order.toString() : "");
	    out.flush();
	}

}
