<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/admin_header.jsp" %>

<%
String status = request.getParameter("status");
if (status == null) {
    status = "live"; // 기본값
}
pageContext.setAttribute("status", status);
%>
<c:set var="activeTab" value="${status}" />
<c:choose>
   <c:when test="${activeTab == 'live'}">
      <c:set var="list" value="${liveList}" />
      <c:set var="liveStatus" value="상영중" />
      <c:set var="btnText" value="선택 영화 상영 중지" />
   </c:when>
   <c:when test="${activeTab == 'unLive'}">
      <c:set var="list" value="${unLiveList}" />
      <c:set var="liveStatus" value="상영 중지" />
      <c:set var="btnText" value="선택 영화 상영" />
   </c:when>
   <c:otherwise>
      <c:set var="list" value="${liveList}" />
      <c:set var="liveStatus" value="상영중" />
      <c:set var="btnText" value="선택 영화 상영 중지" />
   </c:otherwise>
</c:choose>
<c:set var="total" value="${list.size()}" />

<h2 class="blind">본문</h2>
<div class="as_inner inner">
   <h3>영화 목록</h3>
   <div class="as_movie-list">
      <div class="as_movie-tab">
         <ul class="as_movie-tablist">
            <li class="as_movie-tabitem ${activeTab == 'live'?'is-active':''}"><a href="?status=live">상영중인 영화</a></li>
            <li class="as_movie-tabitem ${activeTab == 'unLive'?'is-active':''}"><a href="?status=unLive">상영 중지 영화</a></li>
         </ul>
      </div>

      <div class="as_movie-tabpanel">
         <h4 class="blind">${liveStatus} 영화 목록</h4>
         <div class="search-box">
            <p class="table-summary">
               등록된 영화 총 ${total}편
               <c:if test="false">
               		<span> | 검색된 항목: 10편</span>
               </c:if>
            </p>
            
            <div class="search-group">
               <label>
                  <select id="genre" class="form-control">
                  	<option value="allGenre" selected>전체 장르</option>
                     <c:forEach var="genre" items="${genres}">
				        <option value="${genre}">${genre}</option>
				     </c:forEach>
                  </select>
               </label>

               <label>
                  <input type="text" class="form-control" id="as_sch-key" placeholder="제목/감독명을 입력해주세요.">
               </label>
               <button type="button" class="btn btn-primary">검색</button>
            </div>
         </div>
         
         <table class="table table-hover as_movie-list-table">
            <colgroup>
               <col class="col4">
               <col class="col4">
               <col class="colA">
               <col class="col16">
               <col class="col8">
               <col class="col8">
               <col class="col12">
               <col class="col8">
            </colgroup>
            <thead>
               <tr>
               	  <th scope="col"><label><input type="checkbox" value="allChk" class="all-check"></label></th>
                  <th scope="col">No</th>
                  <th scope="col">영화 제목 (원어)</th>
                  <th scope="col">국가</th>
                  <th scope="col">감독</th>
                  <th scope="col">개봉일</th>
                  <th scope="col">장르</th>
                  <th scope="col">관람 등급</th>
               </tr>
            </thead>
            <tbody>
            	<c:choose>
				   <c:when test="${list.size() > 0}">
		               <c:forEach var="dto" items="${list}" varStatus="status">
		                  <tr>
		                     <td><label><input type="checkbox" value="${dto.mv_cd}"></label></td>
		                     <td>${total-status.index}</td>
		                     <td><a href="${pageContext.request.contextPath}/movieDetail.admin?mv_cd=${dto.mv_cd}">${dto.mv_ktitle} (${dto.mv_etitle})</a></td>
		                     <td>${dto.mv_nation}</td>
		                     <td>${dto.mv_dname}</td>
		                     <td>${dto.mv_start}</td>
		                     <td>${dto.movie_genre}</td>
		                     <td>${dto.mv_cert}</td>
		                  </tr>
		               </c:forEach>
				   </c:when>
				   <c:otherwise>
			            <tr>
			               <td colspan="8" class="is-empty">
			                  <p>[영화 추가] 페이지에서 먼저 영화를 추가해주세요.</p>
			               </td>
			            </tr>
				   </c:otherwise>
            	</c:choose>
            </tbody>
         </table>

	      <div class="as_movie-add-footer">
	         <div class="pagination-container">
		         <ul class="pagination">
		            <li class="previous"><a href="#">이전</a></li>
		            <li class="active"><a href="#">1</a></li>
		            <li><a href="#">2</a></li>
		            <li><a href="#">3</a></li>
		            <li><a href="#">4</a></li>
		            <li><a href="#">5</a></li>
		            <li class="next"><a href="#">다음</a></li>
		         </ul>
	         </div>
	
	         <div class="btns">
	            <a href="movieAdd.admin" class="btn btn-danger">영화 추가 페이지로</a>
	            <button type="button" class="btn btn-primary btn-state-change">${btnText}</button>
	         </div>
	      </div>
      </div>
   </div>
</div>

<script>
$(function(){
	$(".btn-state-change").on("click", function(){
		changeMovieState();
	});
	
    // checkbox
    $(document).on("change", ".as_movie-list-table input[type='checkbox']", function () {
       let totalCheckboxes = $('.as_movie-list-table input[type="checkbox"]:not(.all-check)').length;
       let checkedCheckboxes = $('.as_movie-list-table input[type="checkbox"]:checked:not(.all-check)').length;

       // 모든 하위 체크박스가 체크되어 있으면 .all-check도 체크
       $('.as_movie-list-table .all-check').prop('checked', totalCheckboxes === checkedCheckboxes);

       updateSelectedMovies(); // 체크박스 상태가 변할 때마다 호출
    });

    // allchk
    $('.as_movie-list-table .all-check').change(function () {
       let isChecked = $(this).prop('checked');

       // .as_movie-list-table 내 하위 체크박스 상태를 .all-check 와 맞춤
       $('.as_movie-list-table input[type="checkbox"]').prop('checked', isChecked);
    });
});

// 선택한 영화들을 저장하는 함수
function updateSelectedMovies() {
   selectedMovies = [];

   $(".as_movie-list-table input[type='checkbox']:checked").each(function () {
      let value = $(this).val();

      if (value == 'allChk') {
         return;
      } else {
         selectedMovies.push(parseInt(value, 10));
      }
   });
}

// 상영 상태 변경
function changeMovieState() {
    if (selectedMovies.length > 0) {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "${pageContext.request.contextPath}/movieStatusChange.admin",
            data: JSON.stringify(selectedMovies),
            dataType: "text",
            success: function (data) {
                if (data === "success") {
                    alert("상영 상태가 변경되었습니다!");
                    location.reload();
                } else {
                    alert("상태 변경 중 오류가 발생했습니다.");
                }
            },
            error: function (xhr, status, msg) {
                alert(status + "/" + msg);
            }
        });
    } else {
        alert("상영 상태를 변경할 영화를 선택해주세요!");
    }
}
</script>

<%@ include file="../../inc/admin_footer.jsp" %>