<%-- 
    This jsp page is used to store data into the the database table when the new user is registering for the quiz module.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            session.getAttribute("userid");
%>



<%

            try {


//Establishing connection with back end database
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe", "root", "durga");
                Statement s = con.createStatement();
                int option[] ,score [];
    //Getting the various parameters which have been given by the user.
    String inst_id = (String)session.getAttribute("userid");
                int count=1;
                String quiz_name = (String)session.getAttribute("quiz");
                int quiz_id = (Integer)session.getAttribute("quiz_id");
                String stud_id=request.getParameter("stud_id");
                System.out.println(quiz_name);
                System.out.println(stud_id);
              int a = (Integer) session.getAttribute("a");
                System.out.println(a);
                String[] std_ans = new String[100];
                String option1="";
                for (int i = 0; i < a; i++) 
                {
                   String select1[] = request.getParameterValues("option1"+i);
String appendAns="";    
            if (select1 != null && select1.length != 0) 
            {
            System.out.println("You have selected: ");
            for (int q = 0; q < select1.length; q++) 
            {
            System.out.println(select1[q]);
            appendAns=appendAns+select1[q];
            
            }
            std_ans[i]=appendAns;
            System.out.println(appendAns);
            if (std_ans[i] == "") 
                    {
                        std_ans[i] = null;
                    }
            }
                option1=option1+std_ans[i]+",";
                    System.out.println(std_ans[i]);
                }
                System.out.println(option1);
                ResultSet rs1=s.executeQuery("select * from testresult" );
                if(rs1.last())
                        {
                    count=rs1.getInt(1)+1;
                }
                s.executeUpdate("insert into testresult values('" +count + "','"+inst_id+"','"+stud_id+"','"+quiz_name+"','"+option1+"','"+quiz_id+"')");//Inserting into the table resgistration.

                

                con.close();

            } catch (Exception e) {
                e.printStackTrace();
            }

%>
<jsp:forward page="quiz.jsp"/>
