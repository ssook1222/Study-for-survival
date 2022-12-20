<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
    <style>
    	body {
	        font-family: 'IBM Plex Sans KR', sans-serif;
	        width:100%
        }
        
        #side-bar{
        	width:30%;
        	height:100%;
        	display:inline-block
        }
        
        #board-list{
        	width:65%;
        	height:100%;
        	display:inline-block
        }
        .title{
        	display:inline-block
        }
        #board-plus:hover{
        	background-color:#d2d2d2;
        }
        #pencil-edit:hover{
        	background-color:#d2d2d2;
        }

        button{
        	display:inline-block
        	padding: 0;
			border: none;
			background: none;
        }
        a{
	        color:black
	        }
    </style>
</head>
<body>
	<script type="text/javascript">
			function update_value(ths){
				var mno = ths
				$('#mno2').val(mno);
			}
	
			$(document).ready(function(){
				
			$("#updateBtn").click(function() {
				console.log($("#mname2").val()) // 일단 여기
				console.log($("#mno2").val())
				
				$.get(
						"${pageContext.request.contextPath}/update"
						, {
							mname : $("#mname2").val(),
							mno : $("#mno2").val()
						}
						, function(data, status) {
							if(data > 0) {
								$(location).attr('href', '${pageContext.request.contextPath}');
							} else {
								alert("게시판 이름 변경에 실패하였습니다.")
							}
						}//function
				);

			});//click
				
				$("#writeBtn").click(function() {
					
					if($.trim($("#mname").val())==""){ 
						alert("게시판 이름을 입력해주세요.");
						return; //수행 중지
					}
					
					$.get(
							"${pageContext.request.contextPath}/insert"
							, {
								mname : $("#mname").val(),
							}
							, function(data, status) {
								if(data > 0) {
									$(location).attr('href', '${pageContext.request.contextPath}');
								} else {
									alert("게시판 추가에 실패하였습니다.")
								}
							}//function
					);
				});//click
			}); //ready
		</script>
		<div id="side-bar" class="bg-light">
			<div class="container">
				<h1><a id="logo" style="text-decoration:none" href="${pageContext.request.contextPath}">HOME</a></h1>
				<hr>
				<h3 class="title" style="width:80%; margin-bottom:0">게시판</h3>
				<button type="button" data-toggle="modal" data-target="#exampleModal">
						<svg xmlns="http://www.w3.org/2000/svg" id="board-plus"
						width="32" height="32" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
		  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		  				<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
						</svg>
				</button>
	
				<hr>
				
				<table class="table table-hover table-borderless">
						<c:forEach var="dto" items="${text_list}">
							<tr>
								<td>
									<h5 class="title">
										<a href="${pageContext.request.contextPath}/select_all_menu/detail?mno=${dto.mno}">
											${dto.mname}
										</a>
									</h5>
									<a id="board-update" type="button" data-toggle="modal" data-target="#exampleModal1"
									onclick="
										update_value(${dto.mno})
									"
									>
										<svg xmlns="http://www.w3.org/2000/svg" id="pencil-edit"
										width="32" height="32" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
						  				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
		  								<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
										</svg>
									</a>	
								</td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</div>
		<div id="board-list" class="container">
			<h1>최신 글</h1>
					<a href="./insert/board"type="button" class="btn btn-secondary" style="display:inline-block; float: right;">
						글쓰기
					</a>
			<div style="height: 50px;"></div>
			<hr>		
			<table class="table table-hover table-borderless">
					<c:forEach var="dto" items="${board_list}">
					<td>
						<a href="${pageContext.request.contextPath}/select_all_board/detail?bno=${dto.bno}&mno=${dto.mno}">
							<h5>${dto.btitle}</h5>
						</a>
					</td>
					<tr></tr>
					</c:forEach>						
			</table>
		</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">추가할 게시판의 이름을 입력해주세요.</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <input type="text" class="form-control" id="mname" name="mname" maxlength="20" placeholder="게시판 이름을 입력하세요.">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button id="writeBtn" type="button" class="btn btn-primary">게시판 새로 생성하기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">수정할 게시판의 이름을 입력해주세요.</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <input type="text" class="form-control" id="mname2" name="mname" maxlength="20" placeholder="게시판 이름을 입력하세요.">
	      </div>
	      <div class="modal-footer">
	      	<input type="hidden" id="mno2" name="mno"></input>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button id="updateBtn" type="button" class="btn btn-primary">게시판 이름 변경하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	

</body>
</html>
