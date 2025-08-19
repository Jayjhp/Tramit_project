<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">

<%
    String eName = "신세계백화점 스타필드하남점";
    String eX = "127.222316615387";
    String eY = "37.5459713959057";
%>

<head>
    <meta charset="UTF-8">
    <title>카카오 길찾기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ed13122bca3e043846b0db2d3c1c2be&libraries=services"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
    <style>
        .map_wrap { position: relative; width: 100%; height: 500px; }
        #menu_wrap {
            position: absolute; top: 10px; left: 10px; width: 300px;
            background: rgba(255,255,255,0.9); padding: 10px;
            border-radius: 10px; z-index: 2; overflow-y: auto; max-height: 90%;
        }
    	#placesList li {
	        list-style: none;
	        margin-bottom: 10px;
	        padding: 10px;
	        background-color: white; /* 배경 흰색으로 설정 */
	        border: 1px solid #ddd;
	        border-radius: 5px;
	        color: black; /* 글자색 명시적으로 설정 */
	    }

        #loadingLayer {
            display: none; position: absolute; top: 50%; left: 50%;
            transform: translate(-50%, -50%); background: rgba(0,0,0,0.6);
            color: white; padding: 20px 40px; font-size: 18px; border-radius: 10px; z-index: 10;
        }
    </style>
</head>

<div class="banner header-text position-relative"></div>

<body>
<div class="container" style="margin-top: 100px;">
    <div class="map_wrap">
        <div id="map" style="width:100%;height:100%;"></div>
        <div id="loadingLayer">주소 변환 중입니다...</div>
        <div id="menu_wrap">
            <form onsubmit="searchPlaces(); return false;">
                <label>키워드:
                    <input type="text" id="keyword" size="20">
                </label>
                <button type="submit">검색</button>
            </form>
            <hr>
            <ul id="placesList"></ul>
        </div>
    </div>
</div>

<script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
    	    center: new kakao.maps.LatLng(<%= eY %>, <%= eX %>),
    	    level: 3
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var ps = new kakao.maps.services.Places();
    var geocoder = new kakao.maps.services.Geocoder();
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
    var markers = [];

    var end = null;
    
    function openDirectionLink() {
        const url = "https://map.kakao.com/?sName=" + encodeURIComponent(start.name) +
                    "&sX=" + start.lng + "&sY=" + start.lat +
                    "&eName=" + encodeURIComponent(end.name) +
                    "&eX=" + end.lng + "&eY=" + end.lat;

        window.open(url, "_blank");
    }

    function searchPlaces() {
        var keyword = document.getElementById('keyword').value.trim();
        if (!keyword) {
            alert('키워드를 입력해주세요!');
            return;
        }
        ps.keywordSearch(keyword, placesSearchCB);
    }
    function placesSearchCB(data, status) {
        if (status === kakao.maps.services.Status.OK) {
            displayPlaces(data);
        } else {
            alert('검색 결과가 없습니다.');
        }
    }
    
    function displayPlaces(places) {
        var listEl = document.getElementById('placesList');
        listEl.innerHTML = '';
        removeMarker();
        var bounds = new kakao.maps.LatLngBounds();

        for (let i = 0; i < places.length; i++) {
            let place = places[i];
            let placePosition = new kakao.maps.LatLng(place.y, place.x);
            let marker = addMarker(placePosition);
            let itemEl = document.createElement('li');
            
            console.log(JSON.stringify(place));

            itemEl.innerHTML =
                "<strong>" + (place.place_name || "이름 없음") + "</strong><br>" +
                (place.address_name || "주소 없음") + "<br>";

            // 출발지 버튼 제거

            // 도착지 설정 버튼만 유지
            const btnEnd = document.createElement('button');
            btnEnd.textContent = "도착지 설정";
            btnEnd.classList.add("btn", "btn-sm", "btn-success", "mt-1");
            btnEnd.onclick = function () {
                end = {
                    name: place.place_name,
                    lat: place.y,
                    lng: place.x
                };
                toastr.success("도착지 설정 완료");
                navigateToDestination();
            };

            itemEl.appendChild(btnEnd);

            bounds.extend(placePosition);

            kakao.maps.event.addListener(marker, 'click', function () {
                var latlng = this.getPosition();
                map.panTo(latlng);
            });

            listEl.appendChild(itemEl);
        }

        map.setBounds(bounds);
    }

    function navigateToDestination() {
        if (end) {
            // 출발지는 비워두거나, 예를 들어 '내 위치'로 설정 가능
            // 현재는 출발지 좌표를 빈값으로 설정해서 URL 생성
            const url = "https://map.kakao.com/?eName=" + encodeURIComponent(end.name) +
                "&eX=" + end.lng +
                "&eY=" + end.lat;

            window.open(url, "_blank");
        }
    }
   

    function addMarker(position) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: position
        });
        markers.push(marker);
        return marker;
    }

    function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    function setEnd(name, lat, lng) {
        end = { name, lat, lng };
        toastr.success(`도착지 설정됨: ${name}`);
        checkAndNavigate();
    }

    function showLoading() {
        document.getElementById('loadingLayer').style.display = 'block';
    }

    function hideLoading() {
        document.getElementById('loadingLayer').style.display = 'none';
    }
</script>
</body>
</html>
