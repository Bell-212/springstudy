<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
	
	$(function(){
		
	})
	
	function fnSearch(){
		$('#btn_search').click(function(){
			$.ajax({
				type: 'get',
				url: '${contextPath}/shop/search.do',
				data: 'query=' + $('#btn_search').val() + '&display=' + $('#display').val() + '&sort=' + $('#sort').find('input').val(),
				dataType: 'json',
				success: function(resData){
					
				}
				
			})
		})
	} 
	
	
</script>
</head>
<body>

  <div>
    검색결과건수
    <select id="display">
      <c:forEach var="n" begin="10" end="100" step="10">
        <option>${n}</option>
      </c:forEach>
    </select>
  </div>
  <div id="sort">
    <input type="radio" id="sort_sim" name="sim" value="sim">
    <label for="sort_sim">유사도순</label>
    <input type="radio" id="sort_date" name="date" value="date">
    <label for="sort_date">날짜순</label>
    <input type="radio" id="sort_asc" name="asc" value="asc">
    <label for="sort_asc">낮은가격순</label>
    <input type="radio" id="sort_desc" name="desc" value="desc">
    <label for="sort_desc">높은가격순</label>
  </div>
  <div>
    검색어입력
    <input type="text" id="query" name="query">
    <button type="button" id="btn_search">검색</button>
  </div>
  
  <hr>
  
  <table border="1">
    <thead>
      <tr>
        <td>상품명</td>
        <td>썸네일</td>
        <td>최저가</td>
        <td>판매처</td>
      </tr>
    </thead>
    <tbody id="tbody">
    
    </tbody>
    
  </table>
  
  
</body>
</html>