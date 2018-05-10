package icia.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.bean.Question;
import icia.mvc.bean.ClassBean;
import icia.mvc.dao.SurvayDAO;

@Service
public class SurvayMM {
	
	@Autowired // 서버 시작 시 주입
    private SurvayDAO sDao;
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	// 설문조사 결과 분석
	public ModelAndView m_HobbyAnalyze(int[] checkList) {
		mav = new ModelAndView();
		int book = 0; //1
		int movie = 0; //2
		int music = 0; //3
		int craft = 0; //4
		int photo = 0; //5
		int exercise = 0; //6
		int[] result = new int[6];
		int val = 0;
		
		// 가장 점수가 높은 클래스 대분류 찾기
		for(int i=0;i<checkList.length;i++){
			System.out.println(checkList[i]);
			if(checkList[i] == 1){
				book += 1;
			}else if(checkList[i] == 2){
				movie += 1;
				
			}else if(checkList[i] == 3){
				music += 1;
			}else if(checkList[i] == 4){
				craft += 1;
			}else if(checkList[i] == 5){
				photo += 1;
			}else{
				exercise += 1;
			}
		}
		
		System.out.println("도서 : "+book);
		System.out.println("영화 : "+movie);
		System.out.println("음악 : "+music);
		System.out.println("공예 : "+craft);
		System.out.println("사진 : "+photo);
		System.out.println("운동 : "+exercise);
		
		// 가장 점수가 높은 클래스 대분류 매칭하기
		result[0] = book;
		result[1] = movie;
		result[2] = music;
		result[3] = craft;
		result[4] = photo;
		result[5] = exercise;
		
		for(int i=0;i<result.length;i++){
		   if(i == 0){
		      val = result[i];
		   }else{
		      if(val < result[i]){
		         val = result[i];
		      }
		   }
		}
		
		// class 대분류별로 메소드 호출
		List<ClassBean> classList;
		HashMap<String, Object> cList = new HashMap<String, Object>();
		
		for(int i=0;i<result.length;i++){
			if(val == result[i]){
				if(i == 0){
					System.out.println("도서");
					classList = sDao.classList("도서");
					if(classList != null){
						cList.put("bookList", classList);
					}
					
				}else if(i == 1){
					System.out.println("영화");
					classList = sDao.classList("영화");
					if(classList != null){
						cList.put("movieList", classList);
					}
					
				}else if(i == 2){
					System.out.println("음악");
					classList = sDao.classList("음악");
					if(classList != null){
						cList.put("musicList", classList);
					}
					
				}else if(i == 3){
					System.out.println("공예");
					classList = sDao.classList("공예");
					if(classList != null){
						cList.put("craftList", classList);
					}
					
				}else if(i == 4){
					System.out.println("사진");
					classList = sDao.classList("사진");
					if(classList != null){
						cList.put("photoList", classList);
					}
					
				}else{
					System.out.println("운동");
					classList = sDao.classList("운동");
					if(classList != null){
						cList.put("exerciseList", classList);
					}
				}
			}
		}
			// map의 key값만을 가져와 담기
			Set<String> key = cList.keySet();
			System.out.println(key.iterator().next());
			mav.addObject("key", key.iterator().next());
			mav.addObject("path", "/HNresources/uploadFolder/resources/hobbyClass/");
			mav.addObject("cList", cList);
			mav.setViewName("han/survayResult");
			return mav;
		}
	}
