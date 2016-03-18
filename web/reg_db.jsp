<%-- 
    This jsp page is used to store data into the the database table when the new user is registering for the quiz module.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


    
    <%

try
        {

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    int num=0;
     ResultSet r=s.executeQuery("select SNo from registration");
       if(r.last())
           {
           num=r.getInt(1)+1;
       }
    //Getting the various parameters which have been given by the user.
    String role=request.getParameter("RadioGroup1");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
String dob=request.getParameter("dob");
String gender=request.getParameter("RadioGroup2");
String state=request.getParameter("state");
String city=request.getParameter("city");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
String passwd_0=request.getParameter("passwd_0");

//System.out.println("Hi");
    if(role.equals("Instructor"))
        {
        System.out.println("Hi");
        
        ResultSet rs=s.executeQuery("select inst_id,EmailID from instructor_list where EmailID='"+email+"'");
        if(rs.next())
            {
            System.out.println("Hi");
            String s2=rs.getString(2);
    if(s2.equals(email))
        {
        System.out.println(rs.getString(2));
        String qry="insert into registration values('" + role + "','" + fname + "','"+ lname + "','" + dob + "','"+gender+"','"+state+"','"+city+"','"+mobile+"','"+email+"','"+passwd_0+"','"+rs.getString(1)+"','"+num+"')";//Inserting into the table resgistration.

    s.executeUpdate(qry);
    }
    }    
    }
    else if(role.equals("Student"))
        {
        System.out.println("Hi");
       ResultSet rs2=s.executeQuery("select stud_id,EmailID from student_list where EmailID='"+email+"'");
        if(rs2.next())
           { 
            System.out.println("Hi");
            String s1=rs2.getString(2);
            System.out.println(s1);
    if(s1.equals(email))
        {
        System.out.println("Hi");
        String qry="insert into registration values('" + role + "','" + fname + "','"+ lname + "','" + dob + "','"+gender+"','"+state+"','"+city+"','"+mobile+"','"+email+"','"+passwd_0+"','"+rs2.getString(1)+"','"+num+"')";//Inserting into the table resgistration.

    s.executeUpdate(qry);
    
    }
        }
    }
    else
        {
    out.println("Sorry !! You are not a registered participant !!");
       
    }
    con.close();

} catch(Exception e){e.printStackTrace();}

%>
<jsp:forward page="registration.jsp"/>
