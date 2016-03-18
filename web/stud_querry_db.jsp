<%-- 
    This jsp page is used to store data into the the database table when the new user is registering for the quiz module.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
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
   
    String textbox=request.getParameter("quesn");
    String stud_id= (String)session.getAttribute("userid");
    if(textbox != null)
    {
   
   ResultSet rs=s.executeQuery("select querry_no from querry_list");
      int querry_no=1;
    if(rs.last())
        {
        querry_no=rs.getInt(1)+1;
        }
      
   s.executeUpdate("insert into querry_list values('" + stud_id + "','" + querry_no + "','"+ textbox + "','" +0+"','"+"NULL"+"')");//Inserting into the table resgistration.
}
 
    con.close();

} catch(Exception e){e.printStackTrace();}

%>
    //-->
  
<jsp:forward page="raise_querry_stud.jsp"/>
