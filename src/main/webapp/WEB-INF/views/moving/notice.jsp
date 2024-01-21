<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include  file="../inc/header.jsp" %>

    <!-- main -->
    <main id="main" class="main">
      <h2 class="blind">공지 리스트</h2>
      <div id="container" class="container">
        <div class="as_board-list">
          <div class="list-tabs type2">
            <span class="list-tabs__item is-active">공지사항</span>
          </div>

          <div class="as_board-list__head">
            <h3 class="as_board-list__notice">총 <strong>N개</strong>의 게시글이 있습니다.</h3>
            <div class="srch-box">
              <div class="select-box">
                <select id="srchKey" class="select">
                  <option value="TitleNm">제목</option>
                  <option value="ContentsNm">내용</option>
                </select>
              </div>
              <div class="inp-box">
                <label>
                  <input type="text" id="srchVal" class="inp bg-none" value="" placeholder="검색어를 입력해주세요.">
                </label>
                <button type="button" class="btn-del"><span class="blind">입력 내용 삭제</span></button>
                <button type="button" class="btn-srch"><span class="blind">입력어로 검색</span></button>
              </div>
            </div>
          </div>

          <div class="as_board-list__table">
            <table>
              <colgroup>
                <col style="width:10%">
                <col>
                <col style="width:13%">
                <col style="width:13%">
                <col style="width:12%">
              </colgroup>
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>구분</th>
                  <th>등록일</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody>
                <!-- TODO: 페이지당 10개 게시글 -->
                <tr>
                  <td>no</td>
                  <td>
                    <a href="noticeDetail.as">게시글 제목</a>
                  </td>
                  <td>작성자</td>
                  <td>YYYY-MM-DD</td>
                  <td>조회수</td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="pagenate">
            <a href="#" class="prev"><span class="blind">이전 페이지</span></a>
            <a href="#" class="is-active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#" class="next"><span class="blind">다음 페이지</span></a>
          </div>
        </div>
      </div>
    </main>
    <!-- //main -->
    
<%@ include  file="../inc/footer.jsp" %>
