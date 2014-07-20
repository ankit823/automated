<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="java.awt.geom.*"%>


<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Login and Registration Form with HTML5 and CSS3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
   
                <script language = "Javascript">
                    
               function validation(){
                     var regex = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[_A-Za-z0-9-]+)";
                    
     //               document.registration.text1
                      var mail = document.getElementById('email').value;
                    
                      if (document.registration.contact.value.length < 10 )
               	{
                    alert ( "Please Enter  valid mobile number" );
                    document.registration.contact.focus(); 
                    return false;
                }
                   
                   if (document.registration.email.value.search(regex) == -1) {
                         alert("Please enter a valid email address.");
                         document.registration.email.focus(); 
                         return false;
                }
               
         }
             // validation for number only enter
    function numbersonly(evt){
//    var unicode=event.charCode? event.charCode : event.keyCode
//    if (unicode!=8){ //if the key isn't the backspace key (which we should allow)
//    if (unicode<48||unicode>57) //if not a number
//    return false //disable key press
            
//            var chCode = ('charCode' in event) ? event.charCode : event.keyCode;
//
//                // returns false if a numeric character has been entered
//            return (chCode < 48 /* '0' */ || chCode > 57 /* '9' */);
  
             var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;

  }
  function a()
  {
        alert ( "Registered Successfully" );
                   
  }
        
                </script>
    
    
    
    </head>
    <body bgcolor="#00D5D5">
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
              			
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="SimpleUplo.jsp" autocomplete="on" enctype="multipart/form-data" method="post">
                                
 
                                <h1>Select a Key to Login :</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="" > </label>
                                    <input id="username" name="uploadfile" required="required" type="file" />
                                     <input type="hidden" name="todo" value="upload">
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </p><!--<h3>Key</h3>
                                 <p> 
                                    <label for="username" class="uname" data-icon="" > </label>
                                    <input id="username" name="fil" required="required" type="TEXT" />
                                     
                                </p>-->
                                <p class="login button"> 
                                    <input type="submit" value="Upload" onclick="function a()"  /> 
								</p>
                            </form>
                            <h3><a href="index.jsp">Login...</a></h3>
                        </div>
                       

                       
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>