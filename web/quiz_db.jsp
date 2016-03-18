<%-- 
    This jsp page is used to store data into the the database table when the new user is registering for the quiz module.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*, java.util.*, java.util.Calendar, java.text.*"%>
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
    java.util.Date cur_tym=new java.util.Date();
    java.util.Date expire_tym=new java.util.Date();
   Calendar c = Calendar.getInstance(); 
c.setTime(cur_tym); 
c.add(Calendar.DATE, 1);
expire_tym = c.getTime(); 

DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String ct = dateformat.format(cur_tym);
String et = dateformat.format(expire_tym);

System.out.println(ct);
System.out.println(et);
 int alert_id=1;
    String textbox=request.getParameter("alert");
    String inst_id= (String)session.getAttribute("userid");
    if(textbox != null)
    {
   
   ResultSet rs=s.executeQuery("select alert_id from quizalerts");
     
    if(rs.last())
        {
        alert_id=rs.getInt("alert_id")+1;
        }
      
   s.executeUpdate("insert into quizalerts values('" + inst_id + "','" + alert_id+ "','"+ textbox + "','" +ct+"','"+et+"')");//Inserting into the table resgistration.
}
 
    con.close();

} catch(Exception e){e.printStackTrace();}

%>
    //-->
  
<jsp:forward page="quiz.jsp"/>
