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
           
             
             <form action="inst_db.jsp" method="post" class="Form">
                     
                
               <p>
               <font face="times new roman" color="green" ></FONT>
                 <marquee scroll amount="5" size="4" color="blue" direction="right">
                     <h2> WELCOME INSTRUCTOR </marquee></h2>
             </P>
                 <h2>
                     <p align =center colour = "blue" >
                         Welcome  to polls </p></h2>
                              
                 
                 <h3>Enter Your Poll Question  :</h3> 
                 <li class="form-line" id="id_6">
        
        <div id="cid_6" class="form-input">
    
              <div class="form-textarea-limit">
              <span>
             <textarea id="input_6" class="form-textarea" name="quesn" style="border-style:solid; border-width:1px; border-color: black;" cols="40" rows="6"></textarea>
              <div class="form-textarea-limit-indicator">
                  <span type="Words" limit="400" id="input_6-limit">0/400</span>
              </div></span>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_2">
        <div id="cid_2" class="form-input-wide">
          <div style="margin-left:156px" class="form-buttons-wrapper">
            <input id="input_2" type="submit" class="button" value ="conduct poll" onclick="inst_db.jsp">
              
            
          </div>
        </div>
      </li>
            <li class="form-line" id="id_2">
        <div id="cid_2" class="form-input-wide">
          <div style="margin-left:156px" class="form-buttons-wrapper">
            <h3><a href="poll_result.jsp">Click to view Poll Results</a></h3>
              
            
          </div>
        </div>
      </li>     
               
             
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