// JavaScript Document
function FocusItem(obj)
{
	obj.parentNode.parentNode.className = "current";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	msgBox.innerHTML = "";
	msgBox.className = "";
}

function CheckItem(obj,frm)
{
	obj.parentNode.parentNode.className = "";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	switch(obj.name) {
		case "user.username":
			if(obj.value == "") {
				msgBox.innerHTML = "用户名不能为空";
				msgBox.className = "error";
				return false;
			}
			if(frm!=null && msgBox.className!="pass" && msgBox.className!="")
				return false;
			checkUsername();
			break;
		case "user.password":
			if(obj.value == "") {
				msgBox.innerHTML = "密码不能为空";
				msgBox.className = "error";
				return false;
			}
			break;
		case "admin.adminname":
			if(obj.value == "") {
				msgBox.innerHTML = "用户名不能为空";
				msgBox.className = "error";
				return false;
			}
			break;
		case "admin.password":
			if(obj.value == "") {
				msgBox.innerHTML = "密码不能为空";
				msgBox.className = "error";
				return false;
			}
			break;
		case "newpassword":
			if(obj.value == "") {
				msgBox.innerHTML = "密码不能为空";
				msgBox.className = "error";
				return false;
			}
			break;
		case "repassword":
			if(obj.value == "") {
				msgBox.innerHTML = "确认密码不能为空";
				msgBox.className = "error";
				return false;
			} else if(obj.value != document.getElementById("password").value) {
				msgBox.innerHTML = "两次输入的密码不相同";
				msgBox.className = "error";
				return false;
			}
			break;
		case "veryCode":
			if(obj.value == "") {
				msgBox.innerHTML = "验证码不能为空";
				msgBox.className = "error";
				return false;
			}
			break;
	}
	return true;
}

function checkForm(frm)
{
	var els = frm.getElementsByTagName("input");
	for(var i=0; i<els.length; i++) {
		//if(typeof(els[i].getAttribute("onblur")) == "function") {
		if(els[i].getAttribute("onblur") == "CheckItem(this);") {
			if(!CheckItem(els[i],frm)) return false;
		}
	}
	return true;
}

function change(obj) {
	var parent = obj.parentNode;
	for(var j=0; j<5; j++)
		parent.getElementsByTagName("td")[j].className="";
	obj.className = "current";
	var content = document.getElementById("intype");
	for(var i = 0; i<5; i++) {
		if(parent.getElementsByTagName("td")[i].className!="current") {
			parent.getElementsByTagName("td")[i].style.borderBottomStyle="solid";
			content.getElementsByTagName("div")[i].style.display="none";
		}
		else
			content.getElementsByTagName("div")[i].style.display="block";
	}
	obj.style.borderBottomStyle="none";
}