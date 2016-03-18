<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");

String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
Statement st = conn.createStatement();
st.executeUpdate("DELETE FROM questionbank WHERE question_num = '"+no+"'");
ResultSet rs=st.executeQuery("select * from questionbank where question_num > '"+no+"'");
while(rs.next())
    {
    int num=rs.getInt(2)-1;
    
    st.executeUpdate("update questionbank set question_num='"+num+"' where question_num='"+rs.getInt(2)+"'");
}
}
catch(Exception e){}
%>
<jsp:forward page="question_bank_display.jsp"/>