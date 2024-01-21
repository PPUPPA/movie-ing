<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include  file="../../inc/header.jsp" %>

    <!-- main -->
    <main id="main" class="main">
      <h2 class="blind">영화 상세 정보</h2>
      <div id="container" class="container is-fullwidth">
        <!-- as_movie-detail -->
        <div class="as_movie-detail">
          <div class="as_movie-detail__summary">
            <div class="inner">
              <div class="as_movie-detail__info">
                <i class="age12"></i>
                <h3 class="as_movie-detail__title">서울의 봄</h3>
                <h4 class="as_movie-detail__release">12.12: THE DAY</h4>
                <div class="etc">
                  <span>12세이상관람가</span>
                  <span>2023.11.22</span>
                  <span>드라마</span>
                  <span>141분</span>
                </div>
              </div>

              <div class="btns">
                <a href="#" class="btn-type0">
                  예매하기
                </a>
              </div>

              <div class="poster">
                <img src="https://img.dtryx.com/poster/2023/11/2B3FEE8B-319E-4646-B95E-0D429977AC06.small.jpg"
                  onerror="this.src='/resources/img/common/no-poster.png';">
              </div>
            </div>
          </div>

          <div class="as_movie-detail__contents">
            <div class="inner">
              <div class="as_movie-detail__item">
                <div class="col2">
                  <div class="col">
                    <div class="as_movie-detail__name">줄거리</div>
                    <div class="txt">
                      <span>1979년 12월 12일 수도 서울에서 일어난 신군부 세력의 반란을 막기 위한 일촉즉발의 9시간을 그린 영화</span>
                    </div>
                  </div>
                  <div class="col">
                    <div class="as_movie-detail__name">배우/제작진</div>
                    <div class="txt">
                      <dl>
                        <dt>감독</dt>
                        <dd>김성수</dd>
                      </dl>
                      <dl>
                        <dt>배우</dt>
                        <dd>황정민 | 정우성 | 이성민 | 박해준 | 김성균</dd>
                      </dl>
                      <dl>
                        <dt>배급사</dt>
                        <dd>메가박스중앙(주)플러스엠</dd>
                      </dl>
                    </div>
                  </div>
                </div>
              </div>

              <div class="as_movie-detail__item">
                <div class="as_movie-detail__name">스틸컷</div>
                <div id="stillcut" class="carousel slide" data-ride="carousel">
                  <!-- Wrapper for slides -->
                  <div class="carousel-inner">
                    <div class="item active">
                      <img src="https://img.dtryx.com/poster/2023/10/7BEB3BF3-16BD-47C5-A95E-ED3840C296D8.Large.jpg" alt="">
                    </div>

                    <div class="item">
                      <img src="https://img.dtryx.com/poster/2023/10/BE19D247-73A6-4BC3-9701-8D99FB1C7A0C.Large.jpg" alt="">
                    </div>

                    <div class="item">
                      <img src="https://img.dtryx.com/poster/2023/10/365476DB-C459-410C-9FA9-C19259390A81.Large.jpg" alt="">
                    </div>
                  </div>

                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#stillcut" data-slide-to="0" class="active"></li>
                    <li data-target="#stillcut" data-slide-to="1"></li>
                    <li data-target="#stillcut" data-slide-to="2"></li>
                  </ol>

                  <!-- Left and right controls -->
                  <a class="left carousel-control" href="#stillcut" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">이전</span>
                  </a>
                  <a class="right carousel-control" href="#stillcut" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">다음</span>
                  </a>
                </div>
              </div>
              <!-- // 스틸컷 -->

              <div class="as_movie-detail__item">
                <div class="as_movie-detail__name">예고편</div>

                <div id="trailer" class="carousel slide" data-ride="carousel">
                  <!-- Wrapper for slides -->
                  <div class="carousel-inner">
                    <div class="item active">
                      <video controls>
                        <source src="https://img.dtryx.com/video/2023/11/B7881372-76DE-40EA-A79D-C38937F6AC36.mp4" type="video/mp4" />
                      </video>
                    </div>
                  </div>
                </div>
              </div>
              <!-- // 예고편 -->
            </div>
          </div>
        </div>
      </div>
      <!-- // as_movie-detail -->
    </main>
    <!-- //main -->

<%@ include  file="../../inc/footer.jsp" %>
