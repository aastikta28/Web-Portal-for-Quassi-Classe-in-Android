<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>
<html lang="en">
<head>
<title>Quassi Classe`</title>

<meta charset="utf-8">
<link rel="stylesheet" href="reset.css" type="text/css" media="all">
<link rel="stylesheet" href="layout.css" type="text/css" media="all">
<link rel="stylesheet" href="style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.5.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Molengo_400.font.js"></script>
<script type="text/javascript" src="js/Expletus_Sans_400.font.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.bg, .box2{behavior:url("js/PIE.htc");}</style>
<![endif]-->
</head>

<div class="body1">
  <div class="main">
    <!-- header -->
    <header>
      <div class="wrapper">
        <nav>
          <ul id="menu">
            
            <li><a href="adminfunctions.jsp">Attendance</a></li>
            <li><a href="quiz.jsp">Quiz</a></li>
            <li><a href="inst_result.jsp">Report</a></li>
            <li><a href="question_bank.jsp">Question Bank</a></li>
            <li><a href="quiz_bank.jsp">Quiz Bank</a></li>
            <li><a href="raise_querry_inst.jsp">Raise Hand</a></li>
            <li class="end"><a href="instructor_poll.jsp">Poll</a></li>
            <li class="end">&nbsp;</li>
            <li class="end">&nbsp;</li>
            <li class="end"><a href="logout.jsp">Log Out</a></li>
          </ul>
        </nav>
        
      </div>
      
      <div id="slogan"> 
      
      <a href="instructor_index.jsp">Quassi Classe` </a>
      
      </div>
      <div id="slogan"> 
      Life in harmony <span>with education </span>
      </div>
    </header>
    <!-- / header -->
  </div>
</div>
<div class="body2" name="body2">
  <div class="main" name="main">
    <!-- content -->
    <section id="content" name="section">
   
              <form >
                  <marquee>   <h3> <font color="blue">Result</font></h3>   </marquee> 
         
              <%
          try
        {
    

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    String inst_id= (String)session.getAttribute("userid");
   //String quiz_name = (String)session.getAttribute("quiz_name");
   String quiz_name = request.getParameter("ListBox1");
   %>
  
          <h3 align="center" ><font color="blue"> Test Name: <%=quiz_name%></font> </h3>
   <%
   String ans="";
   String quesn_ids="" ;
   int question_num=0 ;
   String[] stud_id=new String[100];
   int c=0;
   ResultSet rst=s.executeQuery("select stud_id from enrollment_list where inst_id='"+inst_id+"'");
   while(rst.next())
       {
       stud_id[c]=rst.getString(1);
       c++;
      // System.out.println(stud_id[c]);
   }
   c=0;
   for(c=0;c<5;c++)
       {
       String stud_ans ="";
    ResultSet rs1=s.executeQuery("select ans from testresult where quiz_name ='"+quiz_name+"' and stud_id='"+stud_id[c]+"'");
                if(rs1.last())
                        {
                    stud_ans=rs1.getString(1);
                    }
    System.out.println(stud_ans);
    if(stud_ans.equals(""))
        {
        
    }
    else
        {
    String stud_answers[]=stud_ans.split(",");
    /*for(int i=0;i<stud_answers.length;i++)
        System.out.println(stud_answers[i]);*/
    ResultSet rs=s.executeQuery("select * from quizbank where quiz_name ='"+quiz_name+"'" );
    if(rs.next())
                    {
                    quesn_ids=rs.getString(6);
                    ans=rs.getString(7);
                    }
    String quesn_id[]=quesn_ids.split(",");
    String quesn[]=new String[100];
    int cd[]=new int[50];
    int k=0;
   for(int i=0;i<quesn_id.length;i++)
       {
        //System.out.println(quesn_id[i]);
        ResultSet rs2=s.executeQuery("select question,credit from questionbank where question_num ='"+quesn_id[i]+"'" );
        if(rs2.next())
            {
            quesn[k]=rs2.getString(1);
            cd[k]=rs2.getInt(2);
            k++;
        }
        }
  
    int score=0,w=0,p=0;
   String answers[]=ans.split(",");
   /* for(int i=0;i<answers.length;i++)
        System.out.println(answers[i]);*/
   while(p < answers.length)
       {
       
           if(answers[p].equals(stud_answers[w]))
               {
               score=score+cd[w];
               w++;
               p++;
           }
           else
               
               {
               w++;
               p++;
               }
       
   }
   
   %>
   <h4 style="border:6px groove #F7730E;">Student ID: <%=stud_id[c]%></h4>
   <br>
    <%
   int sc=0;
   for(int x=0;x<k;x++)
       sc=sc+cd[x];
   %>
   
   <h4 >Total Score: <%=sc%></h4>
  <h4>Score Obtained: <%=score%></h4>
  <br>
      <br>
 <%  
   
   
   
   
   
   
   }
    }
    con.close();

} catch(Exception e){e.printStackTrace();}

        %>
    
    
    </form>
        
    </section>
    <!-- content -->
    <!-- footer -->
    <footer>
      <div class="wrapper">
        <div class="pad1">
          <div class="pad_left1">
            <div class="wrapper">
              <article class="col_1">
                 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <h3>Address:</h3>
                <p class="col_address"><strong>Country:<br>
                  City:<br>
                  Address:<br>
                  </strong></p>
                <p>INDIA<br>
                  Karaikal<br>
                  Nehru Nagar<br>
                  </p>
              </article>
                          </div>
            <div class="wrapper">
              <article class="call"> <span class="call1">Call Us Now: </span><span class="call2">+91(0)4368-231-665 </span> </article>
              <article class="col_4 pad_left2">Copyright &copy; <a href="www.nitpy.ac.in">nitpy.ac.in</a> All Rights Reserved<br>
              </article>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- / footer -->
  </div>
</div>
<script type="text/javascript">Cufon.now();</script>
</html>