<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
      
    <title>用户登录</title>  
      
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page">  
    <!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    -->  
  
  </head>  
    
  <body>  
    This is my JSP page. <br>  
     <form action="login" method="GET">  
    username:<input type="text" name="username"><br>  
    password:<input type="password" name="pwd"><br>  
    <input type="submit" value="登录" width="50px">
    </form>
    <a  href="zhuce.jsp">注册 </a>  <br>
    <a  href="add.jsp">添加搜索记录 </a>
  </body>  
</html>  