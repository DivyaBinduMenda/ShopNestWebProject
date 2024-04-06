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
    </head>
    <body>
    <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Expires", "0");
   
   String user = (String) session.getAttribute("user");
   if (user == null) {
       response.sendRedirect("login.jsp");
   }
%>
    
    	
        <%  
            Cart c;
            if (session.getAttribute("cart") == null) {
                c = new Cart();
                session.setAttribute("cart", c);
            } else {
                c = (Cart)session.getAttribute("cart");
            }
            
            

            List prodList=DataFetcher.fetchProductsInfo();
        %>
        <header>
            <h1>ShopNest</h1>
            <nav>
                <ul>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li><a href="#" id="logout-link">Logout</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <%  String[] prodArr2=null;;
                for(int i=0; i<prodList.size(); i++) {
                    String[] prodArr=((String)prodList.get(i)).split(":");  
                    prodArr2=prodArr;
            %>
            <section class="product">
                <div class="img-container">
                    <img src="prodImg/<%=prodArr[4]%>" alt="Product 1">
                </div>
                <h2><%= prodArr[1] %></h2>
                <p><%= prodArr[2] %></p>
                <span class="price"><%= prodArr[3] %></span>
                <form method="post" action="add-to-cart">
                    <input type="hidden" name="productId" value="<%=
                        Integer.parseInt(prodArr[0])
                    %>">
                    <input class="add-to-cart-button" type="submit" value="Add to Cart">
                </form>
            </section>
            <% } %>
        </main>
        
        <!-- Logout form -->
        <form id="logout-form" action="logout" method="post" style="display: none;">
            <input type="hidden" name="logout" value="true">
        </form>
        
        <!-- JavaScript code to handle logout link click -->
        <script>
            const logoutLink = document.getElementById("logout-link");
            logoutLink.addEventListener("click", function(e) {
                e.preventDefault();
                document.getElementById("logout-form").submit();
            });
        </script>
    </body>
</html>
