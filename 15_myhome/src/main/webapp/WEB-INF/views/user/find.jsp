<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="아이디/비밀번호 찾기" name="title"/>
</jsp:include>


<div>
    
  <form id="frm_find_id" method="post" action="${contextPath}/user/find.do">
    <h1>아이디/비밀번호 찾기</h1>
    <div>
      <label for="name">이름</label>
      <input type="text" name="name" id="name">
    </div>
    <div>
      <label for="mobile">전화번호</label>
      <input type="text" name="mobile" id="mobile">
    </div>
    <div>
      <button type="submit">아이디찾기</button>
    </div>
  </form>

</div>

<script>
	const fnFindId = ()=>{
		$('frm_find_id').submit(()=>{
		})
	}
	
</script>






<%@ include file="../layout/footer.jsp" %>