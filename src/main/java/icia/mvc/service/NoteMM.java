// NoteMM 담당자 : 김재간

package icia.mvc.service;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.bean.Note;
import icia.mvc.bean.Report;
import icia.mvc.dao.INoteDAO;

@Service
public class NoteMM {

	@Autowired
	private INoteDAO nDao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;

	private ModelAndView mav;
	private String view;

	public ModelAndView nt_SendNoteList(String id) {
		mav = new ModelAndView();
		ArrayList<Note> nlist_0 = new ArrayList<>();
		ArrayList<Note> nlist_1 = new ArrayList<>();
		nlist_0 = nDao.getNoteList_0(id);
		nlist_1 = nDao.getNoteList_1(id);
		String nlist1 = makeHtmlNlist_Resiv(nlist_1);
		String nlist0 = makeHtmlNlist_send(nlist_0);
		// 카운트해서 읽지 않는 수 표시 // 상태가 0인 상태의 컬럼뽑기 // 다시 세션 속성에 넣어 갱신 되게한다.
		int cnt = nDao.noteCount(id);
		session.setAttribute("cnt",cnt);
		mav.addObject("nlist0", nlist0); // 보낸 쪽지 목록을 StringBuilder 형태로 처리하여 view에 보낸다.
		mav.addObject("nlist1", nlist1); // 받은 쪽지 목록을 StringBuilder 형태로 처리하여 view에 보낸다.
		view = "note/noteList";
		mav.setViewName(view);
		return mav;
	}

	/* 받은 쪽지  */
	private String makeHtmlNlist_Resiv(List<Note> nlist) { 
		StringBuilder tag = new StringBuilder();
		tag.append("<form name='frm' action='mailDelete' method='post' onsubmit='return check(this)'>");  //onsubmit=return 'check()'>
		tag.append("<table border='1' style='border-collapse: collapse;' >\n");
		tag.append("<tr><td colspan = '6' style = 'text-align:center;'><b>받은 쪽지</b></td></tr>\n");
		tag.append("			<tr>\n");
		tag.append("	<th style='padding: 14px;'><input id='allCheck1' type='checkbox' onclick='allChk1(this);'/></th>\n");
		tag.append("					<th style='padding: 14px;'>보낸 사람</th>\n");   
		tag.append("					<th style='padding: 14px;'>제목</th>\n");
		tag.append("					<th style='padding: 14px;'>내용</th>\n");
		tag.append("					<th style='padding: 14px;'>받은 날짜</th>\n");
		tag.append("					<th style='padding: 14px;'>차단</th>");
		tag.append("</tr>\n\n");
		
		if(nlist.size()==0){
			
			tag.append("<tr><td colspan = '6'>받은 쪽지가 없습니다.</tr>\n");
			tag.append("		 </table>\n");
			tag.append("</form>");
			return tag.toString();
		}
		for(int i=0; i<nlist.size(); i++){
			if(nlist.get(i).getN_state() != 3 || nlist.get(i).getN_state() != 5){
				tag.append("	<tr align='center' style='color:#A4A4A4'>\n");	
			tag.append("	               <td>\n");
			tag.append("<input type='checkbox' name='RowCheck1' class = 'RowCheck1' value='"+nlist.get(i).getN_index()+"'/>\n");
			tag.append("                   </td>\n");
			tag.append("					<td>"+nlist.get(i).getM_id()+"</td>\n");
			tag.append("					<td>"+nlist.get(i).getN_subject()+"</td>\n");
			
			// 내용컬럼이 20자 이상 넘으면...(말 줄임) 표시를 하기 위해 처리
			int len =nlist.get(i).getN_content().length();
			if(len >= 20) {
				tag.append("<td><a href='#' onclick='countRead("+nlist.get(i).getN_index()+")'>"+nlist.get(i).getN_content().substring(0, 20)+"...</a></td>\n");
			}else {
				tag.append("<td><a href='#' onclick='countRead("+nlist.get(i).getN_index()+")'>"+nlist.get(i).getN_content()+"</a></td>\n");
			}
			
			// a는 신고자 , b는 신고당한 사람
			String a = '"'+nlist.get(i).getM_id2()+'"';
			String b = '"'+nlist.get(i).getM_id()+'"';
			tag.append("<td>"+nlist.get(i).getN_date()+"</td>\n");
			tag.append("<td><a href='#' onclick='confirmBan("+a+","+b+")'>차단</a></td>\n");
			tag.append("</tr>\n\n");
			}
		}
		tag.append("		</table>\n");
		tag.append("         <button type='submit' name='btn_sort' value='3' onclick='asd(1)' class='eb_btn3'>삭제</button>\n");
		tag.append("         <button type='submit' name='btn_sort' value='2' onclick='asd(2)' class='eb_btn3'>신고</button>\n");
		tag.append("</form>");
		return tag.toString();
	}
	
