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
    String inst_id=(String)session.getAttribute("userid");
     int qtype= (Integer)session.getAttribute("qtype");
     String ans="",optionA="",optionB="";
    // System.out.println(qtype);
     String type="";
     int qnum=1;
     if(qtype==1)
         {
         type="Single Choice Question";
         optionA=(String)request.getParameter("textieA");
          optionB=(String)request.getParameter("textieB");
         ans=(String)request.getParameter("option1");
         }
     else if(qtype==2)
         {
         type="Multiple Choice Question";
         //String ans="";
          optionA=(String)request.getParameter("textieA");
           optionB=(String)request.getParameter("textieB");
         String select[] = request.getParameterValues("option1"); 
            if (select != null && select.length != 0) 
            {
            System.out.println("You have selected: ");
            for (int i = 0; i < select.length; i++) 
            {
            System.out.println(select[i]);
            ans=ans+select[i];
            if(i!=select.length-1)
            ans=ans+"";
            }
            }
        }
     else if(qtype==3)
         {
         type="Numeric Question";
         ans=(String)request.getParameter("textieA");
         optionA=null;
         optionB=null;
         }
     else if(qtype==4)
         {
         type="True or False";
         optionA="True";
         optionB="False";
         ans=request.getParameter("option1");
         }
     ResultSet rs= s.executeQuery("select * from questionbank");
     if(rs.last())
        {
        qnum=rs.getInt(2)+1;
        }
    // System.out.println(type);
    //System.out.println(qnum);
     StringBuffer qtext = new StringBuffer(request.getParameter("qtext"));
     int loc = (new String(qtext)).indexOf('\n');
    // System.out.println(loc);
        while(loc > 0){
            qtext.replace(loc, loc+1, "<BR>");
            loc = (new String(qtext)).indexOf('\n');
       }
    //   out.println(qtext);
    // System.out.println(qtext);
     String credit=request.getParameter("credit");
    // System.out.println(credit);
     
    // System.out.println(optionA);
              
         String optionC=(String)request.getParameter("textieC");
         String optionD=(String)request.getParameter("textieD");
         String optionE=(String)request.getParameter("textieE");
         
         System.out.println(ans);
         if(optionA=="" || optionB=="" || optionC=="")
             out.println("Enter valid options");
         if(optionD=="")
            optionD=null;
         if(optionE=="")
             optionE=null;
         s.executeUpdate("insert into questionbank values('"+inst_id+"','"+qnum+"','"+qtext+"','"+type+"','"+credit+"','"+ans+"','"+optionA+"','"+optionB+"','"+optionC+"','"+optionD+"','"+optionE+"')");

    con.close();

} catch(Exception e){e.printStackTrace();}

%>
<jsp:forward page="question_bank.jsp"/>
