// 生成验证码
var code;
function  createCode() {
    code="";
    var codeLength = 4; //验证码长度
    var checkCode = document.getElementById("checkCode");
    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
        'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
        'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
        'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//所有候选组成验证码的字符，也可以选用中文。
    for (var i = 0; i < codeLength; i++) {
        var charnum = Math.floor(Math.random() * 52);
        code += codeChars[charnum];
    }
    if (checkCode) {
        checkCode.className = "btn-code";
        checkCode.innerHTML = code;
    }
}
function validateCode() {
//用户名验证
    var username = document.getElementById("username").value;
    if (username.length <= 0){
        alert("用户名不能为空！");
        $("#username").focus ();
        return false;
    }
//密码验证
    var password = document.getElementById("password").value;
    if (password.length <= 0){
        alert("密码不能为空！");
        $("#password").focus ();
        return false;
    }

//验证码检验
    var inputCode = document.getElementById("inputCode").value;
    if (inputCode.length <= 0) {
        var findNodes = document.getElementById("remind_3").children;
        if (findNodes.length == 0) {
            alert("验证码不能为空！");
            $("#inputCode").focus ();
        } else {
            document.getElementById("remind_3").removeChild(findNodes[0]);
            alert("验证码不能为空！");
            $("#inputCode").focus ();
        }
        return false;
    } else if (inputCode.toUpperCase() != code.toUpperCase()) {
        var findNodes2 = document.getElementById("remind_3").children;
        if (findNodes2.length > 0) {
            document.getElementById("remind_3").removeChild(findNodes2[0]);
            alert("验证码错误！");
            $("#inputCode").focus ();
        } else {
            alert("验证码错误！");
            $("#inputCode").focus ();
        }
        return false;
    } else {
        var findNodes3 = document.getElementById("remind_3").children;
        if (findNodes3.length > 0) {
            document.getElementById("remind_3").removeChild(findNodes3[0]);
        }
    }
}








