<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TODO LIST</title>
<link href="CSS/todo.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
	 	<div id="toptitle">
            <strong>나의 해야할 일들</strong>
        </div>
        <ul class="todoform">
            <li><a href="todoForm.jsp">새로운 TODO 등록</a></li>
        </ul>
    </header>
	 <section>
        <div class="listdiv">
            <ul class="todo">
                <li class="category">
                    <strong>TODO</strong>
                </li>
                <c:forEach var="list" items="${list}">
                	<c:if test="${list.type=='TODO'}">
                	<fmt:parseDate value='${list.regdate}' var='date' pattern="yyyy-MM-dd H:m" />
	                <li class="todolist">
	                <c:set var="id" value="${list.id}" scope="request"/>
	                <c:set var="type" value="${list.type}" scope="request"/>
	                    <strong>${list.title}</strong>
		                    <span>등록날짜: <fmt:formatDate value="${date}" pattern="yyyy.MM.dd"/>, ${list.name},우선순위 ${list.sequence}
		                    	<button class="movebtn"  type="button" value="next" >&rarr;</button>
		                    	<span class="type">${list.type}</span>
							 	<span class="id">${list.id}</span>
							 </span>
	                </li>
                	</c:if>
                </c:forEach> 
            </ul>
            <ul class="doing">
                <li class="category">
                    <strong>DOING</strong>
                </li>
                 <c:forEach var="list" items="${list}">
                	<c:if test="${list.type=='DOING'}">
                	<fmt:parseDate value='${list.regdate}' var='date' pattern="yyyy-MM-dd H:m" />
	                <li class="todolist">
	                    <strong>${list.title}</strong>
		                    <span>등록날짜: <fmt:formatDate value="${date}" pattern="yyyy.MM.dd"/>, ${list.name},우선순위 ${list.sequence}
		                    	<button class="movebtn"  type="button" value="next">&rarr;</button>
							 	<span class="id">${list.id}</span>
		                    </span>		             
	                </li>
                	</c:if>
                </c:forEach> 
            </ul>
            <ul class="done">
                <li class="category">
                    <strong>DONE</strong>
                </li>
                 <c:forEach var="list" items="${list}">
                	<c:if test="${list.type=='DONE'}">
                	<fmt:parseDate value='${list.regdate}' var='date' pattern="yyyy-MM-dd H:m" />
	                <li class="todolist">
	                    <strong>${list.title}</strong>
		                    <span>등록날짜: <fmt:formatDate value="${date}" pattern="yyyy.MM.dd"/>, ${list.name},우선순위 ${list.sequence}
		                    </span>
	                </li>
                	</c:if>
                </c:forEach> 
            </ul>

        </div>
    </section>
</body>
 <script type="text/javascript">

 function movetodo(id, type, todolist) {
     
 	var oReq = new XMLHttpRequest();
 		
 	oReq.addEventListener("load", function() {
       	console.log("doing으로 이동");
     	
      	var tododiv=document.querySelector(".todo");
        	var doingdiv=document.querySelector(".doing");
     	
      	
     	tododiv.removeChild(todolist);
     	doingdiv.insertAdjacentHTML('beforeend',todolist.outerHTML);
 	 });
       
 	  oReq.open("POST", "/Todo/type", true);
 	  oReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 	  oReq.send("id="+id+"&type="+type);
 	}
 var click = document.querySelector(".todo");
 click.addEventListener("click",function(e) {
     if (e.target.tagName === "BUTTON") {
     	var id= e.target.parentElement.querySelector(".id").innerText;
     	console.log(id);
     	var type= "TODO";
     	var todolist = e.target.parentElement.parentElement;
     movetodo(id, type, todolist);
     }
 });
 
 function movedoing (id, type, todolist) {
     
 	var oReq = new XMLHttpRequest();
		
	  oReq.addEventListener("load", function() {
    	console.log("done으로 이동");
  	var doingdiv=document.querySelector(".doing");
  	var donediv=document.querySelector(".done");
  	
  	var span = todolist.children[1];
  	var moveBtn = span.children[0];
		
   	span.removeChild(moveBtn);
  	doingdiv.removeChild(todolist);
  	donediv.insertAdjacentHTML('beforeend',todolist.outerHTML);
	  });
    
	  oReq.open("POST", "/Todo/type", true);
	  oReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  oReq.send("id="+id+"&type="+type);
	}
 
 var click = document.querySelector(".doing");
 click.addEventListener("click",function(e) {
     if (e.target.tagName === "BUTTON") {
      	var id = e.target.parentElement.querySelector(".id").innerText;
     	console.log(id);
     	var type = "DOING";
     	var todolist = e.target.parentElement.parentElement;
     	movedoing(id, type, todolist); 
     }
 });
 
	
 </script>
</html>
