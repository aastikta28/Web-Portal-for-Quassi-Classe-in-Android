<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*, java.util.Calendar"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>
    
<html lang="en" >
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
            <li><a href="student_index.jsp">Home</a></li>
            <li><a href="report.jsp">Attendance Report</a></li>
            <li><a href="stud_qiz.jsp">Quiz</a></li>
            <li><a href="stud_result.jsp">Report</a></li>
            <li><a href="raise_querry_stud.jsp">Raise Hand</a></li>
            <li><a href="stud_poll.jsp">poll</a></li>
            
            <li class="end"><a href="logout.jsp">Logout</a></li>
          </ul>
        </nav>
        
      </div>
      
      <div id="slogan"> 
      
     Quassi Classe` 
      
      </div>
      <div id="slogan"> 
      Life in harmony <span>with education </span>
      </div>
    </header>
    <!-- / header -->
  </div>
</div>
<div class="body2">
  <div class="main">
    <!-- content -->
    <section id="content">
      <div class="wrapper">
        <div class="pad1 pad_top1">
        </div>
      </div>
      <div class="box1">
        <div >
          <article >
           
             
             <form action="stud_db.jsp" method="post" class="Form">
                     
                
               <p>
               <font face="times new roman" color="green" ></FONT>
                 <marquee scroll amount="5" size="4" color="blue" direction="right">
                     <h2>
                     <blink> WELCOME Student</blink> </h2>
                         </marquee>
             </P>
                 <h2>
                     <p align =center colour = "blue" >
                         Welcome  to polls </p></h2>
                            
                              <%
                              
                              try
        {
    
        int count=0;
       // int chk=0;
//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    String stud_id= (String)session.getAttribute("userid");
   // System.out.println(stud_id);
    ResultSet rs=s.executeQuery("select * from enrollment_list where stud_id='"+stud_id+"'");
    if(rs.next())
            {
        //System.out.println(stud_id);
    String s1;
    String s2;
    String s3;
    
    s1=rs.getString(1);
     s2=rs.getString(2);
    s3=rs.getString(3);
    session.setAttribute("inst_id",s1);
  //  int current_tym ;
   // int expire_tym ;
       ResultSet rs1=s.executeQuery("select question_id,question ,current_tym ,expire_tym from instructor_poll where inst_id='"+s1+"'");
       while(rs1.next())
            {
           //System.out.println(stud_id);
           int[] quesn_id= new int[100];
            //session.setAttribute("quesn_id",quesn_id);
            
  
        
            java.util.Date cur_tym=new java.util.Date();
   Calendar c = Calendar.getInstance(); 
c.setTime(cur_tym); 
 String quesn=rs1.getString(2); 
        java.util.Date db_expire_tym= rs1.getTimestamp(4);
       int comparison = cur_tym.compareTo(db_expire_tym);
if(comparison <=0)
{ 
//System.out.println(stud_id);            
        if(quesn == null)
            {
            //System.out.println(comparison);
            %>
            <h3>No poll question at the moment</h3>
            <%
        }
            else
                {
            quesn_id[count]=rs1.getInt(1);
            session.setAttribute("quesn_id"+count,quesn_id[count]);
            //System.out.println("Hi");
            %>
             <h3>Answer your poll question :</h3> 
             <h3><%
             
out.println(quesn);
                 String name="option"+count;
                 %>
             </h3>
             <input type="radio" name=<%=name%> value="Yes">Yes
            <input type="radio" name=<%=name%> value="No">No
                
            <%
            //System.out.println("option"+count);
            count++;
            %>
            <h3>&nbsp;</h3>
                              <input type="submit" name="submit" value="Submit Poll" class="button">
                                  <br>
            <%
            }
     }
      else
          {
          System.out.println("Hi");
            %>
            
            
            <%

      }
        }
       
       }
    session.setAttribute("querry_no",count);
    con.close();

}

catch(Exception e){e.printStackTrace();}
    

                              %>
                              
                                  <a href="poll_alert.jsp">Click to view Alerts based on your poll</a>
                  </form> 
                   <h3>&nbsp;</h3>

                 
             </article>
        </div>
      </div>
    </section>
    <!-- content -->
    <!-- footer -->
    <footer>
      <div class="wrapper">
        <div class="pad1">
          <div class="pad_left1">
            <div class="wrapper">
              <article class="col_1">
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