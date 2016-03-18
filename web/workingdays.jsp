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
           
             
             <form action="working_db.jsp" method="post" class="Form">
                     
                
               <p>
               <font face="times new roman" color="green" >
                   
               </FONT>
                 <marquee scroll amount="5" size="4" color="blue" direction="right">
                     <h2> WELCOME INSTRUCTOR</h2> </marquee>
             </P>
                
                              
             <h3>Enter Your attendance Details :</h3> 
                <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<table align="center">
<h3>WORKING DAYS</h3>
YEAR:<select name="year" id="year" style="border-style:solid; border-width:1px; border-color: black;">
<option value="2014">2014</option>
<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
<option value="2021">2021</option>
<option value="2022">2022</option>
<option value="2023">2023</option>
<option value="2024">2024</option>
<option value="2025">2025</option>
<option value="2026">2026</option>
<option value = "2027">2027</option>
</select>
<br><br>
JAN<input type="text" name="jan" id="jan" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
FEB<input type="text" name="feb" id="feb" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
MAR<input type="text" name="mar" id="mar" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
APR<input type="text" name="apr" id="apr" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
MAY<input type="text" name="may" id="may" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
JUN<input type="text" name="jun" id="jun" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
JUL<input type="text" name="jul" id="jul"style="border-style:solid; border-width:1px; border-color: black;"><br><br>
AUG<input type="text" name="aug" id="aug" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
SEP<input type="text" name="sep" id="sep" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
OCT<input type="text" name="oct" id="oct" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
NOV<input type="text" name="nov" id="nov" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
DEC<input type="text" name="dec" id="dec" style="border-style:solid; border-width:1px; border-color: black;"><br><br>
<input type="submit" value="Insert" class="button">&nbsp&nbsp&nbsp

</table>


              
            
          
   
             
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