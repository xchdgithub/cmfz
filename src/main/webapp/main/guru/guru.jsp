<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<script>
    $(function () {
        //创建表格
        $("#guruTable").jqGrid({
            url: "${path}/guru/queryGuru",       //访问路径
            editurl: "${path}/guru/change",
            datatype: "json",                           //返回值类型
            rowNum: 2,                                  //每页展示条数
            rowList: [1, 2, 4, 8, 15],                  //每页展示条数可选值
            pager: "#guruPage",                           //分页工具
            viewrecords: true,                          //是否展示总条数
            styleUI: "Bootstrap",                       //页面使用bootstrap样式
            autowidth: true,                            //宽度自适应
            height: "auto",                             //高度自适应
            colNames: ['Id', '头像', '名字', '昵称', '密码', '状态','注册时间'], //表头部分内容
            colModel: [
                {name: 'id', index: 'id', width: 55},
                {
                    name: 'picImg', index: 'picImg', width: 90, align: "center", edittype: "file",
                    formatter: function (cellvalue, options, rowObject) {
                        return "<img src='${path}/upload/photo/" + cellvalue + "' style='width:180px;height:80px' />";
                    }
                },
                {name: 'name', index: 'name', width: 100},
                {name: 'username', index: 'username', width: 100},
                {name: 'password',  index: 'password', width: 100},
                {
                    name: 'status', index: 'status', width: 80,align: "center",
                    formatter: function (cellvalue, options, rowObject) {
                        if (cellvalue == 1) {
                            return "<button onclick='updateStatus(\"" + rowObject.id + "\",\"" + cellvalue + "\")' class='btn btn-success'>不展示</button>";
                        } else {
                            return "<button onclick='updateStatus(\"" + rowObject.id + "\",\"" + cellvalue + "\")' class='btn btn-danger'>展示</button>";
                        }
                    }
                },
                {name: 'regTime', index: 'regTime', width: 150, sortable: false}
            ],
        });
    });

    function updateStatus(id, status) {
        if (status == 0) {
            $.ajax({
                url: "${path}/guru/change",
                type: "post",
                datatype: "json",
                data: {"id": id, "status": "1", "oper": "edit"},
                success: function () {
                    //刷新表单
                    $("#guruTable").trigger("reloadGrid");
                }
            });
        } else {
            $.ajax({
                url: "${path}/guru/change",
                type: "post",
                datatype: "json",
                data: {"id": id, "status": "0", "oper": "edit"},
                success: function () {
                    //刷新表单
                    $("#guruTable").trigger("reloadGrid");
                }
            });
        }
    }
</script>


<%--面板颜色--%>
<div class="panel panel-danger">
    <%--面板标题--%>
    <div class="panel panel-heading">
        <h2>上师管理</h2>
    </div>


    <!-- 标签页      标签头 -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#">上师信息管理1</a></li>
    </ul>

    <!-- 标签体  初始化表格-->
    <table id="guruTable"/>

    <%--分页工具栏--%>
    <div id="guruPage"/>

</div>

