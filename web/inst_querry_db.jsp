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
    int querry_no= (Integer)session.getAttribute("querry_no");
     String inst_id= (String)session.getAttribute("userid");
    String stud_id= (String)session.getAttribute("stud_id");
     String[] textbox=new String[100];
   for(int i=1;i <= querry_no;i++)
       {
    textbox[i]=request.getParameter("quesn_ans"+i);
    if(textbox[i] == "")
        {
        textbox[i]=null;
        }
    System.out.println(textbox[i]);
    }
     
     int i=1;
     ResultSet rs=s.executeQuery("select * from querry_list");
     while(rs.next())
          {
         int qry_no=rs.getInt(2);
          System.out.println(qry_no);
    if(i <= querry_no && qry_no==i && textbox[i]!=null)
        {
             Statement s_new=con.createStatement();
             //System.out.println(qry_no);
             String Done="Done";
             s_new.executeUpdate("update querry_list set ans = '"+Done+"',sol ='"+textbox[i]+"' where querry_no='"+i+"'");
               
      
      }
          i++;
  //Inserting into the table resgistration.
}
    out.write("Answers Sent");
    con.close();

} catch(Exception e){e.printStackTrace();}

%>
    //-->
  
<jsp:forward page="raise_querry_inst.jsp"/>
