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
    //Getting the various parameters which have been given by the user.
    int[] quesn_id=new int[100];
    int querry_no= (Integer)session.getAttribute("querry_no");
   String[] ans=new String[100];
   //System.out.println("Hi"); 
   for(int i=0;i < querry_no;i++)
       {
    quesn_id[i]= (Integer)session.getAttribute("quesn_id"+i);
    System.out.println(quesn_id[i]);
    }
    for(int i=0;i < querry_no;i++)
       {
    ans[i]=request.getParameter("option"+i);
    if(ans[i] == "")
        {
        ans[i]=null;
        }
    System.out.println(ans[i]);
    }
   for(int j=0;j<=querry_no;j++)
       {
    ResultSet rs=s.executeQuery("select option_yes,option_no from instructor_poll where question_id='"+quesn_id[j]+"'");
   
   
       if(rs.next())
        {
          
              System.out.println("Hi"); 
        //String ans=request.getParameter("option");
        if(ans[j].equals("Yes"))
            {
            System.out.println("Hi"); 
            
            //ResultSet rs2=s.executeQuery("select option_yes from instructor_poll where inst_id='"+session.getAttribute("inst_id")+"'");
            int count_yes=rs.getInt("option_yes");
            System.out.println(count_yes);
            count_yes=count_yes+1;
            s.executeUpdate("update instructor_poll set option_yes='"+count_yes+"' where question_id='"+quesn_id[j]+"'");//Inserting into the table resgistration.

        }
        else if(ans[j].equals("No"))
            {
            System.out.println("Hi");
            //ResultSet rs2=s.executeQuery("select option_no from instructor_poll where inst_id='"+session.getAttribute("inst_id")+"'");
            int count_no=rs.getInt("option_no");
            count_no=count_no+1;
            s.executeUpdate("update instructor_poll set option_no='"+count_no+"' where question_id='"+quesn_id[j]+"'");//Inserting into the table resgistration.

        }
    
      }    
    
 }

    con.close();

} catch(Exception e){e.printStackTrace();}

%>
<jsp:forward page="stud_poll.jsp"/>
