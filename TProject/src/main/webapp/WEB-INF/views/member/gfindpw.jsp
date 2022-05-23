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
	#title {
		font-size: 36px;
		font-weight: bold;
		margin: 20px;
	}
	#content {
		padding: 0px 20px;
	}
	.inner-box {
		height: 320px;
		padding: 60px !important;
	}
	
	.form-row {
		margin-top: 15px;
		display: flex;
		align-items: center;
	}
	
	.form-title {
		font-size: 14px;
		font-weight: bold;
		
	}
	
	.form-input {
		height: 36px;
		padding: 0px 20px;
		border-radius: 18px;
		border: 1px solid lightgray;
		box-shadow: 0px 0px 5px rgba(0,0,0,0.2);	
		flex: 1;
	}
	
	.pwCheck-message {
		margin-top: 10px;
		font-size: 14px;
		color: #fb6544;
	}
	
	.button-wrap {
		margin-top: 30px;
		text-align: right;
	}
	
	.email-field2 {
		display: none;
	}
	
	.join-button {
		width: 120px;
		margin-left: 20px;
	}
	
	input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
		{
		-webkit-appearance: none;
		margin: 0;
	}
</style>
<script>

	var emailChecked = false;

	function chkEmail(obj) {
		emailChecked = false;
		$(obj).next().addClass("accent-button");
	}
	
	function sendEmail(obj) {
		var email = $('input[name=email]').val();
		var button = $(obj);
		$(button).attr("disabled", true);
		$(button).text("• • •");
	
		if (email == null || email == '') {
			$(button).attr("disabled", false);
			$(button).text("이메일 인증");
			return;
		}
	
		$.ajax({
			type : "post",
			url : "sendemailforfindingpw.do",
			data : "email=" + email + "&memberType=general", // 중복 체크를 일반과 호스트회원 각각 해야하므로 변수로 넣어줌
			success : function(data) {
	
				if (data == 2) {
					alert('해당 이메일로 가입한 정보가 없습니다.');
					$(button).attr("disabled", false);
					$(button).text("이메일 인증");
				} else if (data == 0) {
					$(button).attr("disabled", false);
					$(button).text("이메일 인증");
					$(button).removeClass("accent-button");
					$(".email-field2").css("display", "flex");
				}
			}
		})
	}
	
	function checkEmailKey() {
		var email = $('input[name=email]').val();
		var key = $('#email-key').val();
	
		if (key == null || key == '') {
			alert('값을 입력해 주세요.');
			return;
		}
	
		$.ajax({
			type : "post",
			url : "checkEmail.do",
			data : "email=" + email + "&regkey=" + key,
			success : function(data) {
				if (data == 0) {
					emailChecked = true;
					alert('인증이 완료되었습니다.');
					
					$("#emailForm").submit();
					
				} else if (data == 1) {
					alert('해당 이메일로 보낸 인증 키가 없습니다.\n다시 보내 주세요.');
				} else if (data == 2) {
					alert('인증 키가 일치하지 않습니다.');
				} else if (data == 3) {
					alert('인증 시간이 만료되었습니다.');
				}
			}
		})
	}

	function chkPhoneType(type, obj) {
		var input = $(obj).val();

		//focus out인 경우 
		//input type을 text로 바꾸고 '-'추가
		if (type == 'blur') {
			$(obj).prop('type', 'text');
			var phone = chkItemPhone(input);
		}

		//focus인 경우
		//input type을 number로 바꾸고 '-' 제거
		if (type == 'focus') {
			var phone = input.replace(/-/gi, '');
			$(obj).prop('type', 'number');
		}

		$(obj).val(phone);
	}

	function chkItemPhone(temp) {
		var number = temp.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 9) {
			return number;
		} else if (number.length < 10) {
			phone += number.substr(0, 2);
			phone += "-";
			phone += number.substr(2, 3);
			phone += "-";
			phone += number.substr(5);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}

		return phone;
	}
	function maxLengthCheck(object) {
		if (object.value.length > 11) {
			object.value = object.value.slice(0, 11);
		}
	}
	
</script>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

		<div id="title">
			비밀번호 찾기
		</div>
		<div id="content">
			<div class="inner-box">
				<form id="emailForm" action="findpw.do" method="post">
					<input type="hidden" name="memberType" value="${memberType}">
					<div class="form-title">회원 가입시 사용한 이메일과 휴대폰 번호를 입력하세요.</div>
					<div class="form-row join-row-content with-button email-field">
						<input class="form-input" type="email" name="email"
							onchange="chkEmail(this)" required>
						<button type="button" class="normal-button join-button email-button"
							onclick="sendEmail(this)">이메일 인증</button>
					</div>
					<div class="form-row join-row-content with-button email-field email-field2">
						<input class="form-input" id="email-key" name="regkey" type="text" placeholder="30분 안에 입력해주세요.">
						<button type="button"
							class="normal-button join-button email-button accent-button"
							onclick="checkEmailKey()">인증키 입력</button>
					</div>
					<div class="form-row join-row-content with-button email-field">
						<input type="text" class="form-input" name="tel"
								id="tel-input" value="${hlogin.tel}" autocomplete="off"
								oninput="maxLengthCheck(this)"
								onfocus="chkPhoneType('focus', this)"
								onblur="chkPhoneType('blur', this)" min="0" placeholder="숫자만 입력"
								required>
					</div>
				</form>
			</div>
		</div>
		
	
</body>
</html>