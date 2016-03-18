<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.putValue("userid","userid");
    %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<body>
       <% 
        /*Here we verify the information entered by the user in the e-mail id text field and password field */
            /*This page is called when the user clicks on the 'Login' button as the action of the corresponding form on index.jsp is the current page 'login,jsp' */
       String fname=null,fpassword=null;
    try
    {
        
    fname=request.getParameter("userid");
    fpassword=request.getParameter("password");
    /*Establishing connection with the back end Mysql database named 'quassi_classe'*/
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select Role,FName,Password,LoginID from registration where LoginID='"+fname+"' and Password='"+fpassword+"'");

    String s1;
    String s2;
    String s3;
    if(rs.next())
          {
                   s1=rs.getString(1); // Role of the user
                   s2=rs.getString(2); // First name of the user
                  s3=rs.getString(4); // Test Alloted to the user, this entry is set as 'NA' by default if the centre is not alloted
                   if( s1.equals("Instructor")) // if the user who is trying to log in is a teacher

                    {
                       //set user's session
                         session.setAttribute("firstName",s2);
                    session.setAttribute("name",fname);
                    session.setAttribute("password",fpassword);
                    session.setAttribute("userid",s3);
                  
   response.setStatus(response.SC_MOVED_TEMPORARILY);
   response.setHeader("Location", "instructor_index.jsp");//redirect to the teacher's page
                    %>
                   
                    <%

                    }
                    else if(s1.equals("Student"))// if the user who is trying to log in is a Student

                    {
                    //set user's session
                    session.setAttribute("firstName",s2);
                     session.setAttribute("name",fname);
                    session.setAttribute("password",fpassword);
                    session.setAttribute("userid",s3);
                    //session.setAttribute("testName",s3);
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
   response.setHeader("Location", "student_index.jsp");//redirect to the student's page
                    %>
                   
                    <%


                    }

                   else if(s1.equals("Admin")) // if the user who is trying to log in is the admin

                    {
                     //set user's session
                    session.setAttribute("firstName",s2);
                     session.setAttribute("name",fname);
                    session.setAttribute("password",fpassword);
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
   response.setHeader("Location", "admin_index.jsp");//redirect to the admin's page
                    %>

                    <%


                    }
                   else
         
        {
       //out.println("Invalid Username/Password");
       response.sendRedirect("login.jsp?msg=Invalid UserId/Password");
         }
          }


     else 
          {
    
        //out.println("Invalid Username/Password");
        
     response.sendRedirect("login.jsp?msg=Invalid UserId/Password");// redirect to login page, give error message and ask the user to enter the details again
        
   

      %>
    
     <%

          }
 
    }
    catch(Exception e)
    {
     System.out.println("errror"+e);
    }
    %>
    </body>

</html>