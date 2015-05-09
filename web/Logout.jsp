<%-- 
    Document   : index
    Created on : May 8, 2015, 10:33:19 PM
    Author     : VietSon
--%>
<%
    session.setAttribute("userid", null);
    session.invalidate();
    response.sendRedirect("Login.jsp");
%>
