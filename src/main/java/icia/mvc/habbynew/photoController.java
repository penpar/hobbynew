package icia.mvc.habbynew;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Photo;
import icia.mvc.service.PhotoMM;

@Controller
public class photoController {
	
	private ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private PhotoMM pmm;
	
		// 포토 갤러리 페이지 이동
		@RequestMapping(value = "/photoGallery_list", method = RequestMethod.GET)
		public ModelAndView survay(HttpServletRequest request) {
			System.out.println("photoList");
			mav = pmm.photoList(request);
			return mav;
		}

		// 포토 리스트
		@RequestMapping(value = "/photoGallery", method = RequestMethod.GET , produces = "application/json; charset=utf8")
		public @ResponseBody Map<String, Object> photoGallery(HttpServletRequest request) {
			System.out.println("photoList");

			return pmm.photoGallery(request);
		}
		
		// 포토 갤러리 글쓰기 페이지 이동
		@RequestMapping(value = "/photoGallery_write", method = RequestMethod.GET)
		public ModelAndView photoGallery_write() {
			mav = new ModelAndView();
			mav.setViewName("han/photoGallery_write");
			return mav;
		}
		
		// 포토 갤러리 글쓰기
		@RequestMapping(value = "/photoWrite", method = RequestMethod.POST)
		public ModelAndView photoWrite(Photo photo, MultipartFile[] p_file) {
			mav = pmm.photoWrite(photo, p_file);
			return mav;
		}
		
		// 포토 갤러리 상세보기
		@RequestMapping(value = "/photoAjax", produces = "application/json; charset=utf8")
	   public @ResponseBody Map<String, Object> photoAjax(int cb_index) {
			Map<String, Object> photoMap =pmm.photoAjax(cb_index);
			return photoMap;
	   }
		
		// 수정 페이지 이동
		@RequestMapping(value = "/photoGallery_update", method = RequestMethod.GET)
		public ModelAndView photoGallery_update(int cb_index) {
			mav = new ModelAndView();
			mav = pmm.PhotoGallery_update(cb_index);
			return mav;
		}
		
		// 포토 갤러리 수정
		@RequestMapping(value = "/photoUpdate", produces = "application/json; charset=utf8")
	   public ModelAndView photoUpdate(Photo photo, MultipartFile[] p_file) {
			mav = new ModelAndView();
			mav =pmm.photoUpdate(photo, p_file);
			return mav;
	   }
		
		// 포토 갤러리 삭제
		@RequestMapping(value = "/photoGallery_delete", method = RequestMethod.GET)
		   public ModelAndView photoGallery_delete(int cb_index) {
				mav = new ModelAndView();
				mav =pmm.photoGallery_delete(cb_index);
				return mav;
		   }
}
