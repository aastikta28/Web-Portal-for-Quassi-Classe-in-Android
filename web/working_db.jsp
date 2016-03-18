<%-- 
    This jsp page is used to store data into the the database table when the new user is registering for the quiz module.
--%>

<<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>


    
  
    
    
    <%

try
        {

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    //Getting the various parameters which have been given by the user.
  
 String inst_id = (String)session.getAttribute("userid");
 int year=Integer.parseInt(request.getParameter("year"));

int jan =Integer.parseInt(request.getParameter("jan"));

int feb =Integer.parseInt(request.getParameter("feb"));

int mar =Integer.parseInt(request.getParameter("mar"));

int apr =Integer.parseInt(request.getParameter("apr"));

int may =Integer.parseInt(request.getParameter("may"));

int jun =Integer.parseInt(request.getParameter("jun"));

int jul =Integer.parseInt(request.getParameter("jul"));

int aug =Integer.parseInt(request.getParameter("aug"));

int sep =Integer.parseInt(request.getParameter("sep"));

int oct =Integer.parseInt(request.getParameter("oct"));

int nov=Integer.parseInt(request.getParameter("nov"));

int dec =Integer.parseInt(request.getParameter("dec"));

    
    s.executeUpdate("insert into workingdays values('" + inst_id + "','"+year+"','"+jan+"','"+feb+"','"+mar+"','"+apr+"','"+may+"','"+jun+"','"+jul+"','"+aug+"','"+sep+"','"+oct+"','"+nov+"','"+dec+"')");

    
    
    
    
      con.close();

} catch(Exception e){e.printStackTrace();}
    
%>
<jsp:forward page="adminfunctions.jsp"/>
