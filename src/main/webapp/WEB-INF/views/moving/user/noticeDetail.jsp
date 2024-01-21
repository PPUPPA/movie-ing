<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include  file="../../inc/header.jsp" %>

    <!-- main -->
    <main id="main" class="main">
      <h2 class="blind">공지사항 상세</h2>
      <div id="container" class="container">
        <div class="as_board">
          <div class="as_board__view">
            <div class="as_board__head">
              <h4 class="as_board__title">게시글 제목</h4>
              <div class="as_board__hit">
                <span>조회 조회수</span>
                <span>YYYY-MM-DD</span>
              </div>
            </div>
            <div class="as_board__content">
              ~게시판 내용 영역~
            </div>
          </div>

          <div class="as_board__footer">
            <a href="notice.as" class="btn-board-list">목록</a>
          </div>
        </div>
      </div>
    </main>
    <!-- //main -->
    
<%@ include  file="../../inc/footer.jsp" %>
