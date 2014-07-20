<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
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
                }  if (document.registration.key.value.length < 3 )
               	{
                    alert ( "Please Enter  valid Key number" );
                    document.registration.key.focus(); 
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
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="validate.jsp" autocomplete="on"> 
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Your  username </label>
                                    <input id="username" name="username" required="required" type="text"maxlength="14" />
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <input id="password" name="password" required="required" type="password"maxlength="12"  /> 
                                </p>
                                
                                <p class="login button"> 
                                    <input type="submit" value="Proceed"  /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                            </form>
                     
                        </div>

                        <div id="register" class="animate form">
                            <form name="registration" action="register_insert_db.jsp" autocomplete="on" onSubmit="return validation();"> 
                                <h1> Sign up </h1> 
                                 <p> 
                                    <label for="uname"  >Your Name </label>
                                    <input id="uname" name="uname"   />
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" />
                                </p>
                                
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" />
                                </p>
                                <p> 
                                    <label for="contact"  >Your Contact No </label>
                                    <input id="contact" placeholder="10 digits" onKeyPress="return numbersonly(event);" size=30 maxlength="11" name="contact" required="required"  />
                                </p>                                
                                <p> 
                                    <label for="email"  >Your E-Mail ID </label>
                                    <input id="email" name="email"  required="required" />
                                </p> <p> 
                                    <label for="uname"  >Captcha </label>
                                   
                                </p>    
                                <%
 //String key="123";request.getParameter("key");
//System.out.println(key);
/*  String imageFormat = "jpg";
  //response.setContentType("image/" + imageFormat);

 try {
   // you can pass in fontSize, width, height via the request
   
   Color backgroundColor = Color.red;
   Color borderColor = Color.black;
   Color textColor = Color.white;
   Color circleColor = new Color(160,160,160);
   Font textFont = new Font("Arial", Font.PLAIN, paramInt(request, "fontSize", 24));
   int charsToPrint = 6;
   int width = paramInt(request, "width", 150);
   int height = paramInt(request, "height", 80);
   int circlesToDraw = 6;
   float horizMargin = 20.0f;
   float imageQuality = 0.95f; // max is 1.0 (this is for jpeg)
   double rotationRange = 0.7; // this is radians
   BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

   Graphics2D g = (Graphics2D) bufferedImage.getGraphics();

   g.setColor(backgroundColor);
   g.fillRect(0, 0, width, height);

   // lets make some noisey circles
   g.setColor(circleColor);
   for ( int i = 0; i < circlesToDraw; i++ ) {
     int circleRadius = (int) (Math.random() * height / 2.0);
     int circleX = (int) (Math.random() * width - circleRadius);
     int circleY = (int) (Math.random() * height - circleRadius);
     g.drawOval(circleX, circleY, circleRadius * 2, circleRadius * 2);
   }

   g.setColor(textColor);
   g.setFont(textFont);

   FontMetrics fontMetrics = g.getFontMetrics();
   int maxAdvance = fontMetrics.getMaxAdvance();
   int fontHeight = fontMetrics.getHeight();

   // i removed 1 and l and i because there are confusing to users...
   // Z, z, and N also get confusing when rotated
   // 0, O, and o are also confusing...
   // lowercase G looks a lot like a 9 so i killed it
   // this should ideally be done for every language...
   // i like controlling the characters though because it helps prevent confusion
   String elegibleChars = "ABCDEFGHJKLMPQRSTUVWXYabcdefhjkmnpqrstuvwxy23456789";
   char[] chars = elegibleChars.toCharArray();
System.out.println("chars");
   float spaceForLetters = -horizMargin * 2 + width;
   float spacePerChar = spaceForLetters / (charsToPrint - 1.0f);

   AffineTransform transform = g.getTransform();

   StringBuffer finalString = new StringBuffer();
 char characterToShow;
 //char[] k=key.toCharArray();

   for ( int i = 0; i < charsToPrint; i++ ) {
             double randomValue = Math.random();
     int randomIndex = (int) Math.round(randomValue * (chars.length - 1));
    
   //    if(i<3){
     //           characterToShow=k[i];
       //         finalString.append(characterToShow);
         //      }else{
       characterToShow = chars[randomIndex];
     finalString.append(characterToShow);
           //    }
     System.out.println("char "+characterToShow+ "fi "+finalString);
     
     // this is a separate canvas used for the character so that
     // we can rotate it independently
     int charImageWidth = maxAdvance * 2;
     int charImageHeight = fontHeight * 2;
     int charWidth = fontMetrics.charWidth(characterToShow);
     int charDim = Math.max(maxAdvance, fontHeight);
     int halfCharDim = (int) (charDim / 2);

     BufferedImage charImage = new BufferedImage(charDim, charDim, BufferedImage.TYPE_INT_ARGB);
     Graphics2D charGraphics = charImage.createGraphics();
     charGraphics.translate(halfCharDim, halfCharDim);
     double angle = (Math.random() - 0.5) * rotationRange;
     charGraphics.transform(AffineTransform.getRotateInstance(angle));
     charGraphics.translate(-halfCharDim,-halfCharDim);
     charGraphics.setColor(textColor);
     charGraphics.setFont(textFont);

     int charX = (int) (0.5 * charDim - 0.5 * charWidth);
     charGraphics.drawString("" + characterToShow, charX, 
                            (int) ((charDim - fontMetrics.getAscent()) 
                                   / 2 + fontMetrics.getAscent()));

     float x = horizMargin + spacePerChar * (i) - charDim / 2.0f;
     int y = (int) ((height - charDim) / 2);
//System.out.println("x=" + x + " height=" + height + " charDim=" + charDim + " y=" + y + " advance=" + maxAdvance + " fontHeight=" + fontHeight + " ascent=" + fontMetrics.getAscent());
g.drawImage(charImage, (int) x, y, charDim, charDim, null, null);

     
     charGraphics.dispose();
     
   }
 
   g.setColor(borderColor);
  g.drawRect(0, 0, width - 1, height - 1);
session.setAttribute("cap",finalString);
   //Write the image as a jpg
   Iterator iter = ImageIO.getImageWritersByFormatName(imageFormat);
   if( iter.hasNext() ) {
     ImageWriter writer = (ImageWriter)iter.next();
     ImageWriteParam iwp = writer.getDefaultWriteParam();
     if ( imageFormat.equalsIgnoreCase("jpg") || imageFormat.equalsIgnoreCase("jpeg") ) {
       iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
       iwp.setCompressionQuality(imageQuality);
           }
   //  writer.setOutput(ImageIO.createImageOutputStream(response.getOutputStream()));
      
     System.out.print(application.getRealPath("images")+"/input.png");
     session.setAttribute("path",application.getRealPath("images")+"/input.png");
       File outputfile = new File(application.getRealPath("images")+"/input.png");//"D:/input.png");
       FileOutputStream fout = new FileOutputStream(outputfile);
ImageIO.write(bufferedImage, "jpg", fout);
fout.close();
     IIOImage imageIO = new IIOImage(bufferedImage, null, null);
   System.out.println("ank");
     
     //writer.write(null, imageIO, iwp);

    
     

        

                               } else {
     throw new RuntimeException("no encoder found for jsp");
   }

   // let's stick the final string in the session
   request.getSession().setAttribute("captcha", finalString.toString());

   g.dispose();
      // response.sendRedirect("img.jsp");
 } catch (IOException ioe) {
   throw new RuntimeException("Unable to build image" , ioe);
 }
*/
%>
<%!
  /*public static String paramString(HttpServletRequest request, String paramName, String defaultString) {
    return request.getParameter(paramName) != null ? request.getParameter(paramName) : defaultString;
  }

  public static int paramInt(HttpServletRequest request, String paramName, int defaultInt) {
    return request.getParameter(paramName) != null ? Integer.parseInt(request.getParameter(paramName)) : defaultInt;
  }
*/
%>
<%-- <img src="images/input.png"> </img>--%> 
                                 
                                <p> 
                                    <label for="key"  >Key </label>
                                    <input id="key" name="key" placeholder="3 digits" required="required" maxlength="3" />
                                </p>
                                
                                <p class="signin button"> 
									<input type="submit" value="Sign up" /> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>