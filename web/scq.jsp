<!DOCTYPE html>
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
            
                <div class="wrapper">
                    <div class="pad1 pad_top1">
                    </div>
                </div>
                
                <div class="pad_left1">
                    <h2>Single Choice Questions </h2>
                   <%
                   session.setAttribute("qtype",1);
                   %>
                    <h3>Your Question here:</h3>    
                    <form action="addQ_db.jsp" method="post">
                        <textarea name="qtext" cols="50" rows="5" style="border:6px groove #F7730E;">
                        </textarea>
                        <br />
                        <h3>Credit: <input type="text" name="credit" style="border-style:solid;"></h3>
                   
                <h3><a>Options:</a></h3>
                    
                        
                            <h3><input type="radio" name="option1" value="A" id="option1_0">A. 
                             
                            <input type="text" name="textieA" style="border-style:solid;"></h3>
                            
                           
                            <h3><input type="radio" name="option1" value="B" id="option1_1">B. 
                            <input type="text" name="textieB" style="border-style:solid;"></h3>
                            
                            <h3><input type="radio" name="option1" value="C" id="option1_2">C. 
                            <input type="text" name="textieC" style="border-style:solid;"></h3>
                            
                                <h3><input type="radio" name="option1" value="D" id="option1_3">D. 
                            <input type="text" name="textieD" style="border-style:solid;"></h3>
                           
                            <h3><input type="radio" name="option1" value="E" id="option1_4">E. 
                            <input type="text" name="textieE" style="border-style:solid;"></h3>


    <input name="button" value="Submit" type="submit" class="button"></input>
   
    </form>
                </div>

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

    <script type="text/javascript">Cufon.now();</script>
</html>