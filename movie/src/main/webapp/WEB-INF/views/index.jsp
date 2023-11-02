<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화를 검색해보세요</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>

  <div>
    <form id="frm_search">
      <select name="column" id="column">
        <option value="">선택하세요</option>
        <option value="TITLE">제목</option>
        <option value="GENRE">장르</option>
        <option value="DESCRIPTION">내용</option>
      </select>
      <input type="text" name="searchText" id="searchText">    
      <button type="button" id="btn_search">검색</button>
      <button type="button" id="btn_init">초기화</button>
    </form>
  </div>

  <hr>
  
  <div>
    <table border="1">
      <thead>
        <tr>
          <td>제목</td>
          <td>장르</td>
          <td>내용</td>
          <td>평점</td>
        </tr>
      </thead>
      <tbody id="movie_list">
      
      </tbody>
    </table>  
  </div>

  <script>
  
  	const fnMovieList = ()=>{
  		$.ajax({
  			type: 'get',
  			url: '${contextPath}/searchAllMovies',
  			dataType: 'json',
  			success: (resData)=>{
  				alert(resData.message);
  				$('#movie_list').empty();
  				$.each(resData.list, (i, movie)=>{
  					let str = '<tr>';
  					str += '<td>' + movie.title + '</td>';
  					str += '<td>' + movie.genre + '</td>';
  					str += '<td>' + movie.description + '</td>';
  					str += '<td>' + movie.star + '</td>';
  					str += '</tr>';
  					$('#movie_list').append(str);
  				})
  			}
  		})
  	}
	
  	const fnInit = ()=>{
  		$('#btn_init').click(()=>{
  			$('#column').val('');
  			$('#searchText').val('');
  			fnMovieList();
  		})
  	}
  	
  	
  	const fnMovieSearch = ()=>{
  		$('#btn_search').click(()=>{
  			$.ajax({
    			type: 'post',
    			url: '${contextPath}/searchMovie',
    			data: $('#frm_search').serialize(),
    			dataType: 'json',
    			success: (resData)=>{
    				if(resData.status === 500){
    					alert(resData.message);
    					$('#movie_list').empty();
    					let str = '<tr>';
      					str += '<td colspan="4">검색 결과가 없습니다.</td>';
      					str += '</tr>';
      					$('#movie_list').append(str);
      					return;
    				} 
      				alert(resData.message);
      				$('#movie_list').empty();
      				$.each(resData.list, (i, movie)=>{
      					let str = '<tr>';
      					str += '<td>' + movie.title + '</td>';
      					str += '<td>' + movie.genre + '</td>';
      					str += '<td>' + movie.description + '</td>';
      					str += '<td>' + movie.star + '</td>';
      					str += '</tr>';
      					$('#movie_list').append(str);
      				})
    			}
  			})
  		})
  	}
  	fnMovieList(); 
  	fnMovieSearch();
  	fnInit();
  	
  
  </script>


</body>
</html>