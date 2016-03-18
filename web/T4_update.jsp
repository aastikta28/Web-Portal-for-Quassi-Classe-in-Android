<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
int num =(Integer)session.getAttribute("id");
//System.out.println(num);
String stud_id=request.getParameter("stud_id");
//System.out.println(quesn);
String name=request.getParameter("name");

//int credit=Integer.parseInt(cd);
//System.out.println(credit);
String email=request.getParameter("email");
//String opA=request.getParameter("opA");

try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement st=conn.createStatement();
 
st.executeUpdate("update student_list set stud_id='"+stud_id+"',name='"+name+"',EmailID='"+email+"' where SNo='"+num+"'");
//response.sendRedirect("question_bank_display.jsp?msg6=Changes done successfully !!");
/*}
                            }
                    }
                    }
                    }
                }*/
conn.close();
            }
catch(Exception e){
System.out.println(e);
    }

%>
<jsp:forward page="T4_student.jsp"/>