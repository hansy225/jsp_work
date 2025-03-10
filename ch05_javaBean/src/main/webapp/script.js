function inputCheck() {
	const idInput = document.getElementById('id').value;
	const pwInput = document.getElementById('pw').value;
	const rePwd = document.getElementById('rePwd').value;
	const name = document.getElementById('name').value;
	const birthday = document.getElementById('birthday').value;
	const email = document.getElementById('email').value;
	
	// id
	let textEx = /^[a-z][a-z0-9][5,12]$/i;
	if(!textEx.test(idInput)) {
		alert("유효한 아이디를 입력하세요.");
		idInput.value = "";
		idInput.select();
		return false;
	}
	
	// pw
	textEx = /^[a-z0-9!@#$%^&*]{8,15}$/i;
	if(!textEx.test(pwInput)) {
		alert("유효한 비밀번호를 입력하세요.");
		pwInput.value = "";
		pwInput.focus();
		return false;
	}
	
	// pw 일치여부
	if(pwInput != rePwd) {
		alert("비밀번호가 일치하지 않습니다.");
		rePwd = "";
		pwInput.focus();
		return false;
	}
	
	// name
	textEx = /^[가-힣]{2,}$/;
	if(!textEx.test(name)) {
		alert("유효한 이름을 입력하세요");
		name = "";
		name.focus();
		return false;
	}
	
	// birthday
	textEx = /^[0-9]{,8}$/;
	if(!textEx.test(birthday)) {
		alert("8자리 생년월일을 입력하세요.");
		birthday = "";
		birthday.focus();
		return false;
	}
	
	// email
	textEx = /^\w+@[a-z]+\.[a-z]{2,3}(\.[a-z]{2})?$/;
    if (!textEx.test(email)) {
        alert('유효한 이메일을 입력해주세요.');
        email.value = '';
        email.focus();
        return false;
    }
	
	
}