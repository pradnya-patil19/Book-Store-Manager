<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Book Details</title>
    <link rel="stylesheet" href="Home.css">
</head>
<body>
    <h1>View Book Details</h1>
    <% 
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
    PreparedStatement ps = c.prepareStatement("select * from BookData");
    ResultSet bookData = ps.executeQuery();
    int id=Integer.parseInt(request.getParameter("bookId")); 
    
    while(bookData.next())
    {
        if( id ==bookData.getInt(1))
        {
    %>
    <div>
        <label for="lblTitle">Title :</label>
        <span id="lblTitle"><%= bookData.getString(2)%></span>
    </div>
    <div>
        <label for="lblAuthor">Author :</label>
        <span id="lblAuthor"><%= bookData.getString(3)%></span>
    </div>
    <div>
        <label for="lblPrice">Price :</label>
        <span id="lblPrice"><%= bookData.getInt(4)%></span>
    </div>
    <div>
        <label for="lblQuantity">Quantity :</label>
        <span id="lblQuantity"><%= bookData.getInt(5)%></span>
    </div>
    <%
        }
        else {
            %>
            <label for="lblPrice">No Record Found</label>
            <%
        }
    }
    bookData.close();
    ps.close();
    c.close();
    %>
    <br /><br>
    <a id="lnkBack" href="Home.jsp" style="font-size: 25px">Back to Book List</a>
</body>
</html>
