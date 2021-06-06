<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
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
        
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>--%>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/menu.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<%--	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

<title>cVzhanshi</title>

<style type="text/css">
	#page_btn {
	   width: 50px;
	   height: 27px;
        text-align: center;
	   line-height: 42px\9;
	   overflow: hidden;
	   background: url(${pageContext.request.contextPath}/images/btn_log.gif) repeat-x center top;
	   color: #FFF;
	   font-size: 16px;
	   font-family: "Microsoft YaHei";
	   text-align: center;
	   padding: 0;
	   border: 0;
	   cursor: pointer;
	   -webkit-border-radius: 2px;
	   -moz-border-radius: 2px;
	   border-radius: 2px;
    }
    .login_out{
        text-align: right;

        padding-top: 70px;
    }



</style>


</head>
<body>  
<!--Begin Header Begin-->

<div class="m_top_bg">
    <div class="top">
        <div class="m_logo"><a href="Index.html"><img src="${pageContext.request.contextPath}/images/logo1.png" /></a></div>
        <div class="login_out">
            <h2 style="color: #ffffff">${sessionScope.user.username }&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/system/login_out" style="color: #eeeeee;font-size: 14px">退出登录</a></h2>
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
                    <li><a href="${pageContext.request.contextPath}/system/showAllClazz">商品类型总览</a></li>
                    <li><a href="#" id="add_clazz">商品类型添加</a></li>
                </ul>
            </div>

        </div>
		<div class="m_right">
            <!-- 搭建显示页面 -->
            <div class="container">
                <!-- 标题 -->
                <div class="row">
                    <div class="col-md-12">
                        <h1 style="color:#FF4E00">ALL Shop Type</h1>
                    </div>
                </div>

                <div class="col-lg-8" style="margin-bottom: 30px">
                    <div class="input-group" >
                        <input type="text" class="form-control" name="search_name" placeholder="输入要查询的类型名" style="margin-left:200px" id="search_name">
                        <span class="input-group-btn" >
                            <button class="btn btn-default" id="search_btn" type="button" style="background: #FF4E00;color: #ffffff;margin-left:200px">搜索</button>
                        </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
                <div class="col-md-4 col-md-offset-6">
                    <button class="btn btn-danger" id="clazz_delete_all_btn">删除</button>
                </div>
                <!-- 显示表格数据 -->
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover" id="clazzs_table">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="check_all"/>
                                </th>
                                <th>id</th>
                                <th>类型名</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>

                    <!-- 显示分页信息 -->
                    <div class="col-md-5" id="page_info_area"></div>
                    <!-- 分页条信息 -->
                    <div class="col-md-7" id="page_nav_area"></div>

            </div>

        </div>
    </div>



    <!-- 类型修改的模态框 -->
    <div class="modal fade" id="clazzUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="updatashop">类型修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">ClazzId</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="id_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">ClazzName</label>
                            <div class="col-sm-10">
                                <input type="text" name="cName" class="form-control" id="cName_update_input" placeholder="数码">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="clazz_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 商品添加的模态框 -->
    <div class="modal fade" id="clazzAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">类型添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">ClazzName</label>
                            <div class="col-sm-10">
                                <input type="text" name="cName" class="form-control" id="clazzName_add_input" placeholder="ClazzName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="clazz_save_btn">添加</button>
                </div>
            </div>
        </div>
    </div>

    <!--End 用户中心 End-->
    <!--Begin Footer Begin -->
    <div class="b_btm_bg b_btm_c">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="${pageContext.request.contextPath}/images/b1.png" width="62" height="62" /></td>
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
        	备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 cVzhanshi商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
            <img src="${pageContext.request.contextPath}/images/b_1.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_2.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_3.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_4.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_5.gif" width="98" height="33" /><img src="${pageContext.request.contextPath}/images/b_6.gif" width="98" height="33" />
        </div>    	
    </div>
    <!--End Footer End -->    
</div>
</body>


