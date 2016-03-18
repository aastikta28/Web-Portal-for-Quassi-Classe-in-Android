<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<body>
       <% 
        String qtype=null;
    try
    {
        
   qtype=request.getParameter("RadioGroup1");
   System.out.println(qtype);
   if(qtype==null)
       out.println("Enter valid Option");
   if(qtype.equals("Single Choice Question"))
       response.sendRedirect("scq.jsp");
   else if(qtype.equals("Multiple Choice Question"))
     response.sendRedirect("mcq.jsp");
   else if(qtype.equals("True or False"))
      response.sendRedirect("true_falseQ.jsp");
   else if(qtype.equals("Numeric Answer"))
       response.sendRedirect("numeric_questions.jsp");
  
    }
    catch(Exception e)
    {
     System.out.println("errror"+e);
    }
    %>
    </body>

</html>


