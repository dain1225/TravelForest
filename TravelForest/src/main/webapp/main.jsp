<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>    
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
   <title>Main</title>
   <style>
       body { font-family: 'Do Hyeon', sans-serif; background-color: #f7f9fc; }
       h1 { font-family: 'Do Hyeon', sans-serif; font-size: 3.5rem; font-weight: 900; letter-spacing: 2px; display: inline-block; } 
       .title-text { color: #fff9c4; text-shadow: -3px -3px 0 #388e3c,  3px -3px 0 #388e3c, -3px  3px 0 #388e3c,  3px  3px 0 #388e3c, -3px  0px 0 #388e3c,  3px  0px 0 #388e3c,  0px -3px 0 #388e3c,  0px  3px 0 #388e3c, 0px  5px 0px #1b5e20, 4px  8px 5px rgba(0,0,0,0.15) }
       .forest { background: linear-gradient(135deg, #a1ffce 0%, #faffd1 100%) !important; border: 4px solid #81c784 !important; }
       h5 { font-family: 'Do Hyeon', sans-serif; color: #2e7d32; font-size: 1.3rem; margin-bottom: 15px; }
   </style>
   <%
        // 주소창에 error 파라미터가 유입되었는지 확인
        String error = request.getParameter("error");
        if("wrongcode".equals(error)) {
    %>
        <script>
            // 사용자가 알 수 있도록 경고 팝업창 출력
            alert("❌ 틀린 코드입니다! 존재하지 않는 방 번호이거나 오타가 있습니다.");
        </script>
    <%
        }
    %>
</head>
<script type="text/javascript">
     function check() {
         var form=document.joinForm;
         
         if (form.codename.value.length != 6) { // 코드가 6자리가 아니라면
        	 alert("6자리로 입력해주세요!");
        	 form.codename.select();
        	 return;
         }
                 
          form.submit();
     }
</script>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp"%>   
      
    <div class="p-5 mb-4 forest rounded-3 shadow-sm text-center">
      <div class="container-fluid py-4">
        <h1> 모여봐요 여행의 숲 </h1>    
      </div>
    </div>
    
    <div class="row align-items-md-stretch text-center">
      <div class="row justify-content-center align-items-center">
        <div class="h-100 p-5 col-md-6">
          <h5>그룹코드를 입력하세요</h5>       
            <form class="form-signin" action="j_security_check" method="post">
              <div class="form-floating  mb-3 mx-auto" style="max-width: 300px;">
                <input type="text" class="form-control" name='codename' required autofocus>
                <label for="floatingInput">Code</label>
              </div>
              <button class="btn btn-lg btn-success text-white px-4" type="submit">확인</button>
              <button class="btn btn-lg btn-info text-white px-4" type="submit">신규 가입</button>
            </form>
        </div>
      </div>   
    </div> 
    <%@ include file="footer.jsp"%>
</div>
</body>
</html>