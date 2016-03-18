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
           
             
             <form action="stud_qiz_db.jsp" method="post" class="Form">
                     
                
               <p>
               <font face="times new roman" color="green" ></FONT>
                 <marquee scroll amount="5" size="4" color="blue" direction="right">
                     <h2>
                     <blink> WELCOME Student</blink> </h2>
                         </marquee>
             </P>
                 
                           
                              <%
                              
                              try
        {
    
       
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    String stud_id= (String)session.getAttribute("userid");
   // System.out.println(stud_id);
    ResultSet rs=s.executeQuery("select * from enrollment_list where stud_id='"+stud_id+"'");
    if(rs.next())
            {
     String s1;
    s1=rs.getString(1);
   session.setAttribute("inst_id",s1);
      ResultSet rs1=s.executeQuery("select * from quizalerts where inst_id='"+s1+"'");
       while(rs1.next())
            {
          
            java.util.Date cur_tym=new java.util.Date();
   Calendar c = Calendar.getInstance(); 
c.setTime(cur_tym); 
 String alert=rs1.getString(3);
//System.out.println(alert); 
        java.util.Date db_expire_tym= rs1.getTimestamp(5);
       int comparison = cur_tym.compareTo(db_expire_tym);
if(comparison <=0)
{ 
//System.out.println(stud_id);            
        if(alert == null)
            {
            //System.out.println(comparison);
            %>
            <h3>No Quiz Alert Available</h3>
            <%
        }
            else
                {
            
            %>
             <h3>Alert message :</h3> 
             <h3><%
             
out.println(alert);
                %>
               </h3>
               <%
            
            }
     }
      //else
         // {
         // System.out.println("Hi");
            %>
            <!-- <h3>No test</h3> --> 
            
            <%

     // }
        }
       
       }
   
    con.close();

} catch(Exception e){e.printStackTrace();}
    

                              %>
                             
                  </form> 
                   <h3>&nbsp;</h3>
<li class="form-line" id="id_2">
        <div id="cid_2" class="form-input-wide">
          <div style="margin-left:156px" class="form-buttons-wrapper">
            <h3><a href="stud_testconduct.jsp">Start the Test</a></h3>
              
            
          </div>
        </div>
      </li>     
               
           
                 
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