	/* 보낸 쪽지 */
	private String makeHtmlNlist_send(List<Note> nlist) { 

		StringBuilder tag = new StringBuilder();
		tag.append("<form name='frm' action='mailDelete' method='post'>");
		tag.append("<table border='1' style='border-collapse: collapse;'>\n");
		tag.append("	<tr>\n");
		tag.append("		<td colspan = '6' style = 'text-align:center;'><b>보낸 쪽지</b></td>");
		tag.append("	</tr>\n");
		tag.append("	<tr>\n");
		tag.append("		<th style='padding: 14px;'><input id='allCheck0' type='checkbox' onclick='allChk0(this);'/></th>\n");
		tag.append("		<th style='padding: 14px;'>받은 사람</th>\n");
		tag.append("		<th style='padding: 14px;'>제목</th>\n");
		tag.append("		<th style='padding: 14px;'>내용</th>\n");
		tag.append("		<th style='padding: 14px;'>보낸 날짜</th>\n");
		tag.append("	</tr>\n\n");
		
		if(nlist.size()==0){ // 처리해야하는 부분
			
			tag.append("<tr><td colspan = '6'>보낸 쪽지가 없습니다.</tr>\n");
			tag.append("		 </table>\n");
			tag.append("         <button type='submit' name='btn_sort' value='4' class='eb_btn3'/>삭제</button>\n");
			tag.append("</form>");
			return tag.toString();
		}
		for(int i=0; i<nlist.size(); i++){		
			if(nlist.get(i).getN_state() != 4 || nlist.get(i).getN_state() != 5){
			tag.append("	<tr align='center'>\n");
			tag.append("	               <td>\n");
			tag.append("<input type='checkbox' name='RowCheck1' class = 'RowCheck0' value='"+nlist.get(i).getN_index()+"'/>\n");
			tag.append("                   </td>\n");
			tag.append("					<td>"+nlist.get(i).getM_id2()+"</td>\n"); // 
			tag.append("					<td>"+nlist.get(i).getN_subject()+"</td>\n");
			
			//  ...(말 줄임) 표시를 하기 위해 처리된 내용 
			int len =nlist.get(i).getN_content().length();
			if(len >= 20) {
					tag.append("<td><a href='#' onclick='countRead("+nlist.get(i).getN_index()+")'>"+nlist.get(i).getN_content().substring(0, 20)+"...</a></td>\n");
			}else {
				tag.append("<td><a href='#' onclick='countRead("+nlist.get(i).getN_index()+")'>"+nlist.get(i).getN_content()+"</a></td>\n");
			}
	
			tag.append("<td>"+nlist.get(i).getN_date()+"</td>\n");
			tag.append("			</tr>\n\n");
			}
		}
		
		tag.append("	</table>\n");
		tag.append("         <button type='submit' name='btn_sort' value='4' class='eb_btn3'/>삭제</button>\n");
		tag.append("</form>");
		
		return tag.toString();
	}

	public ModelAndView nt_NoteWrite() {
		Note nt = new Note();
		String m_id = request.getParameter("m_id");
		String m_id2 = request.getParameter("m_id2");
		String n_subject = request.getParameter("n_subject");
		String n_content = request.getParameter("n_content");
		int checkId = nDao.checkId(m_id2);
		if(checkId==1){
		int n_state = 0;
		int n_sort = 0 ;
		nt.setM_id(m_id);
		nt.setM_id2(m_id2);
		nt.setN_content(n_content);
		nt.setN_subject(n_subject);
		nt.setN_sort(n_sort);
		nt.setN_state(n_state);

		if(nDao.noteInsert(nt) == 1){ // 성공 여부
			String text = popclose();
			mav.addObject("text" , text);
			mav.setViewName("note/mailWriteForm");
		}
		
		}else{ // id check
			String checkIdAlert = checkId();
			mav.addObject("text" , checkIdAlert);
			mav.setViewName("note/mailWriteForm");
		}
		return mav;
	}
	
	public String popclose(){
		StringBuilder tag = new StringBuilder();
		tag.append("\n");
		tag.append(" $(document).ready( function() {\n");
		tag.append("window.opener.top.location.href='noteList';\n");
		tag.append("window.opener.top.location.reload();\n");
		tag.append("alert('쪽지 전송이 완료되었습니다.')\n");
		tag.append(" self.close()  \n");   
		tag.append("});\n");
		return tag.toString();
	}
	
