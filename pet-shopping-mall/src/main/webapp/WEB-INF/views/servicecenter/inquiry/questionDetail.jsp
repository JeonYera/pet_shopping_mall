<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<%-- 1:1 문의 상세 조회 (예라) --%>
<section class="common-section" id="#">
	<div class="common-title">1:1 문의 상세 내역</div>
	<div class="common-container">
		<div class="common-div">
			<div class="qna-create">
				<div class="input-container">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="memberId" id="memberId"
								value="${questions.memberId}" required readonly /></td>
						</tr>
						<tr>
							<th>사진첨부</th>
							<td><%-- <c:forEach items="${questions.attachments}" var="attach" varStatus="vs">
								<button type="button" class="btn btn-outline-success btn-block"
								onclick="location.href = '${pageContext.request.contextPath}/servicecenter/inquiry/fileDownload.do?id=${attach.id}';">
									첨부파일${vs.count} - ${attach.originalFilename}
								</button>
							</c:forEach> --%></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title" readonly
								value="${questions.title}" required></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="qna-content" id="content" rows="10" cols="59" readonly style=" resize: none;">
								${questions.content}</textarea></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- 내용 섹션 -->
		<div class="content-container">
			<div class="anw-create">
				<table>
					<tr>
						<th>A</th>
						<td><textarea name="content" id="content" readonly
								style="height: 160px; resize: none;">${answers.content}</textarea></td>
						<td class="anw-regdate">
							<br/>
							<fmt:parseDate value="${answers.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate" /> 답변 등록일
							<fmt:formatDate value="${regDate}" pattern="yy/MM/dd" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="qna-create-btn">
			<form action="${pageContext.request.contextPath}/servicecenter/inquiry/questionList.do"
				class="form-inline">
			        <button class="qna-btn-reset" type="submit">목록</button>
			</form>
	  			<button type="button" onclick="QuestionDelete();" class="qna-btn-reset">삭제하기</button>
	  		<c:if test="${empty answers.content}">
				<form action="${pageContext.request.contextPath}/servicecenter/inquiry/questionUpdate.do?questionId=${questions.id}">
				    <input type="hidden" name="id" value="${questions.id}">
				    <button class="qna-btn-create" type="submit">수정하기</button>
				</form>
			</c:if>
		</div>
	</div>
</section>
<form 
	name="QuestionDeleteFrm" 
	action="${pageContext.request.contextPath}/servicecenter/inquiry/DeleteQuestion.do"
	method="POST">
	<input type="hidden" name="id" value="${questions.id}"/>
</form>
<script>
const QuestionDelete = () => {
	if(confirm("정말 삭제하시겠습니까?")) {
		document.QuestionDeleteFrm.submit();
	}
};
</script>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />