<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/js/iepng.js"></script>
    <script type="text/javascript">
       EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->    
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

    <script type="text/javascript">
        $(function () {
            // 给验证码的图片，绑定单击事件
            $("#code_img").click(function () {
                // 在事件响应的function函数中有一个this对象。这个this对象，是当前正在响应事件的dom对象
                // src属性表示验证码img标签的 图片路径。它可读，可写
                // alert(this.src);
                this.src = "${pageContext.request.contextPath}/kaptcha.jpg?d=" + new Date();
            });
            $("#btn_login").click(function () {
                var data = $("#form").serialize();
                $.ajax({
                    type: "post",
                    url: "login",
                    data: data,
                    dataType: "json", //返回数据类型
                    success: function(result){
                        if(result.code == 100){
                            window.location.href="index";
                        }else{
                            $("#myTbody").children().remove();
                            $("#myTbody").val("");
                            var td1 = $("<td width=\"40\">&nbsp;</td>");
                            var td2 = $("<td> <span style=\"color: red;\" id=\"error_msg\"></span></td>");
                            var tr = $("<tr height=\"30\"></tr>");
                            tr.append(td1).append(td2).appendTo("#myTbody");

                            $("#error_msg").text("");
                            $("#error_msg").append(result.extend.msg);
                            $("#code_img").click();
                            $("input[name='code']").val("");
                            if(result.extend.typess == "1"){
                                $("input[name='password']").val("");
                            }


                        }
                    }
                });
                return false;
            });


            $("table input").click(function () {
                $("#myTbody").children().remove();
                $("#myTbody").val("");
            });
        });
    </script>
    <style type="text/css">
        #error_msg{

            font-size: 15px;
        }
    </style>

    
<title>cVzhanshi</title>
</head>
<body>
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="Index.html"><img src="${pageContext.request.contextPath}/images/logo.png" /></a></div>
    </div>
	<div class="login">
    	<div class="log_img"><img src="${pageContext.request.contextPath}/images/l_img.png" width="611" height="425" /></div>
		<div class="log_c">
        	<form id="form" method="post">
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="55">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">登录</span>
                    <span class="fr">还没有商城账号，<a href="register" style="color:#ff4e00;" >立即注册</a></span>
                </td>
              </tr>

                <tbody id="myTbody">
                </tbody>

              <tr height="60">
                <td>用户名</td>
                <td><input type="text" name="loginname" class="l_user" /></td>
              </tr>
              <tr height="60">
                <td>密&nbsp; &nbsp; 码</td>
                <td><input type="password" name="password" class="l_pwd" /></td>
              </tr>
                <tr height="70">
                    <td>验证码</td>
                    <td>
                        <input class="l_pwd" type="text" name="code" style="width: 100px;" id="code" />
                        <img id="code_img" alt="" width="100px" height="40px" src="${pageContext.request.contextPath}/kaptcha.jpg" style="float: right;margin-right: 40px"/>
                    </td>
                </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="submit" value="登录"  id="btn_login" class="log_btn" /></td>
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
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="${pageContext.request.contextPath}/images/b_1.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_2.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_3.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_4.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_5.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_6.gif" width="98" height="33" />
    </div>    	
</div>
<!--End Footer End -->


</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
