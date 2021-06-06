<%--
  Created by IntelliJ IDEA.
  User: cVzhanshi
  Date: 2021/5/16
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <!--[if IE 6]>
    <script src="/js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>--%>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/menu.js"></script>--%>

<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/select.js"></script>--%>

    <style type="text/css">
        .login_out{
            text-align: right;

            padding-top: 70px;
        }
    </style>

    <title>cVzhanshi</title>
</head>
<body>
<!--Begin Header Begin-->


<!-- 用户修改的模态框 -->
<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">个人信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登陆账号</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="loginname_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="username_update_input" placeholder="cVzhanshi">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="password_update_input" placeholder="cVzhanshi">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password1" class="form-control" id="password2_update_input" placeholder="cVzhanshi">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="gender1_update_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="gender2_update_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>


<div class="m_top_bg">
    <div class="top">
        <div class="m_logo"><a href="Index.html"><img src="${pageContext.request.contextPath}/images/logo1.png" /></a></div>
        <div class="login_out">
            <h2 style="color: #ffffff">${sessionScope.user.username }&nbsp;&nbsp;&nbsp;<a href="login_out" style="color: #eeeeee;font-size: 14px">退出登录</a></h2>
        </div>
    </div>

</div>
<!--End Header End-->
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <div class="m_left">
            <div class="left_n">管理中心</div>
            <div class="left_m">
                <div class="left_m_t t_bg1">用户管理</div>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/system/index">个人信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/system/showAllUser">所有用户总览</a></li>
                    <li><a href="#" id="edit_user">编辑本人信息</a></li>
                </ul>
            </div>

            <div class="left_m">
                <div class="left_m_t t_bg1">商品管理</div>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/system/showAllShop">商品列表</a></li>
                </ul>
            </div>
            <div class="left_m">
                <div class="left_m_t t_bg1">商品类型管理</div>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/system/showAllClazz">商品类型列表</a></li>
                </ul>
            </div>

        </div>

        <div class="m_right">
            <div class="m_des">
                <table border="0" style="width:870px; line-height:22px;" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="115"><img src="${pageContext.request.contextPath}/images/user.jpg" width="90" height="90" /></td>
                        <td>
                            <div class="m_user">${sessionScope.user.username }</div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="mem_t">账号信息</div>
            <table border="0" class="acc_tab" style="width:870px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="td_l">ID： </td>
                    <td>${sessionScope.user.id }</td>
                </tr>
                <tr>
                    <td class="td_l b_none">登录账户：</td>
                    <td>${sessionScope.user.loginname }</td>
                </tr>
                <tr>
                    <td class="td_l b_none">姓名:</td>
                    <td>${sessionScope.user.username }</td>
                </tr>
                <tr>
                    <td class="td_l">性别 :</td>
                    <td>${sessionScope.user.sex }</td>
                </tr>

            </table>


        </div>
    </div>
    <!--End 用户中心 End-->
    <!--Begin Footer Begin -->
    <div class="b_btm_bg b_btm_c">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="${pageContext.request.contextPath}//images/b1.png" width="62" height="62" /></td>
                    <td><h2>正品保障</h2>正品行货  放心购买</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="${pageContext.request.contextPath}/images/b2.png" width="62" height="62" /></td>
                    <td><h2>满38包邮</h2>满38包邮 免运费</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="${pageContext.request.contextPath}/images/b3.png" width="62" height="62" /></td>
                    <td><h2>天天低价</h2>天天低价 畅选无忧</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="${pageContext.request.contextPath}/images/b4.png" width="62" height="62" /></td>
                    <td><h2>准时送达</h2>收货时间由你做主</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="b_nav">
        <dl>
            <dt><a href="#">新手上路</a></dt>
            <dd><a href="#">售后流程</a></dd>
            <dd><a href="#">购物流程</a></dd>
            <dd><a href="#">订购方式</a></dd>
            <dd><a href="#">隐私声明</a></dd>
            <dd><a href="#">推荐分享说明</a></dd>
        </dl>
        <dl>
            <dt><a href="#">配送与支付</a></dt>
            <dd><a href="#">货到付款区域</a></dd>
            <dd><a href="#">配送支付查询</a></dd>
            <dd><a href="#">支付方式说明</a></dd>
        </dl>
        <dl>
            <dt><a href="#">会员中心</a></dt>
            <dd><a href="#">资金管理</a></dd>
            <dd><a href="#">我的收藏</a></dd>
            <dd><a href="#">我的订单</a></dd>
        </dl>
        <dl>
            <dt><a href="#">服务保证</a></dt>
            <dd><a href="#">退换货原则</a></dd>
            <dd><a href="#">售后服务保证</a></dd>
            <dd><a href="#">产品质量保证</a></dd>
        </dl>
        <dl>
            <dt><a href="#">联系我们</a></dt>
            <dd><a href="#">网站故障报告</a></dd>
            <dd><a href="#">购物咨询</a></dd>
            <dd><a href="#">投诉与建议</a></dd>
        </dl>
        <div class="b_tel_bg">
            <a href="#" class="b_sh1">新浪微博</a>
            <a href="#" class="b_sh2">腾讯微博</a>
            <p>
                服务热线：<br />
                <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="${pageContext.request.contextPath}/images/er.gif" width="118" height="118" /></div>
            <img src="${pageContext.request.contextPath}/images/ss.png" />
        </div>
    </div>
    <div class="btmbg">
        <div class="btm">
            备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
            <img src="${pageContext.request.contextPath}/images/b_1.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_2.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_3.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_4.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_5.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_6.gif" width="98" height="33" />
        </div>
    </div>
    <!--End Footer End -->
</div>


<script type="text/javascript">

    //点击修改弹出模态框
    $("#edit_user").click(function () {
        $("#loginname_update_static").text("${user.loginname}");
        $("#username_update_input").val("${user.username}");
        $("#password2_update_input").val("${user.password}");
        $("#password_update_input").val("${user.password}")
        $("#userUpdateModal input[name=sex]").val(["${user.sex}"]);
        $("#userUpdateModal").modal({
            backdrop:"static"
        });
    });

    //模态框显示校验结果的提示信息
    function show_validate_msg(ele,status,msg){
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    };

    //点击更新 保存更新内容
    $("#user_update_btn").click(function () {

        var username = $("#username_update_input").val();
        var password = $("#password_update_input").val();
        var password2 = $("#password2_update_input").val();
        var reg = /(^[a-zA-Z0-9_-]{6,16}$)/;

        if(!reg.test(username)){
            show_validate_msg("#username_update_input", "error", "用户名可以是6-16位英文和数字的组合");
            return false;
        }
        else{
            show_validate_msg("#username_update_input", "success", "");
        }
        if(!reg.test(password)){
            show_validate_msg("#password_update_input", "error", "密码可以是6-16位英文和数字的组合");
            return false;
        }else {
            show_validate_msg("#password_update_input", "success", "");
        }
        if(password != password2){
            show_validate_msg("#password2_update_input", "error", "两次输入的密码不一样");
            return false;
        }else{
            show_validate_msg("#password2_update_input", "success", "");
        }

        //2、发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${pageContext.request.contextPath}/user/user/"+"${user.id}",
            type:"PUT",
            data:$("#userUpdateModal form").serialize(),
            success:function(result){
                alert("更新成功,请重新登录");
                //1、关闭对话框
                $("#userUpdateModal").modal("hide");

                window.location.href="${pageContext.request.contextPath}/system/login_out";
            }
        });
    });

</script>


</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>

