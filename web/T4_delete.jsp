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
st.executeUpdate("DELETE FROM student_list WHERE SNo = '"+no+"'");
ResultSet rs=st.executeQuery("select * from student_list where SNo > '"+no+"'");
while(rs.next())
    {
    int num=rs.getInt(4)-1;
    
    st.executeUpdate("update student_list set SNo='"+num+"' where SNo='"+rs.getInt(4)+"'");
}
}
catch(Exception e){}
%>
<jsp:forward page="T4_student.jsp"/>