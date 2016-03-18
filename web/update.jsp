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
String quesn=request.getParameter("quesn");
//System.out.println(quesn);
/*if(quesn.equals(""))
    {
    quesn=null;
    }*/
String cd=request.getParameter("credit");
/*if(cd.equals(""))
    {
    cd = "0";
    }*/
int credit=Integer.parseInt(cd);
//System.out.println(credit);
String ans=request.getParameter("ans");
String opA=request.getParameter("opA");
String opB=request.getParameter("opB");
String opC=request.getParameter("opC");
String opD=request.getParameter("opD");
String opE=request.getParameter("opE");
/*if(ans.equals(" "))
    {
    System.out.println(ans);
    ans=null;
    }*/
//System.out.println(ans);

/*if(opA.equals("") || opB.equals("") || opC.equals(""))
    {
    opA=null;
    opB=null;
    opC=null;
    }*/

if(opD.equals("")|| opE.equals(""))
    {
    opD=null;
    opE=null;
    }

try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement st=conn.createStatement();
 /* if(quesn.equals("null"))
        response.sendRedirect("edit.jsp?msg=Forgot to enter question!!");
else
    {
            if(credit <=0 )
                response.sendRedirect("edit.jsp?msg1=Frgot to enter valid marks!!");
                
            else
                {
                if(ans.equals("null"))
                    {
                    System.out.println(ans);
                    response.sendRedirect("edit.jsp?msg2=Forgot to enter answer!!");
                    }
                else
                    {
                    if(opA.equals("null"))
                        {
                    System.out.println(ans);
                        response.sendRedirect("edit.jsp?msg3=Forgot to enter option A!!");
                        }
                    else
                        {
                        if(opB.equals("null"))
                            {
                    System.out.println(ans);
                        response.sendRedirect("edit.jsp?msg4=Forgot to enter option B!!");
                        }
                    else
                        {
                            if(opC.equals("null"))
                                {
                    System.out.println(ans);
                        response.sendRedirect("edit.jsp?msg5=Forgot to enter option C!!");
                        }
                    else
                        {*/
st.executeUpdate("update questionbank set question='"+quesn+"',credit='"+credit+"',answer='"+ans+"',optionA='"+opA+"',optionB='"+opB+"',optionC='"+opC+"',optionD='"+opD+"',optionE='"+opE+"' where question_num='"+num+"'");
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
<jsp:forward page="question_bank_display.jsp"/>