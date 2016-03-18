<%-- 
    Document   : downloadZIP
    Created on : Apr 26, 2014, 11:44:36 AM
    Author     : Durga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*,java.net.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quassi Classe`</title>
    </head>
    <%
    BufferedInputStream filein = null;
    BufferedOutputStream outputs=null;
    try
            {
        File file= new File (request.getParameter("file"));
        byte b[]=new byte[4000];
        int len=0;
        filein=new BufferedInputStream(new FileInputStream(file));
        outputs= new BufferedOutputStream(response.getOutputStream());
        response.setHeader("Content-Length",""+file.length());
        response.setContentType("application/zip");
        response.setHeader("Content-Disposition","attachment;filename=Test.zip");
        response.setHeader("Content-Transfer-Encoding", "binary");
        while((len = filein.read(b))>0)
            {
            outputs.write(b,0,len);
            outputs.flush();
        }
    }
    catch(Exception e)
            {
        out.println(e);
    }
    %>
</html>
