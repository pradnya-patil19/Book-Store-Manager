<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Book Details</title>
    <link rel="stylesheet" href="Home.css">
</head>
<body>
    <center>
        <form action="UpdateBook.jsp" method="post">
            <h1>Update Book Details</h1>
            <div>
                <label for="txtTitle">Title:</label>
                <input type="text" id="input" name="txtTitle" />
            </div>
            <div>
                <label for="txtAuthor">Author:</label>
                <input type="text" id="input" name="txtAuthor" />
            </div>
            <div>
                <label for="txtPrice">Price:</label>
                <input type="text" id="input" name="txtPrice" />
            </div>
            <div>
                <label for="txtQuantity">Quantity:</label>
                <input type="text" id="input" name="txtQuantity" />
            </div>
            <br />
            <input type="submit" id="btnUpdateBook" name="btnUpdateBook" value="Update Book" />
            <a id="lnkBack" href="Home.jsp">Back to Book List</a>
        </form>
    </center>
    <% 
       if(request.getParameter("btnUpdateBook")!= null)
       {
        int id=Integer.parseInt(request.getParameter("bookId")); 
        String title = request.getParameter("txtTitle");
        String author = request.getParameter("txtAuthor");
        int price = Integer.parseInt(request.getParameter("txtPrice"));
        int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
        PreparedStatement ps = c.prepareStatement("update BookData set title=?,author=?,price=?,quantity=? where bookid=?");
        ps.setString(1, title);
        ps.setString(2, author);
        ps.setInt(3, price);
        ps.setInt(4, quantity);
        ps.setInt(5, id);
        int i = ps.executeUpdate();
        if(i>0)
        {%><div class="afterText"> <p style="color:greenyellow">Data Updated...</p>
        <% }else 
        { %><p style="font-size: 27px; color: red; text-align: center;">Something Wrong!</p> </div>
        <% 
        }
        ps.close();
        c.close(); 
       }
    %> 
</body>
</html>
