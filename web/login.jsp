<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
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
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="dept.jsp">Departments</a></li>
                            <li><a href="faculty.jsp">Faculty</a></li>
                            <li><a href="contacts.jsp">Contacts</a></li>
                            <li><a href="registration.jsp">Registration</a></li>
                            <li class="end"><a href="login.jsp">Login</a></li>
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
               
                    <article class="col1">
                        <div class="pad_left1">
                            
                            <form method="post" action="login_verify.jsp"  name="login" id="Form" onsubmit="return validate()" >
                                <div>
                                    <div class="wrapper"></div>
                                    <div  class="wrapper"> <strong>LoginID:</strong>
                                        <div class="bg">
                                            <input class="input" name="userid" type="text" id="userid" >
                                        </div>
                                    </div>
                                    <div  class="wrapper"> <strong>Password:</strong>
                                        <div class="bg">
                                            <input class="input" name="password" type="password" id="password">
                                        </div>
                                    </div>
                                    
                                 <input type="submit" value="Submit"  class="button"> 
                                
                    
                        
                            <%
            /*if username or password is invalid then the user is redirected back from the page login.jsp to this page with the message "Invalid UserId/Password" stored in the variable 'msg'*/
            /*The error message is printed here and user has to enter the data again*/
            String str = request.getParameter("msg");
            if (str != null) {
                            
                           
                                out.println(str);
                            
                           
            }
                            %>
                      </div>
                        </form>
                         </div>
                    </article>
                    
                
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
                                <article class="col_2 pad_left2">
                                    <h3>Join In:</h3>
                                    <ul class="list2">
                                        <li><a href="registration.jsp">Sign Up</a></li>
                                        
                                    </ul>
                                </article>
                                <article class="col_3 pad_left2">
                                    <h3>Why Us:</h3>
                                    <ul class="list2">
                                        <li><a href="index.jsp">About Us </a></li>
                                    </ul>
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