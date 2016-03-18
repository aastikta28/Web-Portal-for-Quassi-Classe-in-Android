<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
int num1 =(Integer)session.getAttribute("id");
String num=request.getParameter("num");
String inst_id=request.getParameter("inst_id");
String stud_id=request.getParameter("stud_id");
String A=request.getParameter("cA");
String B=request.getParameter("cB");
String C=request.getParameter("cC");

try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement st=conn.createStatement();
st.executeUpdate("update enrollment_list set SNo='"+num+"',inst_id='"+inst_id+"',stud_id='"+stud_id+"',course='"+A+"',course1='"+B+"',course2='"+C+"' where SNo='"+num1+"'");
conn.close();
            }
catch(Exception e){
System.out.println(e);
    }

%>
<jsp:forward page="T2_enrollment.jsp"/>