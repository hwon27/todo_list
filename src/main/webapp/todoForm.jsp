<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TODO LIST</title>
<link href="CSS/todoForm.css" rel="stylesheet" type="text/css">
</head>
<body>
  <header>
      <strong>할일 등록</strong>
  </header>
  <section>
    <form  action="/Todo/add" method="post" name="todoform"  onsubmit="return check();">
    	<div>
        	<label for="title">어떤일인가요?</label><br>
        	<input type="text" id="title" name="title"  placeholder="swift 공부하기(24자까지)" maxlength="24"/>
    	</div>
    	<div>
        	<label for="name">누가 할일인가요?</label><br>
        	<input type="text" id="name" name="name"/>
    	</div>
    	<div>
        	<label for="sequence">우선순위를 선택하세요</label><br>
        	<div class="radiodiv">
        		<label for="first"><input type="radio" name="sequence" id="first" value=1>1순위</label>
        		<label for="second"><input type="radio" name="sequence" id="second" value=2>2순위</label>
        		<label for="third"><input type="radio" name="sequence" id="third" value=3>3순위</label>
        	</div>
	    </div>
     	<div class="button">
        	<button id="back"><a href= "main" > 이전</a></button>
        	<div class="rbutton">
	        	<button type="submit" id = "submit"   >제출</button>
	        	<button type="reset" id="reset">내용지우기</button>
        	</div>
    	</div>
	</form>
  </section>
</body>
<script type="text/javascript">
	function check() {
		var title = document.getElementsByName("title");
		var name = document.getElementsByName("name");
		var seq = document.getElementsByName("sequence");
		
		if(todoform.title.value == ""  ) {
			alert("제목을 입력하세요 ");
			
			return false;
		}
		
		if(todoform.name.value =="") {
			alert("이름을 입력하세요 ");
			
			return false;
		}
		
		if(seq[0].checked == false && seq[1].checked == false && seq[2].checked == false ) {
			alert("우선순위를 선택하세요 ");
			return false;
		}

	}
		
</script>
</html>