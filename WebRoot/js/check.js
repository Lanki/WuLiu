// JavaScript Document
function checkcar(){
	var carNumberRegx = /^[A-Za-z]{1}[A-Za-z_0-9]{5}$/;
	var carNumber = carNumberRegx.test(form1.numbers.value);
	console.log(carNumber);
	if(!carNumber){
		alert("请填写正确的车牌号码信息");  
	};
	
}
function checkphone(){
	var phoneNumberRegx = /^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$/;
	var phoneNumber = form1.phone.value;
	if(!phoneNumberRegx.test(phoneNumber)){
		alert("请填写正确的手机号码");  
	};
}
function checkemail(){
	var mailRegx = /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}/;
	var mail = form1.email.value;
	if(!mailRegx.test(mail)){
		alert("请填写正确的邮箱");  
	};
}