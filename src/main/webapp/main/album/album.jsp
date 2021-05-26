<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
    $(function () {
        //创建表格
        $("#abTable").jqGrid({
            url: "${path}/album/queryAlbum",
            editurl: "${path}/album/change",
            datatype: "json",
            rowNum: 2,
            rowList: [1, 2, 4, 8, 15],
            pager: '#abPage',
            viewrecords: true,
            styleUI: "Bootstrap",
            multiselect: false,
            autowidth: true,
            height: "auto",
            subGrid: true,
            colNames: ['Id', '名称', "封面", "热度", '作者', '诵经人', '集数', '内容', '发布日期'],
            colModel: [
                {name: 'id', index: 'id', width: 55},
                {name: 'title', index: 'title', editable: true, width: 90},
                {
                    name: "coverImg", index: "coverImg", editable: true, width: 90, align: "center", edittype: "file",
                    formatter: function (cellvalue, options, rowObject) {
                        return "<img src='${path}/upload/photo/" + cellvalue + "' style='width:180px;height:80px' />";
                    }
                },
                {name: 'score', index: 'score', width: 100},
                {name: 'author', index: 'author', editable: true, width: 100},
                {name: 'broadcast', index: 'broadcast', editable: true, width: 100},
                {name: 'count', index: 'count', width: 80, align: "right"},
                {name: 'content', index: 'content', editable: true, width: 80, align: "right"},
                {name: 'pubDate', index: 'pubDate', width: 150, sortable: false}
            ],
            subGridRowExpanded: function (subgrid_id, row_id) {
                addSubGrid(subgrid_id, row_id);
            },
        });
        jQuery("#abTable").jqGrid('navGrid', '#abPage',
            {add: true, edit: true, del: true},
            {
                //是否关闭修改框
                closeAfterEdit: true,
                //
                beforeShowForm: function (obj) {
                    obj.find("#coverImg").attr("disabled", true);
                }
            },
            {
                //是否关闭修改框
                closeAfterEdit: true,
                afterSubmit: function (data) {          //提交之后执行的方法

                    //文件的上传
                    $.ajaxFileUpload({
                        url: "${path}/album/uploadAlbum",
                        type: "post",
                        datatype: "json",
                        data: {id: data.responseText},  //获取id
                        fileElementId: "coverImg",       //需要上传的文件域的ID，即<input type="file">的ID
                        success: function () {
                            //刷新表单
                            $("#abTable").trigger("reloadgrid");
                        }
                    });
                    return "o.o";  //必须要有返回值  返回值随便写
                }
            }
        );
    });


    //子表格
    function addSubGrid(subgridId, rowId) {

        var subgridTableId = subgridId + "Table";
        var pagerId = subgridId + "Page";

        //创建子表格的 table 和分页工具栏
        $("#" + subgridId).html("" +
            "<table id='" + subgridTableId + "' />" +
            "<div id='" + pagerId + "'/>"
        );
        //子表格
        $("#" + subgridTableId).jqGrid({
            url: "${path}/chapter/queryChapter?albumId=" + rowId,
            editurl: "${path}/chapter/change?albumId=" + rowId,
            datatype: "json",
            rowNum: 2,
            rowList: [1, 2, 4, 8, 15],
            pager: "#" + pagerId,
            styleUI: "Bootstrap",
            height: "auto",
            autowidth: true,
            viewrecords: true,
            colNames: ['Id', '名字', '音频', '大小', '时长', '日期', "操作"],
            colModel: [
                {name: "id", index: "id", width: 80, key: true},
                {name: "title", index: "title", editable: true, width: 130},
                {
                    name: "src", index: "src", editable: true, width:160, edittype: "file",
                    formatter: function (cellvalue, options, rowObject) {
                        return "<audio src='${path}/upload/chapter/" + cellvalue + "' controls/>";
                    }
                },
                {name: "size", index: "size", width: 70, align: "right"},
                {name: "duration", index: "duration", width: 70, align: "right"},
                {
                    name: "uploadTime", index: "uploadTime", width: 70, align: "right", sortable: false/*,
                    formatter:'date',
                    formatoptions:{newformat:'Y-m-d'}*/
                },
                {
                    name: "src", align: "src",
                    formatter: function (cellvalue, options, rowObject) {
                        return "<a href='#' onclick='audioDownload(\"" + cellvalue + "\")' ><span class='glyphicon glyphicon-download' /></a>&nbsp;&emsp;&emsp;" +
                            "<a href='${path}/upload/chapter/\""+cellvalue+"\"'><span class='glyphicon glyphicon-play-circle' /></a>";
                    }
                }
            ]
        });
        //子表格的正删改查操作
        $("#" + subgridTableId).jqGrid('navGrid', "#" + pagerId,
            {edit: true, add: true, del: true},
            {
                //是否关闭修改框
                closeAfterEdit: true,
                //
                beforeShowForm: function (obj) {
                    obj.find("#src").attr("disabled", true);
                }
            },
            {
                //是否关闭修改框
                closeAfterEdit: true,
                afterSubmit: function (data) {          //提交之后执行的方法

                    //文件的上传
                    $.ajaxFileUpload({
                        url: "${path}/chapter/uploadChapter",
                        type: "post",
                        datatype: "json",
                        data: {id: data.responseText},  //获取id
                        fileElementId: "src",       //需要上传的文件域的ID，即<input type="file">的ID
                        success: function () {
                            //刷新表单
                            $("#" + subgridTableId).trigger("reloadgrid");
                        }
                    });
                    return "o.o";  //必须要有返回值  返回值随便写
                }
            }
        );
    }

    //下载
    function audioDownload(audioName) {
        location.href = "${path}/chapter/downloadOneChapter?audioName=" + audioName;
    }
    /*//在线播放
    function audioPlayer(audioName) {
        //展示模态框
        $("#AudioModal").modal("show");
        //给音频标签设置值
        $("#myAudio").attr("src", "/upload/chapter/" + audioName);
    }*/
</script>


<%--面板颜色--%>
<div class="panel panel-danger">
    <%--面板标题--%>
    <div class="panel panel-heading">
        <h2>专辑管理</h2>
    </div>


    <!-- 标签页      标签头 -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#">专辑管理1</a></li>
    </ul>

    <!-- 标签体  初始化表格-->
    <table id="abTable"/>

    <%--分页工具栏--%>
    <div id="abPage"/>

    <%--播放的模态框--%>
    <div id="AudioModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">

            <audio id="myAudio" src="" controls/>
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