<script type="text/javascript">
    //总记录数(可能是搜索的)，当前页面，总商品的记录数
    var totalRecord,currentPage,totalRecordShops;

    //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
    $(function () {
        //去首页
        to_page(1,1);
    });

    //请求第pageNum数据
    function to_page(pageNum,type,search_name){
        if(type == 1){
            $.ajax({
                url:"${pageContext.request.contextPath}/clazz/clazzspage",
                data:"pageNum="+pageNum+"&pageSize=7",
                type:"GET",
                success:function(result){
                    //alert(result + "请求成功");
                    //1、解析并显示员工数据
                    build_shops_table(result);
                    // //2、解析并显示分页信息
                    build_page_info(result,type,search_name);
                    // //3、解析显示分页条数据
                    build_page_nav(result,type,search_name);
                }
            });
        }else {
            $.ajax({
                url:"${pageContext.request.contextPath}/clazz/search",
                type:"POST",
                data:"searchName="+search_name+"&pageNum="+pageNum,
                success:function(result){
                    if(result.code == 100){
                        build_shops_table(result);
                        build_page_info(result,type,search_name);
                        build_page_nav(result,type,search_name);
                    }else{
                        alert(result.extend.msg);
                    }
                }
            });
        }

    };


    //解析并显示用户数据
    function build_shops_table(result){
        //清空table表格
        $("#clazzs_table tbody").empty();
        var shops = result.extend.pageInfo.list;
        $.each(shops,function(index,item){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var ClazzIdTd = $("<td></td>").append(item.cId);
            var ClazzNameTd = $("<td></td>").append(item.cName);


            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",item.cId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",item.cId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);//var delBtn =


            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(ClazzIdTd)
                .append(ClazzNameTd)
                .append(btnTd)
                .appendTo("#clazzs_table tbody");
        });
    };

    //解析显示分页信息
    function build_page_info(result,type,search_name){
        $("#page_info_area").empty();
        var h5 = $("<h4></h4>").append("第 "+ result.extend.pageInfo.pageNum+" 页 总 " + result.extend.pageInfo.pages+" 页 总 "+
            result.extend.pageInfo.total+" 条记录 ");

        var intput = $(" <input type=\"text\" name=\"page\" id='page' size=2\">");
        var submit = $("<input type=\"submit\" size=\"4\" id=\"page_btn\" value=\"go\">");
        h5.append(intput).append(" ").append(submit);
        $("#page_info_area").append(h5);

        $("#page_btn").click(function () {
            var page = $("#page").val();
            var regPage = /^\d{0,4}$/;
            if(regPage.test(page)){
                // alert(page);
                to_page(page,type,search_name);
            }
            else{
                alert("请输入正确的页码格式");
            }
        });
        if(type == 1){
            totalRecordShops = result.extend.pageInfo.total;
        }
        currentPage = result.extend.pageInfo.pageNum;
        totalRecord = result.extend.pageInfo.total;
    };

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result,type,search_name){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1,type,search_name);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1,type,search_name);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1,type,search_name);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages,type,search_name);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item,type,search_name);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //查询搜索框
    $("#search_btn").click(function () {
        var search_name = $("#search_name").val();
        //alert(search_name);
        if(search_name == ""){
            alert("请输入要查询的类型名");
            return false;
        }

        $("#search_name").val("");

        to_page(1,2,search_name);
        return false;
    });




    //显示校验结果的提示信息
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

    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    };

    //添加时弹出模态框
    $("#add_clazz").click(function () {
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#clazzAddModal form");

        //弹出模态框
        $("#clazzAddModal").modal({
            backdrop:"static"
        });
    });



    //校验表单数据
    function validate_add_form(){
        //1、拿到要校验的数据，使用正则表达式
        var clazzname = $("#clazzName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{3,8}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(clazzname)){
            //alert("用户名可以是2-5为中文或者6-16位英文和数字的组合");
            show_validate_msg("#clazzName_add_input", "error", "类型名可以是2-5位中文或者3-8位英文和数字的组合");
            return false;
        }else{
            show_validate_msg("#clazzName_add_input", "success", "");
        };
        return true;
    }

    //校验商品名ajax是否可用
    $("#clazzName_add_input").change(function(){
        //发送ajax请求校验商品名是否可用
        var clazzname = this.value;
        $.ajax({
            url:"${pageContext.request.contextPath}/clazz/checkclazz",
            data:"clazzname="+clazzname,
            type:"POST",
            success:function(result){
                if(result.code==100){
                    show_validate_msg("#clazzName_add_input","success","类型名可以添加");
                    $("#clazz_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#clazzName_add_input","error",result.extend.va_msg);
                    $("#clazz_save_btn").attr("ajax-va","error");
                }
            }
        });
    });

    //点击保存，保存商品
    $("#clazz_save_btn").click(function () {
        //表单校验
        if(!validate_add_form()){
            return false;
        }
        //1、判断之前的ajax用户名校验是否成功。如果成功。
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        //2、发送ajax请求保存员工
        $.ajax({
            url:"${pageContext.request.contextPath}/clazz/clazz",
            type:"POST",
            data:$("#clazzAddModal form").serialize(),
            success:function(result){
                if(result.code == 100){
                    $("#clazzAddModal").modal('hide');
                    //2、来到最后一页，显示刚才保存的数据
                    //发送ajax请求显示最后一页数据即可
                    to_page(totalRecordShops,1);
                }else{
                    //保存失败
                    //显示失败信息
                    //console.log(result);
                    //有哪个字段的错误信息就显示哪个字段的；
                    if(undefined != result.extend.errorFields.cName) {
                        show_validate_msg("#clazzName_add_input", "error", result.extend.errorFields.cName);
                    }
                }
            }
        });
        return false;

    });

    //点击编辑按钮 出现模态框
    $(document).on("click",".edit_btn",function(){

        //2、查出员工信息，显示员工信息
        getClazz($(this).attr("edit-id"));


        //3、把员工的id传递给模态框的更新按钮
        $("#clazz_update_btn").attr("edit-id",$(this).attr("edit-id"));

        $("#clazzUpdateModal").modal({
            backdrop:"static"
        });
    });

    //获取更新商品信息
    function getClazz(id) {
        $.ajax({
            url:"${pageContext.request.contextPath}/clazz/clazz/"+id,
            type:"GET",
            success:function(result){
                var shop = result.extend.clazz;
                //alert(shop.cId);
                $("#id_update_static").text(clazz.cid);
                $("#cName_update_input").val(clazz.cName);
            }
        });
    }

    //点击更新，更新员工信息
    $("#clazz_update_btn").click(function(){
        //验证价格是否合法
        //1、校验邮箱信息
        var clazzname = $("#cName_update_input").val();
        var regName = /(^[a-zA-Z0-9_-]{3,8}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(clazzname)){
            show_validate_msg("#cName_update_input", "error", "类型名可以是2-5位中文或者3-8位英文和数字的组合");
            return false;
        }else{
            show_validate_msg("#cName_update_input", "success", "");
        };
        //2、发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${pageContext.request.contextPath}/clazz/clazz/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#clazzUpdateModal form").serialize(),
            success:function(result){
                //alert(result.msg);
                //1、关闭对话框
                $("#clazzUpdateModal").modal("hide");
                //2、回到本页面
                to_page(currentPage,1);
            }
        });
    });

    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var clazzname = $(this).parents("tr").find("td:eq(2)").text();
        var id = $(this).attr("del-id");
        if(confirm("确认删除【"+clazzname+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${pageContext.request.contextPath}/clazz/clazz/"+id,
                type:"DELETE",
                success:function(result){
                    //alert(result.msg);
                    //回到本页
                    to_page(currentPage,1);
                }
            });
        }
    });

    //完成全选/全不选功能
    $("#check_all").click(function(){
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //check_item
    $(document).on("click",".check_item",function(){
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //点击全部删除，就批量删除
    $("#clazz_delete_all_btn").click(function(){
        //
        var clazzNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function(){
            //this
            clazzNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            //组装员工id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        //去除empNames多余的,
        clazzNames = clazzNames.substring(0, clazzNames.length-1);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length-1);
        if(confirm("确认删除【"+clazzNames+"】吗？")){
            //发送ajax请求删除
            $.ajax({
                url:"${pageContext.request.contextPath}/clazz/clazz/"+del_idstr,
                type:"DELETE",
                success:function(result){
                    //alert(result.msg);
                    //回到当前页面
                    to_page(currentPage,1);
                }
            });
        }
    });


</script>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
