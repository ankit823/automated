   <%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.* " %>


<%@page import="java.io.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         String username=session.getAttribute("un").toString();
  //       String name1=session.getAttribute("file").toString();
        
        //String name1 = request.getParameter("fileName");
         String path="D:\\capt\\"+username+"\\key.png";
         out.println(path);
	File f = new File (path);
	//set the content type(can be excel/word/powerpoint etc..)
	response.setContentType ("application/pdf");
	//set the header and also the Name by which user will be prompted to save
	response.setHeader ("Content-Disposition", "attachment; filename=" +"key.png");
	
	//get the file name
	String name = f.getName().substring(f.getName().lastIndexOf("/") + 1,f.getName().length());
	
                String key = "squirrel123";
                System.out.print("ank1");
		InputStream in = new FileInputStream(f);
		ServletOutputStream outs = response.getOutputStream();
		
                //decrypt(key, in, outs);	
//		System.out.println( "\n" + i + " bytes sent.");
//		System.out.println( "\n" + f.length() + " bytes sent.");
		decrypt(key, in, outs);	
		
		
//		System.out.println( "\n" + i + " bytes sent.");
//		System.out.println( "\n" + f.length() + " bytes sent.");
		outs.flush();
		outs.close();
		in.close();	



   
    
    %>
    
%>
<%!

	public void decrypt(String key, InputStream is, OutputStream os) throws Throwable {
		encryptOrDecrypt(key,  is, os);
        }%><%!

	public static void encryptOrDecrypt(String key,  InputStream is, OutputStream os) throws Throwable {

		{
			//cipher.init(Cipher.DECRYPT_MODE, desKey);
			//CipherOutputStream cos = new CipherOutputStream(os, cipher);
                   // OutputStream cos=new OutputStream();
			//doCopy(is, cos);
		
	}}
%><%!
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


    <jsp:forward page="index.jsp"></jsp:forward>




</body>
</html>