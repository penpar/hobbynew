// LoctionMM 담당자 : 김재간

package icia.mvc.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.ClassBean;
import icia.mvc.bean.Location;
import icia.mvc.bean.Note;
import icia.mvc.dao.INoteDAO;
import icia.mvc.dao.IlocationDAO;

@Service
public class LocationMM {
	
	@Autowired
	private IlocationDAO lDao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	private ModelAndView mav;
	private String view;


	   public ModelAndView locations(String id) {
		      ModelAndView mav = new ModelAndView();
		      List<ClassBean> locList = new ArrayList<ClassBean>();
		      
		      // 자신의 위치 좌표
		      String myLocation = lDao.mmAdress(id);
		      // 클래스 위치 표시
		      locList = lDao.locatioInfo();
		      String locMark = locMark(locList , myLocation);
		      String locSelect = locSelect(0);
		      // 셀렉트 박스 표시 
		      mav.addObject("locSelect", locSelect);
		      mav.addObject("test", locMark);
		      mav.setViewName("location/LBRS"); 
		      return mav;
		   }
	   
	   	public ModelAndView locSort(int sort, String id) {
	   		ModelAndView mav = new ModelAndView();
			List<ClassBean> locSort = new ArrayList<ClassBean>();
			
			// 자신의 위치 좌표
		   	String myLocation = lDao.mmAdress(id);
		        locSort = lDao.locSort(sort);
		   	String locSelect = locSelect(sort);
			String locMark = locMark(locSort,myLocation);
			mav.addObject("locSelect", locSelect);
			mav.addObject("check", sort);
			mav.addObject("test", locMark);
			mav.setViewName("location/LBRS"); 
			return mav;
		}

		private String locSelect(int sort) {
		StringBuilder tag = new StringBuilder();
		System.out.println("sort " + sort);
		String a0=null,a1=null,a2=null,a3=null,a4=null,a5=null,a6=null;
		
		 switch(sort){
 	  	case 1:
 	  		a1="selected='selected'";
 	        break;
 	    case 2:
 	    	a2="selected='selected'";
 	        break;
 	    case 3:
 	    	a3="selected='selected'";
 	        break;
 	    case 4:
 	    	a4="selected='selected'";
 	        break;
 	    case 5:
 	    	a5="selected='selected'";
 	        break;
 	    case 6:
 	    	a6="selected='selected'";
 	        break;
 	    default:
 	    	a0="selected='selected'";
 	}
		
	      tag.append("<select name='searchProcess' class = 'selectBox' onchange='selectSel(this.form)' style='width:100%;margin:5px 0px 0px 0px'>\n");
	      tag.append("<option value='1 '"+a0+">전체</option>\n");
	      tag.append("<option value='2 '"+a1+">도서</option>\n");
	      tag.append("<option value='3 '"+a2+">영화</option>\n");
	      tag.append("<option value='4 '"+a3+">음악</option>\n");
	      tag.append("<option value='5 '"+a4+">공예</option>\n");
	      tag.append("<option value='6 '"+a5+">사진</option>\n");
	      tag.append("<option value='0 '"+a6+">운동</option>\n");
	      tag.append("</select>\n");
	   	
	   		return tag.toString();
		}
	   	
		
		private String locMark(List<ClassBean> locList, String myLocation) {
		      StringBuilder tag = new StringBuilder();
		     
		      tag.append("\n");
		      tag.append(" var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png'; \n");
		      tag.append("  var imageSize = new daum.maps.Size(24, 35); \n");     		   
		      tag.append("  var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); \n");
		      tag.append("var geocoder = new daum.maps.services.Geocoder();\n");
		      tag.append("geocoder.addressSearch('"+myLocation+"', function(result, status) {\n");
		      tag.append("  if (status === daum.maps.services.Status.OK) {\n");
		      tag.append("    var coords = new daum.maps.LatLng(result[0].y, result[0].x);\n");
		      tag.append("   var marker = new daum.maps.Marker({\n");
		      tag.append("       map: map,\n");
		      tag.append("       position: coords,\n");
		      tag.append("       image : markerImage \n");
		      tag.append("   });\n");
		      tag.append("  map.setCenter(coords);\n");
		      tag.append(" } \n");
		      tag.append("   });  \n");
		      tag.append("var geocoder = new daum.maps.services.Geocoder();\n");
		      
		      // 지도에 확대 축소 컨트롤을 생성한다
		      tag.append(" var zoomControl = new daum.maps.ZoomControl();\n");

			  // 지도의 우측에 확대 축소 컨트롤을 추가한다
		      tag.append(" map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);\n");
		      
		      for(int i=0; i<locList.size(); i++) {
		    	  
		    	  String a = null;
		    	  switch(locList.get(i).getCn_index()){
		    	  	case 1:
		    	  		a="도서";
		    	        break;
		    	    case 2:
		    	    	a="영화";
		    	        break;
		    	    case 3:
		    	    	a="음악";
		    	        break;
		    	    case 4:
		    	    	a="공예";
		    	        break;
		    	    case 5:
		    	    	a="사진";
		    	        break;
		    	    case 6:
		    	    	a="운동";
		    	        break;
		    	    default:
		    	    	a="기타";
		    	}

		         tag.append("var asd = '"+locList.get(i).getC_address()+"';\n");
		         tag.append("geocoder.addressSearch(asd, function(result ,status) {\n");
		         // 정상적으로 검색이 완료되면 실행 
		         tag.append("       if (status === daum.maps.services.Status.OK) {\n");
		         tag.append("       var coords = new daum.maps.LatLng(result[0].y, result[0].x);\n");
		         tag.append("       var marker = new daum.maps.Marker({\n");
		         tag.append("          map: map,\n");
		         tag.append("          position: coords\n");
		         tag.append("      });\n");	         
	             tag.append("var aa = '&nbsp;["+ a +"] "+locList.get(i).getC_subject()+"'\n");
		         tag.append("       var infowindow = new daum.maps.InfoWindow({\n");
		         tag.append("           content: aa// 인포윈도우에 표시할 내용\n");
		         tag.append("       });\n");
		         tag.append("    (function(marker, infowindow) {\n");
		       
		         // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		         tag.append("daum.maps.event.addListener(marker, 'mouseover', function() {\n");
		         tag.append("            infowindow.open(map, marker);\n");
		         tag.append("   });\n");

		         // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		         tag.append("daum.maps.event.addListener(marker, 'mouseout', function() {\n");
		         tag.append("               infowindow.close();\n");
		         tag.append("           });\n");
		         tag.append(" daum.maps.event.addListener(marker, 'click', function() {\n");
	            
		         // 마커 위에 인포윈도우를 표시합니다
		         tag.append("confirmClick("+locList.get(i).getC_index()+");");
	             tag.append(" });\n");    
		         tag.append("       })(marker, infowindow);\n");
		         tag.append("     }\n");
		         tag.append("  });\n");
		      }
		      return tag.toString();
		   }





		





}
