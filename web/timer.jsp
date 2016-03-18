<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>

<%
try
        {
    

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    
     con.close();

} catch(Exception e){e.printStackTrace();}
%>
<script type="text/javascript">
var min=1;
var sec=min*60;
min=min-1;
var ctr=0;
var dom=document.getElementById("kulu");
function ram(){
var dom=document.getElementById("kulu");
dom.value=(min)+"minutes "+(sec%60)+"seconds";
sec=sec-1;
ctr++;
if(ctr==60)
    {
        ctr=0;
        min=min-1;
    }

if(sec==0){
    document.form.kulu.value = "Time over";
ram1();
}
setTimeout("ram()", 1000);
              }
function ram1(){

window.location.replace("student_index.jsp");

                }
</script>

<body onload="ram()">
    
<form name="form" >
<input type="text" id="kulu"/>
</form>

</body>
