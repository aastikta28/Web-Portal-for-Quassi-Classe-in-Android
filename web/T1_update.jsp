<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
int num =(Integer)session.getAttribute("id");
String fn=request.getParameter("fn");
String ln=request.getParameter("ln");
String dob=request.getParameter("dob");
String gn=request.getParameter("gn");
String st=request.getParameter("st");
String cty=request.getParameter("cty");
String mob=request.getParameter("mob");
String email=request.getParameter("email");


try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement stmt=conn.createStatement();
stmt.executeUpdate("update registration set FName='"+fn+"',LName='"+ln+"',DOB='"+dob+"',Gender='"+gn+"',State='"+st+"',City='"+cty+"',Mobile='"+mob+"',Email='"+email+"' where SNo='"+num+"'");
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
<jsp:forward page="T1_reg.jsp"/>