<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@page import="com.ht.servlet.AccountBean"%>   
   
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
    <style type="text/css">
    #mydiv{
    position:absolute;
    left:30%;
    top:50%;
 
    }
    .mouseOver{
    background:#708080;
    color:#FFFAFA;
    }
    .mouseOut{
    background:#FFFAFA;
    color:#000000;
    }
    #keyword{width:500px; height:33px;}
    #search{width:80px; height:33px;}
    </style>  
    <title>searching page</title>  
      
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page">  
    <!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    -->  
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
  <script tpye="text/javascript">
  
  
   var xmlHttp;
    function getContent(){
    	clearcontent();
    	var content = document.getElementById("keyword").value;
    	if(content ==""){
    		return;
    	}
    	
    	//xmlHttp=createXmlHttp();
    	var url ="search?keyword="+escape(content);
    	$.ajax({
			  url: "search?keyword="+escape(content),
			  type:"POST",
			  success: function( result ) {
				  var json =eval("("+result+")");
	    			 //alert(json); 	
	    			setContent(json);
	    			
			  },
			  error:function( result ) {
			   alert("error");
			  }
			});
    	//xmlHttp.open("GET",url,true);
      //  xmlHttp.onreadystatechange=callback;
    	//xmlHttp.send(null);
    	//alert(xmlHttp);
    	//alert(xmlHttp.readyState+":"+xmlHttp.status);
    	
    }
    function callback(){
    	if(xmlHttp.readyState==4){
    		if(xmlHttp.status==200){
    			var result=xmlHttp.responseText;
    			var json =eval("("+result+")");
    			 //alert(json); 	
    			setContent(json);
    			 
    		}
    	}
    	
    }
    function getColumnDetail(column){ 
    	column.style.color = "blue"; //将被点击的单元格设置为蓝色 
    	alert(column.innerHTML); //弹出被点单元格里的内容 
    	} 
    function setContent(content){
    	
    	var size=content.length;
    	setLocation();
    
    	for(var i=0;i<size;i++){
    		var nextNode=content[i];
    		var tr=document.createElement("tr");
    		var td=document.createElement("td");
    		td.setAttribute("border","0");
    		td.setAttribute("bgcolor","#FFFAFA");
    		
         	td.onmouseover=function(){
    			
    			this.className='mouseOver';
    			
    		};
            td.onmouseout=function(){
    			
    			this.className='mouseOut';
    			
    		}; 
    		
            td.onmousedown=function(){

        	      document.getElementById("keyword").value = this.innerHTML;
        	      var a=this.innerHTML;
        	 
        	      staetSearch(a);
        	}; 
    		var text =document.createTextNode(nextNode);
    		
    		td.appendChild(text);
    		tr.appendChild(td);
    		document.getElementById("content_table_body").appendChild(tr);
    		
    	}
    	
    	
    }
    
    function search_btn(){
    	 
	      var a=document.getElementById("keyword").value;
	      staetSearch(a);
	  
    }
   function staetSearch(content){
	   window.location.href="/RegisterSystem/result?a="+content;
   }

    function createXmlHttp(){
    	var xmlHttp;
    	if(window.XMLHttpRequest){
    		xmlHttp=new XMLHttpRequest();	
    	}
    	if(window.ActiveXObejct){
    		xmlHttp=new ActiveXObejct("Microsoft.XMLHTTP");
    		if(!xmlHttp){
    			xmlHttp=new ActiveXObejct("Msxml2.XMLHTTP");
    		}
    	}
    	return xmlHttp;
    }
   function clearcontent(){
	   var contentTbody=document.getElementById("content_table_body");
	   var size=contentTbody.childNodes.length;
	   for(var i=size-1;i>=0;i--){
		   contentTbody.removeChild(contentTbody.childNodes[i]);
	   }
	  
   }
   
   function keywordblur(){
	   
	   clearcontent();
   }
 
   function setLocation(){
	   var content=document.getElementById("keyword");
	   var width=content.offsetWidth;
	   var left =content["offsetLeft"];
	   var top =content["offsetTop"]+content.offsetHeight;
	   
	   var showdiv=document.getElementById("showdiv");
	   showdiv.style.border="balck 1px solid";
	   showdiv.style.left=left+"px";
	   showdiv.style.top=top+"px";
	   showdiv.style.width=width+"px";
	   document.getElementById("content_table").style.width=width+"px";
	   
   }
   document.onkeydown=function(event){
       var e = event || window.event || arguments.callee.caller.arguments[0];
       if(e && e.keyCode==27){ // 按 Esc 
          
         }
       if(e && e.keyCode==113){ // 按 F2 
           
          }            
        if(e && e.keyCode==13){ // enter 键
        	  var a=document.getElementById("keyword").value;
        	if(a!=null&&a!=''&&a!=undefined ){
    	      staetSearch(a);}
       }
   }; 
   
   function search_btnn(){
	   var aa= $("#keyword").val();
	   var bb=$("#keyword");
	   var cc =document.getElementById("keyword");
	   alert(cc);
   }
  </script>
  </head>  
    
  <body>  
      <div id="ssb">Welcome:</div>
    <%-- <%  
  
    
    	 AccountBean account = (AccountBean)session.getAttribute("account"); %>
    <%= account.getUsername()
    
    %>   --%>
  88 ${account.username}
      
     <br>  <br> 
      <div id="mydiv">
      <input type="text"  size="50" id="keyword" onkeyup="getContent()" onblur="keywordblur()" onfocus="getContent()"> 
       <input type="button" value="Search" width="50px" id="search" onClick="search_btn()">
       <div id="showdiv">
       <table id="content_table" bgcolor="#FFFAFA"  border="0"  cellspacing="0" cellpadding="0">
       <tbody id="content_table_body">
      
       </tbody>
       </table>
       
       </div>
       
      </div>
  </body> 

</html>  