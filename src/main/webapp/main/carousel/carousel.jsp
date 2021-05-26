<%@page contentType="text/html; UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
    $(function () {
        //创建表格
        $("#bnTable").jqGrid({
            url: "${path}/carousel/queryCarousel",       //访问路径
            editurl: "${path}/carousel/change",
            datatype: "json",                           //返回值类型
            rowNum: 2,                                  //每页展示条数
            rowList: [1, 2, 4, 8, 15],                  //每页展示条数可选值
            pager: "#bnPage",                           //分页工具
            viewrecords: true,                          //是否展示总条数
            styleUI: "Bootstrap",                       //页面使用bootstrap样式
            autowidth: true,                            //宽度自适应
            height: "auto",                             //高度自适应
            colNames: ['Id', '图片', '标题', '描述', '状态', '上传时间'], //表头部分内容
            colModel: [
                {name: 'id', index: 'id', width: 55},
                {
                    name: 'imgPath', editable: true, index: 'invdate', width: 90, align: "center", edittype: "file",
                    formatter: function (cellvalue, options, rowObject) {
                        return "<img src='${path}/upload/photo/" + cellvalue + "' style='width:180px;height:80px' />";
                    }
                },
                {name: 'title', editable: true, index: 'name asc, invdate', width: 100},
                {name: 'description', editable: true, index: 'name asc, invdate', width: 100},
                {
                    name: 'status', index: 'amount', width: 80, align: "right", align: "center",
                    formatter: function (cellvalue, options, rowObject) {
                        if (cellvalue == 1) {
                            return "<button onclick='updateStatus(\"" + rowObject.id + "\",\"" + cellvalue + "\")' class='btn btn-success'>不展示</button>";
                        } else {
                            return "<button onclick='updateStatus(\"" + rowObject.id + "\",\"" + cellvalue + "\")' class='btn btn-danger'>展示</button>";
                        }
                    }
                },
                {name: 'crateTime', index: 'note', width: 150, sortable: false}
            ],
        });

        //增删改查操作
        $("#bnTable").jqGrid('navGrid', '#bnPage',
            {add: true, edit: true, del: true, addtext: "添加", edittext: "修改", deltext: "删除"},
            {
                //是否关闭修改框
                closeAfterEdit: true,
                //
                beforeShowForm: function (obj) {
                    obj.find("#imgPath").attr("disabled", true);
                }
            },
            {
                //是否关闭修改框
                closeAfterEdit: true,
                afterSubmit: function (data) {          //提交之后执行的方法
                    //文件的上传
                    $.ajaxFileUpload({
                        url: "${path}/carousel/uploadCarousel",
                        type: "post",
                        datatype: "json",
                        data: {id: data.responseText},  //获取id
                        fileElementId: "imgPath",       //需要上传的文件域的ID，即<input type="file">的ID
                        success: function () {
                            //刷新表单
                            $("#bnTable").trigger("reloadgrid");
                        }
                    });
                    return "o.o";  //必须要有返回值  返回值随便写
                }

            }
        );
    });

    function updateStatus(id, status) {
        if (status == 0) {
            $.ajax({
                url: "${path}/carousel/change",
                type: "post",
                datatype: "json",
                data: {"id": id, "status": "1", "oper": "edit"},
                success: function () {
                    //刷新表单
                    $("#bnTable").trigger("reloadGrid");
                }
            });
        } else {
            $.ajax({
                url: "${path}/carousel/change",
                type: "post",
                datatype: "json",
                data: {"id": id, "status": "0", "oper": "edit"},
                success: function () {
                    //刷新表单
                    $("#bnTable").trigger("reloadGrid");
                }
            });
        }
    }
</script>

<%--面板颜色--%>
<div class="panel panel-warning">
    <%--面板标题--%>
    <div class="panel panel-heading">
        <h2>轮播图管理</h2>
    </div>


    <!-- 标签页      标签头 -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#bnTable">轮播图管理1</a></li>
    </ul>

    <!-- 标签体  初始化表格-->
    <table id="bnTable"/>

    <%--分页工具栏--%>
    <div id="bnPage"/>

</div>
