<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="로그인" name="title"/>
</jsp:include>


  
    <form method="post" action="${contextPath}/user/login.do" >
      <div class="row justify-content-center">
        <label class="col-sm-1 col-form-label text-center" for="email">아이디</label>
        <input type="text" name="email" id="email" class="col-sm-4" placeholder="admin@gmail.com">
      </div>
      <div class="row justify-content-center" style="margin-top: 10px;">
        <label class="col-sm-1 col-form-label" for="pw">비밀번호</label>
        <input type="password" name="pw" id="pw" class="col-sm-4" placeholder="●●●●●●">
      </div>
      <div class="text-center">
        <input type="hidden" name="referer" value="${referer}">
        <button type="submit" class="btn btn-outline-primary col-2" style="margin-top: 25px;">로그인</button>
      </div>
    </form>
    <div class="row justify-content-center">
      <ul class="text-center" style="margin-top: 5px;">
        <li><a href="${contextPath}">자동로그인</a>
        <li><a href="${contextPath}/user/find.form">아이디/비밀번호 찾기</a>
      </ul>
      <hr>
      <div >
        <a href="${naverLoginURL}" >
          <img src="${contextPath}/resources/image/btnG_아이콘사각.png" width="100px" >
        </a>
      </div>
    </div>
    
  
  

<%@ include file="../layout/footer.jsp" %>