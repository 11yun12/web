<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<form id="boardForm" method="post" enctype="multipart/form-data">

				<!-- Page Heading/Breadcrumbs-->
				<h1>
					Board <small>insert</small>
				</h1>
				<!-- Content Row-->
				<!-- Contact Form-->
				<!-- In order to set the email address and subject line for the contact form go to the assets/mail/contact_me.php file.-->
				<div class="row">
					<div class="col-lg-8 mb-4">
						<div class="control-group form-group">
							<div class="controls">
								<label>no:</label> <input class="form-control" id="no"
									name="no" type="text" value="${paramMap.no}" disabled
									data-validation-required-message="Please enter your name." />
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>id:</label> <input class="form-control" id="id"
									name="id" type="text" value="${detail.id}" required
									data-validation-required-message="Please enter your phone number." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>title:</label> <input class="form-control" id="title"
									name="title" type="text" value="${detail.title}" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>content:</label>
								<textarea class="form-control" name="content" id="content" rows="10" cols="100"
									required
									data-validation-required-message="Please enter your message"
									maxlength="999" style="resize: none">${detail.content}</textarea>
							</div>
						</div>
						<div id="success"></div>
						<!-- For success/fail messages-->
                        <button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Go to the list</button>
						<button class="btn btn-primary" onclick="fn_insert()" type="button">submit</button>
					</div>
				</div>
			</form>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>

<script>
function fn_list(no) {
	//$('#currentPageNo').val(no);

	$('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit();
};

function fn_insert() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/insertBoard.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert('success');
			fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

}
</script>

</html>

