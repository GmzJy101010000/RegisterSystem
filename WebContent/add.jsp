<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">



	var aa="<%=session.getAttribute("success")%>"; 


</script>
</head>
<body>  
    Add search record: <br>  
     <form action="add" method="POST">  
    record type:<input type="text" name="type"><br>  <br>
    record detail:<input type="text" name="detail"><br>  
    <input type="submit" value="添加" width="50px">
    </form>
  </body>  
</html>