<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>持明法州后台管理系统</title>
    <link rel="icon" href="${path}/bootstrap/img/arrow-up.png" type="image/x-icon">
    <link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.css">

    <%--引入jqgrid中主题css--%>
    <link rel="stylesheet" href="${path}/bootstrap/jqgrid/css/css/hot-sneaks/jquery-ui-1.8.16.custom.css">
    <link rel="stylesheet" href="${path}/bootstrap/jqgrid/boot/css/trirand/ui.jqgrid-bootstrap.css">
    <%--引入js文件--%>
    <script src="${path}/bootstrap/js/jquery.min.js"></script>
    <script src="${path}/bootstrap/js/bootstrap.js"></script>
    <script src="${path}/bootstrap/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script src="${path}/bootstrap/jqgrid/boot/js/trirand/jquery.jqGrid.min.js"></script>
    <script src="${path}/bootstrap/js/ajaxfileupload.js"></script>
    <style>
        img {
            width: 100%;
            height: 200px
        }
    </style>

</head>
<body>
<!--顶部导航 导航栏  导航栏默认颜色（白）     反色-->
<nav class="navbar navbar-default"><!--navbar-inverse-->
    <!--流式布局容器-->
    <div class="container-fluid">
        <!--导航栏标题行  导航条的头信息-->
        <div class="navbar-header row">
            <!--定义栅格为12-->
            <div class="col-sm-12">
                <%--设置导航条组件内的品牌图标--%>
                <span class="navbar-brand">
                        持明法州后台管理系统
                    </span>
            </div>
        </div>
        <!--导航右部（或者是其余？）信息-->
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎：<span class="text-primary">${admin.username}</span></a></li>
                <li><a href="${path}/login/login.jsp">退出登录 <span class="glyphicon glyphicon-log-out"></span></a></li>
            </ul>
        </div>
    </div>
</nav>
<!--流式布局-->
<div class="container-fluid">
    <!--栅格系统-->
    <div class="row">
        <!--左边手风琴部分-->
        <!--左边  手风琴效果-->
        <div class="col-md-2">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" align="center">
                <div class="panel panel-info">
                    <!--标头内容-->
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                               aria-expanded="true" aria-controls="collapseOne">
                                用户管理
                            </a>
                        </h4>
                    </div>
                    <!--下拉内容-->
                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li role="presentation">
                                    <button type="button" class="btn btn-info">
                                        <a href="javascript:$('#mainId').load('${path}/main/user/user.jsp')">用户信息</a>
                                    </button>
                                </li>
                                <li role="presentation">
                                    <button type="button" class="btn btn-info">
                                        <a href="javascript:$('#mainId').load('${path}/main/user/testMonth.jsp')">用户统计</a>
                                    </button>
                                </li>
                                <li role="presentation">
                                    <button type="button" class="btn btn-info">
                                        <a href="javascript:$('#mainId').load('${path}/main/user/city.jsp')">用户分布</a>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-warning">
                    <!--标头内容-->
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                轮播图管理
                            </a>
                        </h4>
                    </div>
                    <!--下拉内容-->
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <button class="btn btn-warning">
                                        <a href="javascript:$('#mainId').load('${path}/main/carousel/carousel.jsp')">轮播图</a>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-danger">
                    <!--标头内容-->
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                专辑管理
                            </a>
                        </h4>
                    </div>
                    <!--下拉内容-->
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingThree">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <button class="btn btn-danger">
                                        <a href="javascript:$('#mainId').load('${path}/main/album/album.jsp')">专辑信息</a>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-success">
                    <!--标头内容-->
                    <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                文章管理
                            </a>
                        </h4>
                    </div>
                    <!--下拉内容-->
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingFour">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <button class="btn btn-success">
                                        <a href="javascript:$('#mainId').load('${path}/main/article/article.jsp')">文章管理</a>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-info">
                    <!--标头内容-->
                    <div class="panel-heading" role="tab" id="headingFive">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                上师管理
                            </a>
                        </h4>
                    </div>
                    <!--下拉内容-->
                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingFive">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <button class="btn btn-info">
                                        <a href="javascript:$('#mainId').load('${path}/main/guru/guru.jsp')">上师信息</a>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <!--标头内容-->
                    <div class="panel-heading" role="tab" id="headingSix" style="background:#d8b2ff">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                管理员管理
                            </a>
                        </h4>
                    </div>
                    <!--下拉内容-->
                    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                        <div class="panel-body">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--右边-->
        <div class="col-md-10" id="mainId">
            <!--巨幕开始-->
            <div class="jumbotron">
                <div class="container">
                    <h3>欢迎来到持明法洲后台管理系统</h3>
                </div>
            </div>
            <!--巨幕结束-->
            <!--右边轮播图部分-->
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators 图片按钮小点 -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                </ol>

                <!-- 轮播图片组 Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="${path}/upload/photo/shouye.jpg" alt="图片不显示时显示的文字">
                        <div class="carousel-caption">
                            图片介绍
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/upload/photo/1.png" alt="图片不显示时显示的文字">
                        <div class="carousel-caption">
                            图片介绍
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/upload/photo/2.png" alt="图片不显示时显示的文字">
                        <div class="carousel-caption">
                            图片介绍
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/upload/photo/3.png" alt="图片不显示时显示的文字">
                        <div class="carousel-caption">
                            图片介绍
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/upload/photo/4.png" alt="图片不显示时显示的文字">
                        <div class="carousel-caption">
                            图片介绍
                        </div>
                    </div>
                </div>

                <!-- 上一张图片 -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <!-- 箭头样式 向左 left-->
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <!-- 下一张图片 -->
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <!-- 箭头样式 向右 right-->
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!--右边轮播图结束-->
            <!--页脚-->
            <div class="panel panel-footer" align="center">
                <div>这是一个页脚1</div>
            </div>
            <div class="well well-sm"><p align="center">这是一个页脚2</p></div>
            <!--页脚结束-->
        </div>
    </div>
    <!--栅格系统结束-->
</div>


</body>
</html>
