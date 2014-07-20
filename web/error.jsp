<%-- 
    Document   : error
    Created on : Jul 9, 2014, 4:48:22 PM
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         
    </head>
    <body><script language="Javascript">
        alert ( " Invalid Key number" );
            
    </script><%
int i=1;    
response.sendRedirect("display.jsp?i="+i);
%>
      

    </body>
</html>
