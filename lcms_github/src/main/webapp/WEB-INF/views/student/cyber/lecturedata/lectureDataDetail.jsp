<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form method="post" id="deleteForm" method="post" action=""  enctype="multipart/form-data">
	<input type="hidden" name="lecannNo" id="lecDatano" value="${data.lecDatano }">
	<input type="hidden" name="lecCode" id="lecCode" value="${data.lecCode }">
	<div style="width: 100%; background-color: #FFFFFF;">
		<div style="margin-left: 10%; width: 80%;">
			<h2>${contentTitle}</h2>
		</div>
		<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
		<div style="margin-left: 10%; width: 80%; background-color: #f0f0f0;">
			<p style="overflow-x: auto; white-space: pre-wrap;">
				<br> 자료실에 등록되는 자료는 모두 지식재산권에 법적효력을 가지고 있음을 고지합니다. <br>
			</p>
		</div>
		<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
		<div style="margin-left: 10%; width: 80%; background-color: #FFFFFF;">
			<table style="width: 100%; border-collapse: collapse;">
				<tr>
					<td
						style="border-top: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
						for="validationSample03">제목</label></td>
					<td
						style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">${data.lecDataname}</td>
				</tr>
				<tr>
					<td
						style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
						for="validationSample03">작성자</label></td>
					<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${data.memName}</td>
				</tr>
				<tr>
					<td
						style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
						for="validationSample03">작성일</label></td>
					<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${data.lecDate}</td>
				</tr>
				<tr>
					<td
						style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label
						for="validationSample03">첨부파일</label></td>
					<td colspan="2" style="border-bottom: 1px solid #ddd;">
					<c:forEach items="${data.fileList}" var="file">
							<a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj"> ${file.fileNm }
							</a>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td
						style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label
						class="form-label">내용</label></td>
					<td style="margin-top: 5px; border-bottom: 1px solid #ddd;">${data.lecDatacontent}</td>
				</tr>

			</table>
		</div>
		<div style="display: flex; justify-content: flex-end; margin-top: 10px; margin-right: 10%;">
			<button id="listBtn" class="btn btn-secondary" style="margin-right: 5px;" type="button">목록</button>
		</div>
	</div>
</form>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	document.getElementById("listBtn").addEventListener("click",function() {
		window.location.href = `<c:url value="/student/cyber/${data.lecCode}/lectureDataList"/>`;
	});

	var cPath = "${pageContext.request.contextPath}";

	function fn_downloadFile(fileNo) {
		let hiddenA = document.createElement("a");
		hiddenA.href = cPath + "/download/single?fileNo=" + fileNo;
		hiddenA.click();
		hiddenA.remove();
	}

	$(document).on("click", ".fileObj", function(event) {
		var clickedElement = $(event.currentTarget);
		var gfNo = clickedElement.data("gfNo");
		var fileNo = clickedElement.data("fileNo");
		fn_downloadFile(fileNo);
	});
</script>
