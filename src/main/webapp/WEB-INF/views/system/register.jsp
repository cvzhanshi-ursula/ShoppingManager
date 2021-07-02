<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
  
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/menu.js"></script>
        
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select.js"></script>
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lrscroll.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/iban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/fban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/f_ban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/hban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/tban.js"></script>
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lrscroll_1.js"></script>
    
    
<title>cVzhanshi</title>
<script type="text/javascript">


    $(function () {

        // 给验证码的图片，绑定单击事件
        $("#code_img").click(function () {
            // 在事件响应的function函数中有一个this对象。这个this对象，是当前正在响应事件的dom对象
            // src属性表示验证码img标签的 图片路径。它可读，可写
            // alert(this.src);
            this.src = "${pageContext.request.contextPath}/kaptcha.jpg?d=" + new Date();
        });

        //jquery校验表单数据
        function validate_form(){
            //1、拿到要校验的数据，使用正则表达式
            var loginname = $("#loginname").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)/;
            if(!regName.test(loginname)){
                //alert("用户名可以是6-16位英文和数字的组合");
                show_validate_msg( "error", "登录账号可以是6-16位英文和数字的组合");
                return false;
            }
            var p1=$("#p1").val();
            var p2=$("#p2").val();
            if(p1!=p2){
                show_validate_msg( "error", "两次密码不相同");
                return false;
            }
            return true;
        }


        //显示校验结果的提示信息
        function show_validate_msg(status,msg){
            $("#myTbody").children().remove();
            $("#myTbody").val("");
            $("#error_msg").text("");
            if("success"==status){
                var td1 = $("<td width=\"40\">&nbsp;</td>");
                var td2 = $("<td> <span style=\"color: green;\" id=\"error_msg\"></span></td>");
                var tr = $("<tr height=\"30\"></tr>");
                tr.append(td1).append(td2).appendTo("#myTbody");
                $("#error_msg").append(msg);

            }else if("error" == status){
                var td1 = $("<td width=\"40\">&nbsp;</td>");
                var td2 = $("<td> <span style=\"color: red;\" id=\"error_msg\"></span></td>");
                var tr = $("<tr height=\"30\"></tr>");
                tr.append(td1).append(td2).appendTo("#myTbody");
                $("#error_msg").append(msg);
                $("#code_img").click();
            }
        };

        //判断用户名是否可用
        //ajax校验用户名是否可用
        $("#loginname").change(function () {
            var loginname = this.value;
            $.ajax({
                url:"checkuser",
                data:"loginname="+loginname,
                type:"POST",
                success:function(result){
                    if(result.code==100){
                        show_validate_msg("success","登录账号可用");
                        $("#btnRegister").attr("ajax-va","success");
                    }else{
                        show_validate_msg("error",result.extend.va_msg);
                        $("#btnRegister").attr("ajax-va","error");
                    }
                }
            });
        });

        //点击保存，保存员工
        $("#btnRegister").click(function() {
            //1、先对要提交给服务器的数据进行校验
            if(!validate_form()){
                return false;
            }

            //1、判断之前的ajax用户名校验是否成功。如果成功。
            if($(this).attr("ajax-va")=="error"){
                show_validate_msg( "error", "登录账号可以是6-16位英文和数字的组合");
                return false;
            }

            //2、发送ajax请求保存员工
            $.ajax({
                url:"${APP_PATH}/system/save",
                type:"POST",
                data:$("#form").serialize(),
                success:function(result){
                    //alert(result.msg);
                    if(result.code == 100){
                        window.location.href="index";
                    }else{
                        if(result.extend.typess == "5"){
                            show_validate_msg("error", result.extend.msg);
                        }
                        if(undefined != result.extend.errorFields.loginname){
                            //显示登录账户名错误信息
                            show_validate_msg("error", result.extend.errorFields.loginname);
                        }
                        if(undefined != result.extend.errorFields.password){
                            //显示密码的错误信息
                            show_validate_msg("error", result.extend.errorFields.password);
                        }
                        if(undefined != result.extend.errorFields.username){
                            //显示用户名的错误信息
                            show_validate_msg("error", result.extend.errorFields.username);

                        }

                    }
                }
            });
            return false;
        });

    });




</script>
    <style type="text/css">

    </style>
</head>
<body>  
<!--Begin Header Begin-->

<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="Index.html"><img src="${pageContext.request.contextPath}/images/logo.png" /></a></div>
    </div>
	<div class="regist">
    	<div class="log_img"><img src="${pageContext.request.contextPath}/images/l_img.png" width="611" height="425" /></div>
		<div class="reg_c">
        	<form id="form" method="post">
                <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
                    <tr height="50" valign="top">
                        <td style="width: 80px">&nbsp;</td>
                        <td >
                            <span class="fl" style="font-size:24px;">注册</span>
                            <span class="fr">已有账号，<a href="login" style="color:#ff4e00;">立即登录</a></span>
                        </td>
                    </tr>

                    <tbody id="myTbody">
                    </tbody>

                    <tr height="60">
                        <td align="right" style="width: 80px"><font color="#ff4e00" >*</font>&nbsp;登录帐号 &nbsp;</td>
                        <td><input type="text" id="loginname"  class="l_pwd" name="loginname"/></td>
                    </tr>

                  <tr height="60">
                    <td align="right"  style="width: 80px"><font color="#ff4e00">*</font>&nbsp;密&nbsp;&nbsp;码 &nbsp;</td>
                    <td><input type="password"  class="l_pwd" name="password" id="p1"/></td>
                  </tr>
                  <tr height="60">
                    <td align="right"  style="width: 80px"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                    <td><input type="password"  class="l_pwd" name="password1" id="p2" /></td>
                  </tr>
                  <tr height="60">
                    <td align="right"  style="width: 80px"><font color="#ff4e00">*</font>&nbsp;用&nbsp;户&nbsp;名 &nbsp;</td>
                    <td><input type="text"  class="l_email" name="username" id="username"></td>
                  </tr>

                <tr height="60">
                    <td align="right"  style="width: 80px"><font color="#ff4e00">*</font>&nbsp;性&nbsp;&nbsp;别 &nbsp;</td>
                    <td>
                    <input type="radio" value="男" name="sex" checked="checked"/>男
                    <input type="radio" value="女" name="sex" />女

                    </td>
                  </tr>
                    <tr height="60">
                        <td align="right"  style="width: 80px"><font color="#ff4e00">*</font>&nbsp;验&nbsp;证&nbsp;码 &nbsp;</td>
                        <td>
                            <input class="l_pwd" type="text" name="code" style="width: 100px;" id="code" />
                            <img id="code_img" alt="" width="100px" height="40px" src="${pageContext.request.contextPath}/kaptcha.jpg" style="float: right;margin-right: 60px"/>
                        </td>
                    </tr>
                  <tr height="60">
                    <td>&nbsp;</td>

                    <td>
                        <input type="submit" value="立即注册(自动登录)" class="log_btn" id="btnRegister" />
                    </td>
                 </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End--> 
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 cVzhanshi商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="${pageContext.request.contextPath}/images/b_1.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_2.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_3.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_4.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_5.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_6.gif" width="98" height="33" />
    </div>    	
</div>
<!--End Footer End -->    

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
