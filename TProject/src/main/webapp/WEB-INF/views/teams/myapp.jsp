<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/base.css">

<style>
	#page-content {
		max-width: 900px;
	}

	.big-title {
		font-size: 28px;
		font-weight: bold;
	}
	
	.reglist-box {
		margin-top: 20px;
		padding: 0px 15px !important;
	}
	
	.reglist-wrap {
		padding: 15px 0px;	
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-bottom: 1px solid lightgray;
	}
	
	.reglist-name {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 5px;
	}
	
	.reglist-info-items {
		display: inline-flex;
	}
	.small-title {
		font-size: 14px;
		font-weight: bold;
	}
	.small-content {
		font-size: 14px;
		margin-left: 5px;
	}
	#page-nav {
		width: 100%;
		height: 50px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.reglist-button {
	
	}
	.reglist-button:not(.current-page) {
		cursor: pointer;
	}
	.reglist-button.current-page {
		font-weight: bold;
	}
	.applist-box {
		margin-top: 20px;
		padding:15px !important;
	}
	.content{
		border:1px solid lightgray;
		border-radius: 5px;
		padding:5px;
		margin:10px 0px;
	}
	.nickname:hover{
		cursor: pointer;
	}
		
</style>

<script type="text/javascript">
	
	
	
</script>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<c:import url="/header.do" />
	<div id="wrapper">
		<div id="page-title">
			받은 지원서 목록
		</div>
		<div id="page-content">
			<div class="reglist-name"><a href="details.do?teamIdx=${applist[0].teamIdx}">
				<c:if test="${applist[0].status == 0}">[모집중]</c:if>
				<c:if test="${applist[0].status == 2}">[마감]</c:if>
				${applist[0].title}</a>
			</div>
			<c:if test="${applist.size() > 0}">	
				<c:forEach var="applists" items="${applist}">
					<div class="inner-box applist-box">
						
						<div class="reglist-info-items">
							<div class="small-title">지원자 닉네임</div>
							<div class="small-content nickname" onclick="profileOpen(${applists.mIdx})">${applists.mNickname}&nbsp;&nbsp;</div>
						</div>
						<c:if test="${applists.partname != ''}">
						<div class="reglist-info-items">
							<div class="small-title">지원한 파트</div>
							<div class="small-content">${applists.partname}</div>
						</div>
						</c:if>
						
						<div class="small-title" style="margin-top:10px;">내용</div>
						<div class="content"><pre style="font-family:'맑은 고딕';">${applists.content}</pre></div>
					</div>
					
				</c:forEach>
			</c:if>
			<c:if test="${applist.size() == 0}">
				<div class="inner-box" style="height:50px; margin-top:20px;">받은 지원서가 없습니다.</div>
			</c:if>
		</div>
		
	</div>
	
	<c:import url="/footer.do" />
</body>
</html>