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
    
  <form id="frm_find_id" method="post">
    <h1>아이디/비밀번호 찾기</h1>
    <div class="form-floating mb-3 col-4">
      <input type="text" class="form-control" id="name" name="name" placeholder="이름">
      <label for="name">이름</label>
    </div>
    <div class="form-floating mb-3 col-4">
      <input type="text" class="form-control" id="mobile" name="mobile" placeholder="연락처">
      <label for="mobile">연락처</label>
    </div>
    <div>
      <button type="button" id="btn_find_id" class="btn btn-secondary">아이디찾기</button>
    </div>
  </form>
  
  <hr>
  
  <div class="show_id"></div>
  
</div>

<script>

	const fnFindId = ()=>{
    	$('#btn_find_id').click(()=>{
    		if($('#name').val() === '' || $('#mobile').val() === ''){
    			alert('이름과 전화번호는 필수 입력 항목입니다.');
    			return;
    		}
    		$.ajax({
    			type: 'post',
    			url: '${contextPath}/user/find.do',
    			data: $('#frm_find_id').serialize(),
    			dataType: 'json',
    			success: (resData)=>{
    				if(resData.user === ''){
    					alert('등록되지 않은 회원입니다.');
    					return;
    				} else {
    					const mask = "*".repeat(resData.user.email.split("@")[0].length - 1);
    					$('.show_id').text('아이디: ' + resData.user.email[0] + mask + resData.user.email.slice(mask.length + 1, resData.user.email.length));
    				}
    			}
    		})
    	})	
	}
	
	fnFindId();
	
</script>






<%@ include file="../layout/footer.jsp" %>