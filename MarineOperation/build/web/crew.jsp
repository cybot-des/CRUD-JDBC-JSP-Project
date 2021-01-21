<%-- 
    Document   : newjsp
    Created on : 12 Jan, 2020, 3:58:08 PM
    Author     : Pooja
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{
                background-image: url("cargo-ship2.jpg");
                text-align: center;
                background-repeat: no-repeat;
                background-size: cover;
                
            }
            
            
             
            img
            {
                position: absolute;
                left: 0.1px;
            }
            
            label{
                position:absolute;
                left: 70px;
                top: 10px;
                font-size: 40px;
                 }
            
            table
            {
                font-size: 20px;
                size: 50px;
                
            }
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
                }   

            li {
                float: left;
                }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                }

            li a:hover {
                background-color: #111;
                }
            
        </style>
    </head>
    <body>
        <%
            out.println("<img src='logo2.png'>");
            out.println("<label>BLUE LINES</label>");
            out.println("<br/><br/><br/><br/>");
            out.println("<ul>");
            out.println("<li><a class='#active' href='http://localhost:8080/MarineOperation/menu.html'>Home</a></li>");
            out.println("<li><a href='#news'>&nbsp;</a></li>");
            out.println("<li><a href='#contact'>&nbsp;</a></li>");
            out.println("<li><a href='#about'>&nbsp;</a></li>");
            out.println("</ul>");
            out.println("<br/><br/><br/>");
            
            int c_id = Integer.parseInt(request.getParameter("user"));
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueLines","root","root");
            
            Statement st=con.createStatement();
            String sql="select * from crew where c_id="+c_id;
            
            
                
                ResultSet rs=st.executeQuery(sql);
                
                out.println("<table border=1 cellpadding=3px;>");
                while(rs.next())
                {
                    out.println("<tr><td>"+"crew id"+"</td><td>name</td><td>designation</td><td>nation</td><td>address</td><td>contact</td><td>sal_id/td><td>salary</td><td>duty_period</td><td>present duty location</td><td>present route_id</td><td>present vessel_id</td><td>next duty location</td><td>present duty duration</td><td>next duty duration</td></tr>");
                    out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>" +rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getInt(6)+"</td><td>"+rs.getInt(7)+"</td><td>"+rs.getInt(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td><td>"+rs.getString(12)+"</td><<td>"+rs.getString(13)+"</td><td>"+rs.getString(14)+"</td><td>"+rs.getString(15)+"</td></tr>");                                                
                    
                }
                out.println("</table>");
            
            
           
            
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
    
            
            %>
    </body>
</html>
