<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BoardList</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body class="bg-light">
			<div class="container position-relative px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5 justify-content-center">
					<div class="col-md-10 col-lg-8 col-xl-7">
						<div class="site-heading">
							<br/>
							<h1>Free Board List</h1>
							<br/>
						</div>
					</div>
				</div>
			</div>
			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5 justify-content-center">
					<div class="col-md-10 col-lg-8 col-xl-7 ">
					<a id="writeBtn" type="button" href="${pageContext.request.contextPath}/file12/form"
					class = "btn btn-secondary d-block mb-4 form-round">Write post</a>
							<c:forEach var="one_dto" items="${board_list}">
								<table class="table table-hover table-borderless">
								<tr>
									<hr>
								</tr>
								<td>
									<h3>${one_dto.title}</h3>
									<b>${one_dto.bno}</b> 
									<i>th text</i> 
									<i>posted by </i> 
									<b>${one_dto.writer}</b>
									<i>on</i> <b>${one_dto.bdate}</b>	
									<br/>
									<hr>
									${one_dto.cnts}	<br/>
									<hr>
									<small class="form-text text-muted">
			  							<b>첨부파일 : </b> ${one_dto.add_file_name}	<br/>
									</small>
									<small class="form-text text-muted">
			  							<b> 첨부파일경로 :</b> file_path:${one_dto.add_file_path}	<br/>
									</small>	
								</td>		
								</table>
							</c:forEach>
						<hr class="my-4">
					</div>
				</div>
			</div>
	</body>
</html>