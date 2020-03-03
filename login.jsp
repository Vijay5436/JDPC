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
String ps=request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
String sql="select user_name,password from login";
ResultSet rs=st.executeQuery(sql);
int flag=0;
try
{
	while(rs.next())
	{

	String uname=rs.getString("user_name");
	String pass=rs.getString("password");
	if(un.equals(uname) && ps.equals(pass))
	{
		//response.sendRedirect("shows.jsp");
		flag=1;
		break;
			//out.println("Success");
	}
	else
	{
		//out.println("Invalid");
		flag=0;
	}
}

	if(flag==1)
	{
		out.println("Success");
		
		
	}
	else
	{
		out.println("Invalid");
	}
	}
	catch(Exception e)
{
e.printStackTrace();		
}

%>

</body>
</html>