<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Book</title>
    <link rel="stylesheet" href="Home.css">
</head>
<body>
    <%
       int id=Integer.parseInt(request.getParameter("bookId")); 
       String title=request.getParameter("title");
    %>
    <center>
        <form id="form1" method="post">
            <h1>Delete Book</h1>
            <p id="lblConfirmation" style="font-size: 27px; color: #bfbfbf;">Are you sure you want to delete <% out.println(title); %></p>
            <br />
            <input type="submit" id="btnDeleteBook" name="btnDeleteBook" value="Delete Book" />
            <input type="submit" id="btnCancel" name="btnCancel" value="Cancel" />
        </form>
    </center>
    <% 
       if(request.getParameter("btnDeleteBook")!= null)
       {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
        PreparedStatement ps = c.prepareStatement("Delete from BookData where bookid=?");
        ps.setInt(1, id);
        int i = ps.executeUpdate();
        if(i>0)
        {%><div class="afterText"> <p style="color:greenyellow">Data Deleted...</p>
        <% }else 
        { %><p style="font-size: 27px; color: red; text-align: center;">Something Wrong!</p> </div>
        <% 
        }
        ps.close();
        c.close(); 
       }
       if(request.getParameter("btnCancel") != null)
       {
           response.sendRedirect("Home.jsp");
       }
    %> 
</body>
</html>
