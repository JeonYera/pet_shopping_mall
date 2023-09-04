<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="common-section">
	<!-- 컨테이너 -->
	<div class="common-container">
		<section class="product-board">
			<!-- 게시판 이름 -->
	        <div class="board-title">
		        <span>
		        ${productCategory.categoryName} 
		        </span>
	        </div>
		</section>
		
		<!-- 정렬 선택란 -->
		<div class="product-sort">
			<ul class="nav">
				<li>
					<a href="#" class="font" onclick="setSortOption('신상품')">신상품</a>
				</li>
				<li>
					<a href="#" class="font" onclick="setSortOption('낮은가격')">낮은가격</a>
				</li>
				<li>
					<a href="#" class="font" onclick="setSortOption('높은가격')">높은가격</a>
				</li>
				<li>
					<a href="#" class="font" onclick="setSortOption('별점높은순')">별점높은순</a>
				</li>
				<li>
					<a href="#" class="font" onclick="setSortOption('리뷰많은순')">리뷰많은순</a>
				</li>
			</ul>
		</div>
		<form:form id="alignFrm" name="alignFrm" method="get" action="${pageContext.request.contextPath}/product/productList.do">
		    <input type="hidden" name="id" value="${productCategory.categoryId}"/>
		    <input type="hidden" name="align" id="align" value=""/>
		</form:form>
		<!-- 상품사진 갤러리 -->
		<div class="product-gallery">
			<ul class="gallery">
			<c:if test="${empty alignProductInfos}">
			<c:forEach items="${productInfos}" var="productInfo" varStatus="vs">
				<div class="product-card">
                    <a href="${pageContext.request.contextPath}/product/productDetail.do?productId=${productInfo.product.productId}">
					<figure class="product-thumbnail">
						<img alt="썸네일이미지" src="${pageContext.request.contextPath}/resources/upload/product/${productInfo.attachments[0].imageRenamedFilename}">
					</figure>
					<div class="product-desc">
						<p class="product-name">${productInfo.product.productName}</p>
						<p class="product-price"><fmt:formatNumber value="${productInfo.product.productPrice}" pattern="#,###" /> 원</p>
						<span class="review-star"><img src="${pageContext.request.contextPath}/resources/images/상품/star.png" alt="별점" >
						<c:if test="${productInfo.productReviewStarAvg.reviewStarRate == null}">
							<span>0.0</span>
						</c:if>
						<c:if test="${productInfo.productReviewStarAvg.reviewStarRate != 0}" >
							<span>${productInfo.productReviewStarAvg.reviewStarRate}</span>
						</c:if>
						</span>
						
						<span> &nbsp;|&nbsp; </span>
						<span class="review-cnt">후기 ${productInfo.reviewCnt}건</span>
					</div>
					</a>
				</div>
			</c:forEach>
			</c:if>
			<c:if test="${not empty alignProductInfos}">
				<c:forEach items="${alignProductInfos}" var="productInfo" varStatus="vs">
				<div class="product-card">
                    <a href="${pageContext.request.contextPath}/product/productDetail.do?productId=${productInfo.productId}">
					<figure class="product-thumbnail">
						<img alt="썸네일이미지" src="${pageContext.request.contextPath}/resources/upload/product/${productInfo.thumbnail}">
					</figure>
					<div class="product-desc">
						<p class="product-name">${productInfo.productName}</p>
						<p class="product-price"><fmt:formatNumber value="${productInfo.productPrice}" pattern="#,###" /> 원</p>
						<span class="review-star"><img src="${pageContext.request.contextPath}/resources/images/상품/star.png" alt="별점" >
							<span>${productInfo.reviewStarRate}</span>
						</span>
						<span> &nbsp;|&nbsp; </span>
						<span class="review-cnt">후기 ${productInfo.reviewCnt}건</span>
					</div>
					</a>
				</div>
			</c:forEach>
			</c:if>
			</ul><!-- gallery -->
			
			<!-- 페이징바 -->
			<nav class="product-nav" aria-label="...">
			  	<ul class="pagination-product pagination-sm">
				    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
				        <li class="page-item ${page == pageNumber ? 'active' : ''}">
				            <a class="page-link" href="${pageContext.request.contextPath}/product/productList.do?id=${productCategory.categoryId}&page=${pageNumber}">
			                    <span class="page-number">${pageNumber}</span>
			                </a>
				        </li>
				    </c:forEach>
				</ul>
			</nav>
		</div><!-- product-gallery -->
	</div><!-- common-container -->
</div><!-- common-section -->
<script>
function setSortOption(sortOption) {
    document.getElementById('align').value = sortOption;
    console.log(sortOption);
    document.getElementById('alignFrm').submit();
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>