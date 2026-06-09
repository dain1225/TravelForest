<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>의견 불일치</title>
<style>
     body { 
         font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif; font-size: 3rem; background-color: #1a1a1a; margin: 0; display: flex; justify-content: center; align-items: center; height: 100vh; }
     .despair-title {
         font-family: 'Arial Rounded MT Bold', 'Malgun Gothic', '맑은 고딕', sans-serif !important; font-weight: 900 !important; color: #ff5252 !important; line-height: 1.5; letter-spacing: -1px; margin-bottom: 2rem !important; }
     .despair-sub { color: #b0bec5 !important; font-weight: bold; display: block; margin-top: 15px; }
     .btn { background-color: #37474f !important; color: #ffffff !important; border: 2px solid #263238 !important; font-weight: bold !important; font-size: 1.5rem !important; padding: 15px 60px !important; border-radius: 12px !important; transition: all 0.2s; display: inline-block }
     .btn:hover { background-color: #263238 !important; transform: scale(0.98); }
</style>
</head>
<body>
<div class="text-center">
   <h3 class="despair-title">
       아쉽게도 겹치지 않았습니다😢
       <span class="despair-sub">다시 선택하세요....</span>
   </h3>
   <form action="map.jsp" method="post">
     <button type="submit" class="btn btn-lg btn-secondary">돌아가기</button>
   </form> 
</div>       
</body>
</html>