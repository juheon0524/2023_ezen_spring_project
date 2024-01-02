<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/rentList.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div class="shareContainer">
		<div class="shareImg"
			style="background: url(/resources/image/svisual_img.png)"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">나의정보</li>
					<li><span>구독내역 조회</span></li>
					<li><span><a href="/rental/rentList">대여내역 조회</a></span></li>
					<li><span class="keyword"><a href="/return/returnList">반납현황 조회</a></span></li>
					<li><span>나만의 책장</span></li>
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">반납현황 조회</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>내서재</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>반납현황 조회</span>
					</div>
				</div>

				<div class="shareContent">
					<c:forEach var="returnrequest" items="${list}">
						<form class="listWrap">
							<div class="listImgBox">
								<c:choose>
									<c:when test="${empty returnrequest.bookimgurl}">
										<img src="/resources/image/noimage.gif" alt="인기도서">
									</c:when>
									<c:when test="${fn:contains(returnrequest.bookimgurl, 'https')}">
						            <!-- If bookimgurl contains 'https', specify a different image URL -->
						            <img src="${returnrequest.bookimgurl}" alt="인기도서">
						       		</c:when>
									<c:otherwise>
										<img src="/resources/image/${returnrequest.bookimgurl}" alt="인기도서">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="listContentBox">
								<div class="rentalInfo">
									<p><strong>도서 제목:</strong> ${returnrequest.title}</p>
					                <p><strong>대여일:</strong> ${returnrequest.rentdate}</p>
					                <p><strong>예정 반납일:</strong> ${returnrequest.plannedreturndate}</p>
					                <p><strong>반납 신청일:</strong> ${returnrequest.requestdate}</p>
					                <p><strong>실제 반납일:</strong> ${returnrequest.actualreturndate}</p>
					            </div>
							</div>
							<div class="listBtnBox">
								<%-- <input type="button" value="반납 취소" class="deleteButton" data-returnrequestid="${returnrequest.returnrequestid}"> --%>
								<c:choose>
							        <c:when test="${empty returnrequest.actualreturndate}">
							            <!-- actualreturndate이 null인 경우: 반납 신청 버튼 표시 -->
							            <input type="button" value="반납 취소" class="deleteButton" data-returnrequestid="${returnrequest.returnrequestid}">
							        </c:when>
							        <c:otherwise>
							            <!-- actualreturndate이 null이 아닌 경우: 반납 완료 버튼 표시 -->
							            <input type="button" value="반납 완료">
							        </c:otherwise>
							    </c:choose>
							</div>
						</form>
					</c:forEach>
						<!-- 페이징처리 -->
					          <div class="pull-right">
					          
								  <ul class="pagination">
								  	
								  	<c:if test="${pageMaker.prev}">
								    	<li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
								    </c:if>
								   
								    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								    	<li class="page-item  ${pageMaker.cri.pageNum == num ? "active" : ""}" >
								    		<a class="page-link" href="${num}">${num}</a>
								    	</li>
								    </c:forEach>
								  
								    <c:if test="${pageMaker.next}">
								   	 <li class="page-item"><a class="page-link" href="${pageMaker.endPage+1 }">Next</a></li>
								    </c:if>
								  </ul>
							  </div>    
					          <!-- /페이징처리 --> 
					          
					          <form id="actionForm" action="/return/returnList" method="get">
					          	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		                    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		                    	<input type="hidden" name="type" value="${pageMaker.cri.type }">
		                    	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
					          </form>  
					
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
	$(document).ready(function () {
        // 삭제 버튼 클릭 시
        $('.deleteButton').on('click', function () {
            var returnrequestid = $(this).data('returnrequestid');
            
            // AJAX 요청
            $.ajax({
                type: 'POST',
                url: '/return/returnRemove',  // 삭제를 처리할 컨트롤러의 URL
                data: { returnrequestid: returnrequestid },
                success: function (result) {
                    // 삭제 성공 시에 수행할 동작
                    alert('삭제되었습니다.');
                    // 페이지 리로드 또는 필요한 동작 수행
                    window.location.reload();
                },
                error: function (error) {
                    // 오류 발생 시에 수행할 동작
                    alert('삭제에 실패하였습니다.');
                }
            });
        });

        function adjustContainerHeight() {
            var contentHeight = $('.shareContentWrap').outerHeight();
            $('.shareContainer').css('height', contentHeight + 80 + 'px');
        }

        // 페이지 로드시 높이 조절
        adjustContainerHeight();

        // 창 크기 변경 시 높이 조절
        $(window).resize(function () {
            adjustContainerHeight();
        });
        
      //페이지 버튼 클릭 이동
		var actionForm = $("#actionForm");
		var result = '<c:out value="${result}"/>';
		var currentPageNum = actionForm.find("input[name='pageNum']").val();
	    $(".page-item a[href='" + currentPageNum + "']").addClass("active");
		$(".page-item a").on("click",function(e){
			e.preventDefault();
			
			$(".page-item a").removeClass("active");
			$(this).addClass("active");
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
 			actionForm.submit(); 
		});
        
    });
</script>
	
	

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>