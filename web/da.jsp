<%-- 
    Document   : da
    Created on : Apr 29, 2014, 11:02:01 PM
    Author     : Durga
--%>





<%@page contentType="image/jpg" %>
<%@ page session="false"%> 
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
              
try
        {
    

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
                System.out.println("hiiiiiiiiiiiiiiiiiii");
               
                System.out.println("hiiiiiiiiiiiiiiiiiiii");
                s = con.createStatement();
                System.out.println("hiiiiiiiiiiiiiiiiiiiiii");
                ResultSet rs = s.executeQuery("select * from image");
                if (rs.next()) {
                    String s1 = rs.getString(2);
                     System.out.println(s1);
                    OutputStream o = response.getOutputStream();
                    System.out.println(s1);
                    InputStream is = new FileInputStream(new File("C:\\Users\\Durga\\Pictures"));
                    byte[] buf = new byte[32 * 1024];
                    int nRead = 0;
                    while ((nRead = is.read(buf)) != -1) {
                        o.write(buf, 0, nRead);
                    }
                    o.flush();
                    o.close();
                    return;
                }
            } catch (Exception e) {
            } 

%>
//-->