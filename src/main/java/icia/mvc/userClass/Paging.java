package icia.mvc.userClass;

public class Paging {
	private int maxNum; 		// 전체 글의 개수
	private int pageNum; 		// 현재 페이지 번호
	private int listCount; //10		// 페이지당 나타낼 글의 갯수
	private int pageCount; //2		// 페이지그룹당 페이지 갯수
	private String boardName; 	// 게시판의 종류
	private int cb_index;
	
	public Paging(int maxNum, int pageNum, int listCount, int pageCount, String boardName, int cb_index) {
		this.maxNum = maxNum;
		this.pageNum = pageNum;
		this.listCount = listCount;
		this.pageCount = pageCount;
		this.boardName = boardName;
		this.cb_index = cb_index;
	}

	@SuppressWarnings("unused")
	public String makeHtmlPaging() {
		// 전체 페이지 갯수
		int totalPage = (maxNum % listCount > 0)
				?maxNum/listCount+1 : maxNum/listCount;
		// 전체 페이지 그룹 갯수
		int totalGroup = (totalPage % pageCount > 0)
				? totalPage/pageCount+1 : totalPage/pageCount;
		// 현재 페이지가 속해 있는 그룹 번호
		int currentGroup = (pageNum % pageCount > 0)
				? pageNum/pageCount+1 : pageNum/pageCount;
		return makeHtml(currentGroup, totalPage, boardName);
	}

	private String makeHtml(int currentGroup, int totalPage, String boardName) {
		StringBuffer sb = new StringBuffer();
		//현재그룹의 시작 페이지 번호
		int start = (currentGroup * pageCount) 
				    - (pageCount - 1);
		//현재그룹의 끝 페이지 번호
		int end = (currentGroup * pageCount >= totalPage)
				? totalPage
				: currentGroup * pageCount;
		
		if (start != 1) {
			sb.append("<a href='javascript:' onclick='pagingComent("+(start -1)+","+cb_index+")'>");
			sb.append(" < ");
			sb.append("</a>");
		}

		for (int i = start; i <= end; i++) {
			if (pageNum != i) { //현재 페이지가 아닌 경우 링크처리
				sb.append("<a href='javascript:' onclick='pagingComent("+i+","+cb_index+")'>");
				sb.append(i);
				sb.append("</a>");
				
			} else { //현재 페이지인 경우 링크 해제
				sb.append("<font style='color:#ff9a2e;text-align: center;'>");
				sb.append(i);
				sb.append("</font>");
			}
		}
		if (end != totalPage) {
			sb.append("<a href='javascript:' onclick='pagingComent("+(end + 1)+","+cb_index+")'>");
			sb.append(" > ");
			sb.append("</a>");
		}
		return sb.toString();
	}
}
