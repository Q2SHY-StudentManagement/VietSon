<%-- 
    Document   : index
    Created on : May 8, 2015, 10:33:19 PM
    Author     : VietSon
--%>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        #header1 {
            text-align:left;
            padding:60px;
        }
        #nav2 {
            line-height:20px;
            padding:5px;	 
        }
    </style>
    <body style="background-image: url('1.jpg')">

        <form name="LoginForm">
            <div  style="text-align: center;color: red"id="header1">
                <FONT SIZE=100px ><MARQUEE>WELCOME TO STUDENT MANAGEMENT</MARQUEE></FONT>                 
            </div>  
            <div id="nav2">
                <p style="text-align: center;color: pink"><FONT SIZE=6px >Login Here</FONT> </p>
                <table align="center" >
                    <tr>
                        <td><br></td>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td style="color: gold">
                            <b>User Name:</b> 
                        </td>
                        <td>
                            <input type='text' name='txtUsername' />
                        </td>
                    </tr>
                    <tr>
                        <td><br></td>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td style="color: gold">
                            <b>Password :</b> 
                        </td>
                        <td>
                            <input type='password' name='txtPassword' />
                        </td>
                    </tr>
                    <tr>
                        <td><br></td>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" name="btnLogin" style="width: 80px;height: 30px;color:green"/></td>
                    </tr>
                </table>
                <%
                    String user = request.getParameter("txtUsername");
                    String pwd = request.getParameter("txtPassword");
                    String login = request.getParameter("btnLogin");
                    String ErrorUser = "";
                    String ErrorPass = "";
                    String Error = "";
                    
                    if (login != null && login.length() > 0) {
                        boolean test = true;
                        if (user == null || user.trim().equals("")) {
                            ErrorUser = "Username must be not null. Please input again";
                            test = false;
                        }
                        if (pwd == null || pwd.trim().equals("")) {
                            ErrorPass = "Password must be not null. Please input again";
                            test = false;
                        }
                        
                        if (test) {
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            Connection con = DriverManager.getConnection("jdbc:odbc:StudentManagement");
                            Statement st = con.createStatement();
                            ResultSet rs;
                            rs = st.executeQuery("select * from Member where Username='" + user + "' and Password='" + pwd + "'");
                            if (rs.next()) {
                                session.setAttribute("userid", user);
                                response.sendRedirect("Home.jsp");
                            } else {
                                Error = "Input invalidate. Please try again";
                            }
                        }
                    }
                %>
                <p style="text-align: center;color: red"><%=ErrorUser%></p>
                <p style="text-align: center;color: red"><%=ErrorPass%></p>
                <p style="text-align: center;color: red"><%=Error%></p>
            </div>

        </form>
    </body>
</html>
