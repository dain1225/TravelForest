<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>여행 지역 투표</title>
    <style>
        h2 { font-family: 'Do Hyeon', sans-serif; font-size: 36px; color: #3498db; text-align: center; text-shadow: -2px -2px 0 #fff,  2px -2px 0 #fff, -2px  2px 0 #fff,  2px  2px 0 #fff, 4px  4px 0px rgba(0,0,0,0.15); margin-top: 30px; letter-spacing: 1px; }
        .info-box { background-color: #f1f2f6; padding: 10px; margin: 0 auto 20px auto; border-radius: 8px; display: block; width: max-content; text-align: center; }
        #map { width: 800px; height: 500px; margin: 0 auto; border: 2px solid #ccc; border-radius: 10px; }
        
        /* 전체 버튼 스타일 */
        .btn-group { margin-top: 25px; display: flex; justify-content: center; gap: 15px; }
        .submit-btn { font-family: 'Do Hyeon', sans-serif; padding: 10px 30px; font-size: 18px; color: white; border: none; border-radius: 5px; cursor: pointer; }
        /* 확인 버튼 */
        .btn-select { background-color: #9575cd; } 
        .btn-select:hover { background-color: #673ab7; }
        /* 결과 버튼 */
        .btn-result { background-color: #ff9aa2; }
        .btn-result:hover { background-color: #fc5c7d; }
    </style>

    <%-- 1. 백엔드에서 날아온 꼬리표(msg)를 확인하고 팝업 띄우기 --%>
    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
            out.println("<script>alert('✅ 지역 선택이 확정되었습니다!');</script>");
        } else if ("duplicate".equals(msg)) {
            out.println("<script>alert('❌ 이미 누군가 선택한 지역입니다! 다른 곳을 골라주세요.');</script>");
        }
    %>

    <%-- 2. 카카오맵 API 스크립트 불러오기 (여기에 발급받은 JS 키를 넣으세요!) --%>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=adb4a41a2fd98e73b86c0fbc6ce8d7be"></script>
</head>
<body>

    <h2>🗺️ 가고 싶은 여행지를 지도에서 클릭하세요!</h2>
    
    <div class="info-box">
        <b>현재 방 코드:</b> <%= session.getAttribute("groupCode") %> | 
        <b>나의 유저 번호:</b> <%= session.getAttribute("userSeq") %>번
    </div>

    <div id="map"></div>

    <form action="map_process.jsp" method="post" id="mapForm">
        <input type="hidden" id="selectedLat" name="latitude" value="">
        <input type="hidden" id="selectedLng" name="longitude" value="">
        
        <div class="btn-group">
            <button type="button" id="submitBtn" class="submit-btn btn-select" onclick="submitRegion()">선택 완료!</button>           
            <button type="button" id="resultBtn" class="submit-btn btn-result" onclick="voteResult()" style="display: none;">✨ 결과 보기</button>
        </div>
    </form>

    <script>
        // --- [카카오맵 그리기 및 클릭 이벤트 로직] ---
        
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(36.2683, 127.6358), // 대한민국 중심 좌표 (초기 화면)
                level: 13 // 지도의 확대 레벨 (숫자가 클수록 넓게 보임)
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성

        // 지도를 클릭했을 때 찍힐 빨간색 마커 생성
        var marker = new kakao.maps.Marker({ 
            position: map.getCenter() 
        }); 
        marker.setMap(map); // 마커를 지도에 올림

        // ★ 지도를 클릭하면 발생하는 이벤트!
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
            var latlng = mouseEvent.latLng; // 클릭한 곳의 위도/경도 좌표 가져오기
            
            // 1. 마커를 클릭한 위치로 쓩 이동시킴
            marker.setPosition(latlng);
            
            // 2. 숨겨진 input 칸에 위도와 경도 값을 쏙 집어넣음
            document.getElementById('selectedLat').value = latlng.getLat();
            document.getElementById('selectedLng').value = latlng.getLng();
        });

        // [선택 완료] 버튼을 눌렀을 때 실행되는 함수
        function submitRegion() {
            var lat = document.getElementById('selectedLat').value;
            if (lat === "") {
                alert("지도를 클릭해서 먼저 지역을 선택해주세요!");
                return;
            }
            // 폼 데이터를 map_process.jsp로 전송!
            document.getElementById('mapForm').submit(); 
        }
        
        // [결과 보기] 버튼 클릭 시 실행되는 함수
        function voteResult() {
        	var form = document.getElementById('mapForm');
        	// 투표 결과 전송
        	form.action = "vote.do";
        	form.submit();
        }
    </script>
</body>
</html>