<%-- 
    
--%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.Crypting"%>
<%@page import="javax.crypto.CipherOutputStream"%>
<%@page import="javax.crypto.CipherInputStream"%>
<%@page import="javax.crypto.SecretKeyFactory"%>
<%@page import="javax.crypto.spec.DESKeySpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.io.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.crypto.SecretKey"%>

<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.Session.*"%>
<%@ page import="java.util.*"%>



<%@page import= "java.util.Random" %>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="images/bg10.jpeg">
         <%! static int cnt = 1;
            String key1 = "";
            String filename;
            String user;
            int max_id = 1;
            String sql;
           String all = "";
     BufferedImage imgClean = null,imgOverlay=null;
	
    %>
        
    <% String pth=(String)session.getAttribute("pth");
        try {
                        
			String key = "squirrel123"; // needs to be at least 8 characters for DES
                  //      String original=request.getParameter("Send File");
                        session = request.getSession(false);
                         user = session.getAttribute("username").toString();
                         filename = session.getAttribute("fname").toString();
                  //        key1 = session.getAttribute("key").toString();
                        System.out.println("User:::: "+user+" filename:::: "+filename+" key:::: "+key );
                        
                        File f2=new File(pth+"\\"+filename);
                        System.out.println(f2.getAbsolutePath()+" fileabc ");
                        /*if(!f2.exists()){
                            f2.mkdir();
                        }*/
                        File f1=new File(f2.getAbsolutePath());//+"\\"+filename);
                        
                        //File f2=new File("c:\\uploads\\"+user+"\\encrypt\\");
                        //f2.mkdir();
                        
                         all = "FileName:: " +f1.getName() +" "+ new MimetypesFileTypeMap().getContentType(f1) + "  Length:: ("+f1.length() + ")bytes";
                        
			File fis = new File(f1.getAbsolutePath());//"E:\\match\\"+user+"\\"+filename);
			//FileOutputStream fos = new FileOutputStream("c:\\uploads\\"+user+"\\encrypt\\"+filename);
                       FileInputStream fis12 = new FileInputStream(f1.getAbsolutePath());//"E:\\match\\"+user+"\\"+filename);
			//encrypt(key, fis, fos);
                       File fEncrFile=new File("E:\\capt\\"+user+"\\en.png");
                       BufferedImage imgKey = Crypting.loadAndCheckEncrFile(fis);                                    
                       BufferedImage imgEnc = Crypting.loadAndCheckEncrFile(fEncrFile);
                       imgOverlay = Crypting.overlayImages(imgKey, imgEnc);                      
                       imgClean = Crypting.decryptImage(imgOverlay);
                       File f = new File(pth+"//res");//"E:\\match\\"+user+"\\res");
		    	if (!f.toString().endsWith(".png")) {
		    		f = new File(f.toString() + ".png");
		    	}
		    	try {
					ImageIO.write(imgClean, "png", f);
				} catch (IOException e1) {
					//JOptionPane.showMessageDialog(this, "Could not Save file because: " + e1.getLocalizedMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
				}
                       session.setAttribute("res",f.getAbsolutePath());
                       imgEnc.flush();
                       fis12.close();
                       System.out.println(f1.getAbsolutePath()+" jk");
                       imgClean.flush();
                       response.sendRedirect("display.jsp");

                      /* if(f1.delete()&&imgClean==null)
                                                 {
                       response.sendRedirect("index.jsp");                       
                       }
     else{
        }*/
		} catch (Throwable e) {
			e.printStackTrace();
		}
        %>
       <%!
	public static void doCopy(InputStream is, OutputStream os) throws IOException {
		byte[] bytes = new byte[64];
		int numBytes;
		while ((numBytes = is.read(bytes)) != -1) {
			os.write(bytes, 0, numBytes);
		}
		os.flush();
		os.close();
		is.close();
	}
        %>
       
         <%

            try {
                ResultSet rs;
                //      int max_id =1 ;
           /*     Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mobile", "root", "root");
                Statement stmt = con.createStatement();

                String queryForMaxId = "SELECT MAX(id) AS max_id FROM file;";
                rs = stmt.executeQuery(queryForMaxId);
                rs.next();
                max_id = rs.getInt("max_id");
                max_id++;
           //     key1 = (int) (Math.random() * 1000);
                sql = "insert into file values('" + max_id + "','" + filename + "','" + key1 + "','" + user + "')";

               
                
                stmt.executeUpdate(sql);
*/
            } catch (Exception e) {
            }


        
           /* ResultSet rs1;
             Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/mobile", "root", "root");
                Statement stmt1 = conn.createStatement();
            
            
            
                System.out.println("before select query user:: "+user);
             String mailQuery = "SELECT * FROM admin where uname = '" + user + "'";
            rs1 = stmt1.executeQuery(mailQuery);
            rs1.next();

            String result = null;
            /////              SERVER EMAIL ID
            final String username = "saiinfocorp@gmail.com";
            final String password = "saiinfo123";
            final String reciver = rs1.getString("email");
            final String subject = "Upload Notification";
            Properties props = new Properties();


            props.setProperty("mail.host", "smtp.gmail.com");





            props.setProperty("mail.user", username);
            props.setProperty("mail.password", password);
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.transport.protocol", "smtp");

            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.debug", "true");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "true");
            props.put("mail.smtp.ssl.enable", "true");
            props.put("mail.smtp.debug", "true");
            Session session1 = Session.getInstance(props,
                    new javax.mail.Authenticator() {

                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });


            try {
                
         //       all = "FILE NAME : " + filename + "\nKEY : " + key1;
                //        all="hellloo";        

                Message message = new MimeMessage(session1);
                message.setFrom(new InternetAddress("saiinfocorp@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(reciver));
                message.setSubject(subject);
                message.setText(all);
                //		message.setSentDate(new Date());
                Transport.send(message);
                result = "Mail Send Succesfully";
                System.out.println("Mail Send Succesfully");

            } catch (MessagingException e) {
                result = "Error in sending email,Pls try again later";
                System.out.println("Error in sending email,Pls try again later" + e);
               // throw new RuntimeException(e);
            }
            
            
        */
        
        %>       
        
               
        
        <h1>
        File Uploaded Successfully </h1><br>
<!--       <h1>Remember key for downloading this file:<%= key1 %></h1>-->
        <font size="4" style="font-family:monospace">
        <a href="RightUser.jsp"> HOME </a></font>
    </body>
</html>
