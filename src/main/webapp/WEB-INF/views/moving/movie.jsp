<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include  file="../inc/header.jsp" %>

    <!-- main -->
    <main id="main" class="main">
      <h2 class="blind">영화 리스트</h2>
      <div id="container" class="container">
        <div class="as_movie-list">
          <div class="tabs1 type2">
            <span class="tabs1__item is-active">일반영화</span>

            <div class="search">
              <input type="text" id="srchMovie" class="inp-mv" placeholder="영화명을 입력해주세요.">
              <button class="btn-del" style="display: none;">삭제</button>
              <button class="btn-srch">검색</button>
            </div>
          </div>

          <div class="sorting">
            <button type="button" class="is-active">예매순</button>
            <button type="button">가나다순</button>
          </div>

          <div class="movie-list slider-type1">
            <ul>
              <li>
                <div class="item">
                  <figure class="thumb">
                    <div class="thumb__img">
                      <img src="https://img.dtryx.com/poster/2023/11/2B3FEE8B-319E-4646-B95E-0D429977AC06.small.jpg" alt="서울의 봄 포스터">
                      <span class="target"><i class="age12"></i></span>
                    </div>
                    <div class="btns">
                      <a href="movieDetail.as" class="b1">영화정보</a>
                      <a href="#" class="b2">예매하기</a>
                    </div>
                  </figure>
                  <figcaption class="info">
                    <div class="subj">서울의 봄</div>
                  </figcaption>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </main>
    <!-- //main -->
    
    
<!-- <main id="main" class="main"> -->
<!--     <h2>Movie API Result</h2> -->
    
<%--     모델에서 전달받은 API 결과 출력 --%>
<%--     <%= request.getAttribute("apiResult") %> --%>
<!-- </main> -->


<%@ include  file="../inc/footer.jsp" %>
