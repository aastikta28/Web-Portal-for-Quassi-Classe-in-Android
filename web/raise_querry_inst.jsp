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
<title>Quassi Classe'</title>
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
           
             
             <form action="inst_querry_db.jsp" method="post" class="Form">
                     
                
               <p>
               <font face="times new roman" color="green" ></FONT>
                 <marquee scroll amount="5" size="4" color="blue" direction="right">
                     <h2>
                         <blink> WELCOME INSTRUCTOR </blink>
                         </h2>
                         </marquee>
             </P>
                 <h2>
                     <p align =center colour = "blue" >
                         Welcome  to query solver!! </p></h2>
                         <%
                              try
        {
    

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    String inst_id= (String)session.getAttribute("userid");
    //System.out.println(inst_id);
    int last_querry_no=0;
    ResultSet rs=s.executeQuery("select * from enrollment_list where inst_id='"+inst_id+"'");
    if(rs.next())
            {
       // System.out.println("Hi");
       String stud_id;
        stud_id=rs.getString(2);
        ResultSet rscount=s.executeQuery("select count(*) from querry_list where stud_id='"+stud_id+"'");
        while(rscount.next())
            {
            last_querry_no=rscount.getInt(1);
        }
        //System.out.println(last_querry_no);
       ResultSet rs1=s.executeQuery("select * from querry_list where stud_id='"+stud_id+"'");
       while(rs1.next())
            {
           //System.out.println("Hi");
           int querry_no=rs1.getInt(2);
           String stud_id_move=rs1.getString(1);
           //System.out.println(querry_no);
            session.setAttribute("stud_id",stud_id_move);
            session.setAttribute("querry_no",new Integer(querry_no));
                   String ans=rs1.getString(4);
        String quesn=rs1.getString(3); 
        //int last_querry_no=rs1.getRow();
         
        //System.out.println(last_querry_no);
        
            if(querry_no <= last_querry_no)
                {
                    if(ans.equals("Done"))
                  
                    {
                     querry_no++;
                     }
                    
                    else
                        {
                        %>
                       <h3>Answer the following querries :</h3> 
             <h3><%
             
out.println(quesn);
                 
                 %>
             </h3>
             <h3>Enter Your Answer  :</h3> 
                 <li class="form-line" id="id_6">
        
        <div id="cid_6" class="form-input">
    
              <div class="form-textarea-limit">
              <span>
             <textarea id="input_6" class="form-textarea" name="quesn_ans${querry_no}" style="border-style:solid; border-width:1px; border-color: black;" cols="40" rows="6"></textarea>
              <div class="form-textarea-limit-indicator">
                  <span type="Words" limit="400" id="input_6-limit">0/400</span>
              </div></span>
          </div>
        </div>
      </li>
                              
            <%
            querry_no++;
                    }
            }
      }              
     
        }
    %>
    <input type="submit" name="submit" value="Submit Answer(s)" class="button">
    <%
    con.close();

} catch(Exception e){e.printStackTrace();}

                              %>      
                 
     
                
               
             
                             
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