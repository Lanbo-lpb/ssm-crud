<%--
  Created by IntelliJ IDEA.
  User: ZhouXiaoyu
  Date: 2018/5/24
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>Title</title>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<%--    <script src="${APP_PATH}/static/js/jquery-1.7.2.js"></script>--%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script><%--q版本要高于1.9 否则模态框不会弹出--%>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<%--员工修改的模态框--%>
<div class="modal fade" id="empUpdateAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">


                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="请输入邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input"  value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>














<%--员工添加的模态框--%>

<%--<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button>--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">


                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="请输入姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="请输入邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender2_add_input"  value="F"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dName">

                            </select>
                        </div>
                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_model_btn">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table table-striped table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>员工名</th>
                    <th>员工性别</th>
                    <th>员工邮箱</th>
                    <th>所在部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>



                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>
        <div class="col-md-6" id="page_nav_area">





        </div>
    </div>
    <script type="text/javascript">

        var totalRecord ;

        //1,页面加载完成后，直接去发送一个ajax请求，要到分页数据
        $(function () {
           to_page(1);//去首页
        })
        function to_page(pn) {
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function (result) {//result是服务端返回给后端的数据
                    //console.log(result);
                    //1,解析并显示员工数据
                    build_emps_table(result);
                    //2，解析并显示分页信息
                    build_page_info(result)
                    //3，解析并显示分页条数据
                    build_page_nav(result)
                }
            })
        }
      function build_emps_table(result) {
          $("#emps_table tbody").empty();  //清空table表
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            //alert(item.empName);
            var empIdTd = $("<td></td>").append(item.empId).addClass("empId");
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
        // <button type="button" class="btn btn-primary btn-sm">
        //         <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 编辑
        //         </button>
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>")).addClass("glyphicon glyphicon-pencil").append("编辑");
            editBtn.attr("edit-id",item.empId)
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")).addClass("glyphicon glyphicon-trash").append("删除");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(btnTd).appendTo("#emps_table tbody");
            //append方法执行完成以后还是返回原来的元素
        })
      }
      //解析显示分页信息
      function build_page_info(result) {
            $("#page_info_area").empty();//清空
            $("#page_info_area").append("当前第 "+result.extend.pageInfo.pageNum+" 页,总共 "+result.extend.pageInfo.pages+" 页,总共有 "+result.extend.pageInfo.total+" 条记录");
            totalRecord = result.extend.pageInfo.total;
      }
      //解析显示分页条,点击分页能去下一页
      function build_page_nav(result) {
            $("#page_nav_area").empty();//清空
            var ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if (result.extend.pageInfo.hasPreviousPage==false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else {
                firstPageLi.click(function () {
                    to_page(1);
                })
                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum-1);
                })
            }



            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if (result.extend.pageInfo.hasNextPage==false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else {
                nextPageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum+1);
                })
                lastPageLi.click(function () {
                    to_page(result.extend.pageInfo.pages);
                })
            }


            ul.append(firstPageLi).append(prePageLi)
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (result.extend.pageInfo.pageNum==item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                })
                ul.append(numLi);
            })
            ul.append(nextPageLi).append(lastPageLi);
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
      }
        //清空表单样式及内容
      function reset_form(ele){
            $(ele)[0].reset();
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
      }

      $("#emp_add_model_btn").click(function () {
            reset_form("#empAddModel form");
            //$("#empAddModel form")[0].reset();

            $("#dName").empty();
            getDepts("#dName");
            $("#empAddModel").modal({
                backdrop:"static"
            })
      })
        //查出所有的部门信息，并显示在下拉列表中
        function getDepts(ele) {
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/dept",
                type: "GET",
                success:function (result) {
                    $.each(result.extend.dName,function (index,item) {
                        $(ele).append($("<option></option>").append(item.deptName).attr("value",item.deptId));
                    })
                }
            })
        }
        //校验方法
        function validate_add_form(){
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if (!regName.test(empName)){
                $("#empName_add_input").parent().removeClass("has-success has-error")
                $("#empName_add_input").parent().addClass("has-error");
                $("#empName_add_input").next("span").text("用户名必须是2-5位中文或者6-16位英文和数字的组合");
                //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合")
                return false;
            }else {
                $("#empName_add_input").parent().removeClass("has-success has-error")
                $("#empName_add_input").parent().addClass("has-success");
                $("#empName_add_input").next("span").text("");
            }
            var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
            if (!regEmail.test(email)){
                $("#email_add_input").parent().removeClass("has-success has-error")
                $("#email_add_input").parent().addClass("has-error");
                $("#email_add_input").next("span").text("邮箱格式不正确");
                //alert("邮箱格式不正确");
                return false;
            }else {
                $("#email_add_input").parent().removeClass("has-success has-error")
                $("#email_add_input").parent().addClass("has-success");
                $("#email_add_input").next("span").text("");
            }
            return true;
        }


        $("#emp_save_btn").click(function () {
            //1,前端数据校验
            if (!validate_add_form()){
                return false;
            }
            if ($(this).attr("ajax-va")=="error"){
                return false;
            }
                $.ajax({
                    url:"${APP_PATH}/emp",
                    type:"POST",
                    data: $("#empAddModel form").serialize(),
                    success:function (result) {
                        if (result.code==100){
                            $("#empAddModel").modal('hide');
                            to_page(totalRecord);
                        }else {
                            if (undefined != result.extend.errorFields.email){
                                $("#email_add_input").parent().removeClass("has-success has-error")
                                $("#email_add_input").parent().addClass("has-error");
                                $("#email_add_input").next("span").text(result.extend.errorFields.email);
                            }
                            if (undefined != result.extend.errorFields.empName){
                                $("#empName_add_input").parent().removeClass("has-success has-error")
                                $("#empName_add_input").parent().addClass("has-error");
                                $("#empName_add_input").next("span").text(result.extend.errorFields.empName);
                            }
                        }
                        //alert(result.msg)
                    }
                })
        })

        $("#empName_add_input").change(function () {
                $.ajax({
                    url:"${APP_PATH}/check",
                    data:"empName="+this.value,
                    type:"POST",
                    success:function (result) {
                        if (result.code==100){
                            $("#empName_add_input").parent().removeClass("has-success has-error")
                            $("#empName_add_input").parent().addClass("has-success");
                            $("#empName_add_input").next("span").text("用户名可用");
                            $("#emp_save_btn").attr("ajax-va","success");
                        }else {
                            $("#empName_add_input").parent().removeClass("has-success has-error")
                            $("#empName_add_input").parent().addClass("has-error");
                            $("#empName_add_input").next("span").text(result.extend.va_msg);
                            $("#emp_save_btn").attr("ajax-va","error");
                        }
                    }
                })
        })
        // 因为按钮是先被绑定后生成的，所以.click绑定不到，需要用.on来绑定
        $(document).on("click",".edit_btn",function () {
            getDepts("#empUpdateAddModel select")
            getEmp($(this).attr("edit-id"))
            $("emp_update_btn").attr("edit-id",$(this).attr("edit-id"))
            $("#empUpdateAddModel").modal({
                backdrop: "static"
            })

        })

        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/empp/"+id,
                type:"GET",
                success:function (result) {
                    var empData = result.extend.empp;
                    $("#empName_update_static").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateAddModel input[name=gender]").val([empData.gender]);
                    $("#empUpdateAddModel select").val([empData.dId]);
                }
            })
        }

        $("#emp_update_btn").click(function () {
            // var email = $("#email_add_input").val();
            // var regEmail = /^([a-z0-9\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
            // if (!regEmail.test(email)){
            //     $("#email_add_input").parent().removeClass("has-success has-error")
            //     $("#email_add_input").parent().addClass("has-error");
            //     $("#email_add_input").next("span").text("邮箱格式不正确");
            //     //alert("邮箱格式不正确");
            //     return false;
            // }else {
            //     $("#email_add_input").parent().removeClass("has-success has-error")
            //     $("#email_add_input").parent().addClass("has-success");
            //     $("#email_add_input").next("span").text("");
            // }
            $.ajax({
                url:"${APP_PATH}/emppp/"+$(this).attr("edit-id"),
                type:"POST",
                data:$("#empUpdateAddModel form").serialize()+"&_method=PUT",
                success:function (result) {
                    alert(result.msg)
                }
            })

        })
    </script>
    <div class="row"></div>
    <div class="row"></div>
</div>
</body>
</html>
