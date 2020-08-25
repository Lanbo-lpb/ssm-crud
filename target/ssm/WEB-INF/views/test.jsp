<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/21 0021
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap 模板</title>
    <!-- 避免中文乱码 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<h1>Hello, world!</h1>
<div class="jumbotron text-center">
    <h1>我的第一个 Bootstrap 页面</h1>
    <p>重置浏览器大小查看效果!</p>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <h3>第一列</h3>
            <p>菜鸟教程</p>
            <p>学的不仅是技术，更是梦想！！！</p>
        </div>
        <div class="col-sm-4">
            <h3>第二列</h3>
            <p>菜鸟教程..</p>
            <p>学的不仅是技术，更是梦想！！！</p>
        </div>
        <div class="col-sm-4">
            <h3>第三列</h3>
            <p>菜鸟教程..</p>
            <p>学的不仅是技术，更是梦想！！！</p>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- 【本地】包括所有已编译的插件 -->
<!--<script src="js/bootstrap.min.js"></script>-->
<!-- 【远程】直接实用远程的bootstrap -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>