	public String checkId(){
		StringBuilder tag = new StringBuilder();
		tag.append("\n");
		tag.append(" $(document).ready( function() {\n");
		tag.append(" alert('없는 아이디 입니다.')  \n");   
		tag.append("});\n");
		return tag.toString();
	}

	public void noteDelete(int index,int n_state) {			
		Note nt = new Note();
		nt = nDao.noteDetail(index);
		int chk = nt.getN_state();
				
		if(chk == 3 || chk == 4){
			nt.setN_state(5);
		}else{
			nt.setN_state(n_state);
		}
		
		nt.setN_index(index);
		nDao.noteState(nt);
	}

	public void noteReport(int index) {
		int suc = 0;
		suc = nDao.noteReport(index);
	}

	public void noteBlock(String id_1, String id_2) {   // 1 요청자 2받은 사람
		HashMap<String, Object> setBlock = new HashMap<String, Object>();
		setBlock.put("M_ID", id_1);
		setBlock.put("M_ID2", id_2);
		int suc = 0;
		suc = nDao.noteBlock(setBlock);
		mav.setViewName("note/noteList");
	}

	public ModelAndView nt_NoteDetail(int index) {
		Note nt = new Note();
		nt = nDao.noteDetail(index);
		nDao.noteWriteChange(index);
		mav.addObject("nDetail", nt);
		mav.setViewName("note/noteDetail");
		return mav;
	}

	public void noteAuto(String id){
		List<String> deadSubject = null;
		HashMap<String, String> noteAuto = null;
		int ch = 0;
		ch = nDao.noteCheck(id); 
		if(ch==0){
			deadSubject = nDao.noteAuto(id);
			if(deadSubject.size()!=0){
			for(int i=0; i<deadSubject.size(); i++){
				String n_content = "관심 클래스로 등록한 "+ deadSubject.get(i)+"의 마감 기한이 하루 남았습니다.";
				int n_state = 0;
				int n_sort = 0 ;
				Note nt = new Note();
				nt.setM_id("admin");
				nt.setM_id2(id);
				nt.setN_content(n_content);
				nt.setN_subject("[알림]마감 기한 임박");
				nt.setN_sort(n_sort);
				nt.setN_state(n_state);
				int s = 0;
				if(nDao.noteInsert(nt) == 1){
					s = 1;
				}
			}
		}
	}
	}

	// ban할 경우 대상자 이름 불러오기
	// 신고 button을 누르면 해당 글의 index를 이용하여 작성자를 불러온다. 
	// 불러온 작성자를 신고 폼에서 신고 아이디로 등록해 놓는다.
	public List<Note> m_id2Ban(int index) { 
		List<Note> note = new ArrayList<>();
		note = nDao.noteM_id2(index);
		return note;
	}
	
	public ModelAndView banInsert(int sort,int index, String m_id2) {
		int c_index = 0;
		mav = new ModelAndView();
		Member mb = (Member) session.getAttribute("mb");
		String id = mb.getM_id();
		String b_selected = request.getParameter("b_selected");
		String b_text = request.getParameter("b_text");
		try {
			c_index = Integer.parseInt(request.getParameter("c_index"));
		} catch (Exception e) {
			
		}
		Report rt = new Report();	
		rt.setM_id(id);
		rt.setM_id2(m_id2);
		rt.setRp_sort(sort);
		rt.setRp_reason(b_selected);
		rt.setRp_content(b_text);
		rt.setRp_index(index);
		nDao.banInsert(rt); 
		
		// 신고 작성 폼에서 취소 클릭 시 전 페이지로 이동하기 위한 분류
		if(sort==4){ // note로 이동
			mav.setViewName("redirect:/noteList");
		}else if(sort==0){ // 투표 페이지
			mav.setViewName("redirect:/voteDetail?cb_index="+index);
		}else if(sort==1){ // 투표 페이지
			mav.setViewName("redirect:/freeDetail?cb_index="+index);
		}else if(sort==2){ // 후기 게시판
			mav.setViewName("redirect:/classDetail_contents?c_index="+c_index);
		}else if(sort==3){ // 포토 페이지
			mav.setViewName("redirect:/photoGallery_list?cb_index="+index);
		}else if(sort==5){ // 취미 클래스
			mav.setViewName("redirect:/classDetail_contents?c_index="+c_index);
		}
		return mav;
	}
	
}


