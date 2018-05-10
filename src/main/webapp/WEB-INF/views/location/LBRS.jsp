<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>소수의 취향</title>
			<meta charset="utf-8"/>
			<link rel="stylesheet" href="resources/assets/css/main.css"/>
			<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
			<script src="resources/assets/js/jquery.min.js"></script>
	</head>
	<style>
		.map_wrap, .map_wrap * {
			margin:0;
			padding:0;
			font-family:'Malgun Gothic',dotum,'돋움',sans-serif;
			font-size:12px;
		}
		
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{
			color:#000;
			text-decoration: none;
		}
		
		.map_wrap {
			position:relative;
			width:100%;
			height:500px;
		}
		
		#menu_wrap {
			position:absolute;
			top:0;
			left:0;
			bottom:0;
			height: 320px;
			width:260px;
			margin:10px 0 30px 10px;
			padding:5px;
			overflow-y:auto;
			background:rgba(255, 255, 255, 0.7);
			z-index: 1;
			font-size:12px;
			border-radius: 10px;
		}
		
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}
		
		#menu_wrap .option button {
			margin-left: 5px;
		    border-radius: 6px;
		    padding: 8px;
		    margin: 15px 0px 10px 0px;
		}
		
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {
			float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;
			background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png) no-repeat;
			background-position: left center;
		}
		
		/* #placesList .item .marker_1 {background-position: 0 -10px;} */
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"/>
	
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>위치 서비스</h1>
			<p>내 주변에는 어떤 클래스들이 있을까?</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
			
		<p style="margin-top:-12px">
		    <!--<em class="link">
		        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
		            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
		        </a>
		    </em>-->
		</p>
	
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;">
		                	<p><b>카테고리</b></p>
		                	${locSelect}<br/>
		                	<input type="text" value="" id="keyword" size="15">
		                    <button type="submit">검색하기</button> 
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
	     <div id="eb_blank"></div>	
	     
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=30e0a9f9ff043622c0e4de376c0f1791&libraries=services"></script>
	<script>
		function selectSel(ele){
			var ele = ele.searchProcess.selectedIndex;
			if(ele == 0 ){
				location.href="locService";
			}else{
			location.href="locSort?sort="+ele+"";
			}
		}
		
		function confirmClick(index){
		      if (confirm("해당 클래스로 이동하시겠습니까?")==true){
		    	  location.href="classDetail_contents?c_index="+index;
		   
		      }else{
		         return;
		      }
		   }
		
		var loc = new Array();
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		    //center: new daum.maps.LatLng(37.45123215166781, 126.65945570940325) // 지도의 중심좌표
		    center: new daum.maps.LatLng(33.450701, 126.570667),
		        level: 5 // 지도의 확대 레벨
		    };  
	
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
	
		//주소-좌표 변환 객체를 생성합니다
		${test}
		
	    //daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    //daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    //console.log(a[i]+"x y"+b[i])
        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		/* 아래와 같이도 할 수 있습니다 */
		/*
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new daum.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    (function(marker, infowindow) {
		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		        daum.maps.event.addListener(marker, 'mouseover', function() {
		            infowindow.open(map, marker);
		        });
		
		        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		        daum.maps.event.addListener(marker, 'mouseout', function() {
		            infowindow.close();
		        });
		    })(marker, infowindow);
		}
		*/
	      
	   // 마커를 담을 배열입니다
      var markers = [];
	
      // 장소 검색 객체를 생성합니다
      var ps = new daum.maps.services.Places();  

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new daum.maps.InfoWindow({zIndex:1});

      // 키워드로 장소를 검색합니다
      searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		var keyword = document.getElementById('keyword').value;
		
		if (!keyword.replace(/^\s+|\s+$/g, '')) {
		   // alert('키워드를 입력해주세요!');
		    return false;
		}

          // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
          ps.keywordSearch( keyword, placesSearchCB); 
      }
	
      // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
      function placesSearchCB(data, status, pagination) {
          if (status === daum.maps.services.Status.OK) {

              // 정상적으로 검색이 완료됐으면
              // 검색 목록과 마커를 표출합니다
              displayPlaces(data);

              // 페이지 번호를 표출합니다
              displayPagination(pagination);
          } else if (status === daum.maps.services.Status.ZERO_RESULT) {
              alert('검색 결과가 존재하지 않습니다.');
              return;
          } else if (status === daum.maps.services.Status.ERROR) {
              alert('검색 결과 중 오류가 발생했습니다.');
              return;
          }
      }
	
	      // 검색 결과 목록과 마커를 표출하는 함수입니다
	      function displayPlaces(places) {
	
	          var listEl = document.getElementById('placesList'), 
	          menuEl = document.getElementById('menu_wrap'),
	          fragment = document.createDocumentFragment(), 
	          bounds = new daum.maps.LatLngBounds(), 
	          listStr = '';
	          
	          // 검색 결과 목록에 추가된 항목들을 제거합니다
	          removeAllChildNods(listEl);
	          // 지도에 표시되고 있는 마커를 제거합니다
	          removeMarker();
	          for ( var i=0; i<1; i++ ) {
	              // 마커를 생성하고 지도에 표시합니다
	              var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
	                  marker = addMarker(placePosition, i), 
	                  itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	              // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	              // LatLngBounds 객체에 좌표를 추가합니다
	              bounds.extend(placePosition);
	
	              // 마커와 검색결과 항목에 mouseover 했을때
	              // 해당 장소에 인포윈도우에 장소명을 표시합니다
	              // mouseout 했을 때는 인포윈도우를 닫습니다
	              (function(marker, title) {
	                  daum.maps.event.addListener(marker, 'mouseover', function() {
	                      displayInfowindow(marker, title);
	                  });
	
	                  daum.maps.event.addListener(marker, 'mouseout', function() {
	                      infowindow.close();
	                  });
	
	                  itemEl.onmouseover =  function () {
	                      displayInfowindow(marker, title);
	                  };
	
	                  itemEl.onmouseout =  function () {
	                      infowindow.close();
	                  };
	              })(marker, places[i].place_name);
	              fragment.appendChild(itemEl);
	          }
	          
	          // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	          listEl.appendChild(fragment);
	          menuEl.scrollTop = 0;
	          // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	          map.setBounds(bounds);
	      }
	
	      // 검색결과 항목을 Element로 반환하는 함수입니다
	      function getListItem(index, places) {
	          var el = document.createElement('li'),
	          itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                      '<div class="info">' +
	                      '   <h5>' + places.place_name + '</h5>';
	          if (places.road_address_name) {
	              itemStr += '    <span>' + places.road_address_name + '</span>' +
	                          '   <span class="jibun gray">' +  places.address_name  + '</span>';
	          } else {
	              itemStr += '    <span>' +  places.address_name  + '</span>'; 
	          }     
	            itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                      '</div>';           
	
	          el.innerHTML = itemStr;
	          el.className = 'item';
	          return el;
	      }
	
	      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	      function addMarker(position, idx, title) {
	          var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png" // 마커 이미지 url, 스프라이트 이미지를 씁니다
	              imageSize = new daum.maps.Size(32, 45),  // 마커 이미지의 크기
	             
	              /*imgOptions =  {
	                  spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	                  spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	                  offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	              },
	              */
	              markerImage = new daum.maps.MarkerImage(imageSrc, imageSize/*, imgOptions*/),
	                  marker = new daum.maps.Marker({
	                  position: position, // 마커의 위치
	                  image: markerImage 
	              });
	          marker.setMap(map); // 지도 위에 마커를 표출합니다
	          markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	          return marker;
	      }
	
	      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	      function removeMarker() {
	          for ( var i = 0; i < markers.length; i++ ) {
	              markers[i].setMap(null);
	          }   
	          markers = [];
	      }
	/*
	      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	      function displayPagination(pagination) {
	          var paginationEl = document.getElementById('pagination'),
	              fragment = document.createDocumentFragment(),
	              i; 
	
	          // 기존에 추가된 페이지번호를 삭제합니다
	          while (paginationEl.hasChildNodes()) {
	              paginationEl.removeChild (paginationEl.lastChild);
	          }
	
	          for (i=1; i<=pagination.last; i++) {
	              var el = document.createElement('a');
	              el.href = "#";
	              el.innerHTML = i;
	
	              if (i===pagination.current) {
	                  el.className = 'on';
	              } else {
	                  el.onclick = (function(i) {
	                      return function() {
	                          pagination.gotoPage(i);
	                      }
	                  })(i);
	              }
	
	              fragment.appendChild(el);
	          }
	          paginationEl.appendChild(fragment);
	      }
	*/
	      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	      // 인포윈도우에 장소명을 표시합니다
	      function displayInfowindow(marker, title) {
	          var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	          infowindow.setContent(content);
	          infowindow.open(map, marker);
	      }
	
	       // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	      function removeAllChildNods(el) {   
	          while (el.hasChildNodes()) {
	              el.removeChild (el.lastChild);
	          }
	      }
	</script>
	</body>
</html>