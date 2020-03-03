<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 String un=request.getParameter("uname");
String em=request.getParameter("email");
String ps=request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();

String sql="insert into login (user_name,Email_id,password) values('"+un+"','"+em+"','"+ps+"')";
System.out.println(sql);
st.execute(sql);

con.close();
response.sendRedirect("show.jsp");
%>

</body>
</html>