<%@page import="com.shopNest.products.Cart"%>
<%@page import="com.shopNest.products.Product"%>
<%@page import="com.shopNest.db.DataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>ShopNest</title>
        <link rel="stylesheet" href="styles.css">
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <% 
            Cart c;
            if (session.getAttribute("cart") != null) {
                c = (Cart)session.getAttribute("cart");
            } else {
                c = new Cart();
            }
            List itemsList=c.getItems();
        %>  
        <header>
            <h1>ShopNest</h1>
            <nav>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                   
                </ul>
            </nav>
        </header>
        <main>
            <%
                for(int i=0; i<itemsList.size(); i++) {
                    String p=((Product)(itemsList.get(i))).getPname();
            %>
            <section class="product">
                <h2><%= p %></h2>
               
                <span class="price"><%= ((Product)(itemsList.get(i))).getPprice() %></span>
            </section>
            <%
                }                              
            %>
            <div class="payment-section">
    <span>Total: <%= c.getTotal() %></span>
    <form id="payment-form">
        <input type="hidden" id="amount" name="amount" value="<%= c.getTotal() %>">
        <button type="submit" id="pay-button">Pay</button>
    </form>
</div>
        </main>
    <script>
        $("#payment-form").on("submit", function(e) {
            e.preventDefault();
            
            createOrder();
        });

        function createOrder() {
        	
            var amount = parseFloat($("#amount").val()) ;
            $.post("createOrder", { amount: amount })
                .done(function(order) {
                    order = JSON.parse(order);
                    var options = {
                        "key": "rzp_test_ANiFbfIjOIx3EF", // Replace with your key ID
                        "amount": order.amount_due.toString(), // Amount received from the server
                        "currency": "INR",
                        "name": "Shop Nest",
                        "description": "Test Transaction",
                        "order_id": order.id, // Order ID received from the server
                        "handler": function (response) {
                            verifyPayment(response.razorpay_order_id, response.razorpay_payment_id, response.razorpay_signature);
                        },
                        "prefill": {
                            "name": "Your Name",
                            "email": "test@example.com",
                            "contact": "9999999999"
                        },
                        "notes": {
                            "address": "Your Address"
                        },
                        "theme": {
                            "color": "#F37254"
                        }
                    };
                    var rzp1 = new Razorpay(options);
                    rzp1.open();
                })
                .fail(function(error) {
                    console.error("Error:", error);
                });
        }

        function verifyPayment(orderId, paymentId, signature) {
            $.post("/verify", { orderId: orderId, paymentId: paymentId, signature: signature })
                .done(function(isValid) {
                    if (isValid) {
                        console.log("Payment successful");
                    } else {
                        console.log("Payment failed");
                    }
                })
                .fail(function(error) {
                    console.error("Error:", error);
                });
        }
    </script>
    </body>
</html>
