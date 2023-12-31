<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="${upload.uploadNo}번 게시글" name="title"/>
</jsp:include>

<div>

  <h1 style="text-align: center;">Upload 게시글</h1>

  <div>
    <form id="frm_edit" method="post" action="${contextPath}/upload/modify.do">
      <div>작성자 : ${upload.userDto.name}</div>
      <div>작성일 : ${upload.createdAt}</div>
      <div>수정일 : ${upload.modifiedAt}</div>
      <div>제목 : <input type="text" name="title" value="${upload.title}"></div>
      <div>내용</div>
      <div><textarea name="contents">${upload.contents}</textarea></div>
      <input type="hidden" name="uploadNo" value="${upload.uploadNo}">
      <c:if test="${sessionScope.user.userNo == upload.userDto.userNo}">
        <button type="submit" id="btn_modify">수정</button>
      </c:if>
    </form>
  </div>
  
  <hr>
  
  <!-- 첨부 추가 -->
  <c:if test="${sessionScope.user.userNo == upload.userDto.userNo}">
    <div class="input-group mb-3">
      <label class="input-group-text" for="files">첨부</label>
      <input type="file" name="files" class="form-control" id="files" multiple> 
    </div>
    <div>
      <input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
      <button type="button" class="btn btn-primary" id="btn_add_attach">첨부 추가하기</button>
    </div>
  </c:if>
  <!-- 첨부 목록에서 삭제 -->
  <div id="attach_list"></div>
  
  
</div>
  
<script>

	const fnAddAttach = ()=>{
		$('#btn_add_attach').click(()=>{
			// 폼을 FormData 객체로 생성한다.
			let formData = new FormData();
			// 첨부된 파일들을 FormData에 추가한다.
			let files = $('#files').prop('files');
			$.each(files, (i, file)=>{
				formData.append('files', file);  // 폼에 포함된 파라미터명은 files이다. files는 여러개의 file을 가지고 있다.
			})
			// 현재 게시글의 번호(uploadNo)를 FormData에 추가한다
			formData.append('uploadNo', '${upload.uploadNo}');
			// FormData 객체를 보내서 저장한다.
			$.ajax({
				// 요청
				type: 'post',
				url: '${contextPath}/upload/addAttach.do',
				data: formData,
				contentType: false,
				processData: false,
				// 응답
				dataType: 'json',
				success: (resData)=>{
					if(resData.attachResult){
						alert('첨부 파일이 추가되었습니다.');
						fnAttachList();
					} else {
						alert('첨부 파일이 추가되지 않았습니다.');
					}
				}
			})
		})				
	}


	const fnAttachList = ()=>{
		$.ajax({
			// 요청
			type: 'get',
			url: '${contextPath}/upload/getAttachList.do',
			data: 'uploadNo=${upload.uploadNo}',
			// 응답
			dataType: 'json',
			success: (resData) => {
				$('#attach_list').empty();
				$.each(resData.attachList, (i, attach) => {
					let str = '<div>';
					str += '<span>' + attach.originalFilename + '</span>';
					if('${sessionScope.user.userNo}' === '${upload.userDto.userNo}'){
    					str += '<span data-attach_no="' + attach.attachNo + '"><i class="fa-solid fa-x ico_remove_attach"></i></span>';
					}
					str += '</div>';
					$('#attach_list').append(str);
				})
			}
			
		})
	}

	
	const fnRemoveAttach = ()=>{
		$(document).on('click', '.ico_remove_attach', (ev)=>{
			if(!confirm('해당 첨부 파일을 삭제할까요?')){
				return;
			}
			$.ajax({
				// 요청
				type: 'post',
				url: '${contextPath}/upload/removeAttach.do',
				data: 'attachNo=' + $(ev.target).parent().data('attach_no'),
				// 응답
				dataType: 'json',
				success: (resData)=>{
					if(resData.removeResult === 1){
						alert('해당 첨부 파일이 삭제되었습니다.');
						fnAttachList();
					} else {
						alert('해당 첨부 파일이 삭제되지 않았습니다.')
					}
				}
			})
			
		})
	}
	
	const fnFileCheck = ()=>{
	    $('#files').change((ev)=>{
	      $('#file_list').empty();
	      var maxSize = 1024 * 1024 * 100;
	      var maxSizePerFile = 1024 * 1024 * 10;
	      var totalSize = 0;
	      var files = ev.target.files;
	      for(let i = 0; i < files.length; i++){
	        totalSize += files[i].size;
	        if(files[i].size > maxSizePerFile){
	          alert('각 첨부파일의 최대 크기는 10MB입니다.');
	          $(ev.target).val('');
	          $('#file_list').empty();
	          return;
	        }
	        $('#file_list').append('<div>' + files[i].name + '</div>');
	      }
	      if(totalSize > maxSize){
	        alert('전체 첨부파일의 최대 크기는 100MB입니다.');
	        $(ev.target).val('');
	        $('#file_list').empty();
	        return;
	      }
	    })
	  }
	  
	  fnFileCheck();
	
	
	
	fnAddAttach(); 
	fnAttachList();
	fnRemoveAttach(); 







  
</script>
  
<%@ include file="../layout/footer.jsp" %>