<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Store Manager</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="Home.css">
</head>
<body>
    <center>
        <h1>Book Store Manager</h1>
        <table border="1" id="GridViewBooks" style="background-color: #333333; color: white;" cellspacing="0">
            <thead>
                <tr>
                    <th style="color: white">&nbsp; Book ID &nbsp;</th>
                    <th>&nbsp; Title &nbsp;</th>
                    <th>&nbsp; Author &nbsp;</th>
                    <th>&nbsp; Price &nbsp;</th>
                    <th>&nbsp; Quantity &nbsp;</th>
                    <th>&nbsp; Actions &nbsp;</th>
                </tr>
            </thead>
            <tbody>
            <% 
              Class.forName("org.apache.derby.jdbc.ClientDriver");
              Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
              PreparedStatement ps = c.prepareStatement("select * from BookData");
              ResultSet bookData = ps.executeQuery();
              int AddID=1;
              while(bookData.next())
              {
            %>
            <tr>
                <td><%= bookData.getInt(1) %></td>
                <td><%= bookData.getString(2)%></td>
                <td><%= bookData.getString(3)%></td>
                <td><%= bookData.getInt(4)%></td>
                <td><%= bookData.getInt(5)%></td>
                <td>
                    <div class="func">

                        &nbsp;<a href="ViewBooks.jsp?bookId=<%= bookData.getInt(1) %>" class="lbstyle">View</a>&nbsp;
                        <a href="UpdateBook.jsp?bookId=<%= bookData.getInt(1) %>" class="lbstyle">Update</a>&nbsp;
                        <a href="DeleteBook.jsp?bookId=<%= bookData.getInt(1) %>&title=<%= bookData.getString(2)%>" class="lbstyle">Delete</a>&nbsp;
                    </div>
                </td>
            </tr>
            <%
              AddID++;
              }
              bookData.close();
              ps.close();
              c.close();
            %>
            </tbody>
        </table>
        <br />
        <a id="lnkAddBook" href="AddBook.jsp?aId=<%= AddID %>" style="color: #FF9933; text-decoration: none; font-decoration: false;; font-size: 25px">Add New Book</a>
    </center>
            <script>
                function onClick(bookId) {
                    
                }
            </script>
</body>
</html>
