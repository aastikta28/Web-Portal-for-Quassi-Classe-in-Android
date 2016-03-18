<%-- 
    This jsp page is used to store data into the the database table when the new user is registering for the quiz module.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*, java.util.*"%>
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
   String qname=request.getParameter("qname");
   if(qname.equals(""))
       qname=null;
   //System.out.println(qname);
       String d = request.getParameter("duration");
       if(d.equals(""))
               d="0";
       int duration=Integer.parseInt(d);
       //System.out.println(duration);
    String inst_id= (String)session.getAttribute("userid");
    String[] quesns = request.getParameterValues("ListBox2"); 
    String ans="";
    
    //System.out.println(quesns.length);
            if (quesns != null && quesns.length != 0) 
            {
            //System.out.println("You have selected: ");
            for (int i = 0; i < quesns.length; i++) 
            {
            //System.out.println(quesns[i]);
               
            ans=ans+quesns[i];
            if(i != quesns.length-1)
            ans=ans+",";
            }
            }
    else
        response.sendRedirect("quiz_bank.jsp?msg3=Select Quiz Questions");
    String quesn_id="",ans1="";
    for(int i=0;i<quesns.length;i++)
        {
        ResultSet rs1=s.executeQuery("select * from questionbank where inst_id='"+inst_id+"' and question='"+quesns[i]+"'");
        if(rs1.next())
            {
        quesn_id=quesn_id+rs1.getInt(2)+",";
        ans1=ans1+rs1.getString(6)+",";
        }
        System.out.println(quesn_id);
    }
    if(qname != null)
    {
        if(duration >0 && duration < 1000)
            {
   
   ResultSet rs=s.executeQuery("select quiz_id from quizbank");
      int quiz_id=1;
    if(rs.last())
        {
        quiz_id=rs.getInt("quiz_id")+1;
        }
      
   s.executeUpdate("insert into quizbank values('" + inst_id + "','" + quiz_id+ "','"+ qname + "','" + ans + "','"+duration+"','"+quesn_id+"','"+ans1+"')");
   response.sendRedirect("quiz_bank.jsp?msg2=Quiz Submitted successfully !!");
}
        else
            response.sendRedirect("quiz_bank.jsp?msg1=Invalid Duration (Add information again !!)");
}
 else
     {
        response.sendRedirect("quiz_bank.jsp?msg=Enter Quiz Name (Add information again !!)");
 }
    con.close();

} catch(Exception e){e.printStackTrace();}

%>
   
  

