<%@page contentType="text/html; UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<script charset="utf-8" src="${path}/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${path}/kindeditor/lang/zh-CN.js"></script>
<script>
    KindEditor.create('#editor_id', {
        minWidth:10,
        minheight:20,
        uploadJson: "${path}/editor/uploadPhoto",    //指定文件上传的路径
        filePostName: "img",                         //指定上传文件的名  默认是imgFile
        allowFileManager: true,                      //显示浏览远程图片的按钮
        fileManagerJson: "${path}/editor/photos",    //指定浏览远程图片的路径
        afterBlur: function () {                       //失去焦点之后执行的方法
            this.sync();                            //将kindeditor中的内容同步到表单中
        }
    });
</script>
<script>
    $(function () {
        //创建表格
        $("#atTable").jqGrid({
            url: "${path}/article/queryArticle",       //访问路径
            editurl: "${path}/article/change",
            datatype: "json",                           //返回值类型
            rowNum: 2,                                  //每页展示条数
            rowList: [1, 2, 4, 8, 15],                  //每页展示条数可选值
            pager: "#atPage",                           //分页工具
            viewrecords: true,                          //是否展示总条数
            styleUI: "Bootstrap",                       //页面使用bootstrap样式
            autowidth: true,                            //宽度自适应
            height: "auto",                             //高度自适应
            colNames: ['Id', '标题','作者', '内容',  '发表时间'], //表头部分内容
            colModel: [
                {name: 'id', index: 'id', width: 55},
                {name: 'title', index: 'title', width: 100},
                {name: 'guruName', index: 'guruName', width: 100},
                {name: 'content', index: 'content', width: 100},
                {name: 'uploadTime', index: 'uploadTime', width: 150, sortable: false}
            ]
        });
        $("#btn1").click(function () {

            //先选中一行
            var rowId = $("#atTable").jqGrid("getGridParam", "selrow");
            //判断选中行的是否为空
            if (rowId!=null) {
                // 获取数据 根据行id返回指定行的数据
                var row = $("#atTable").jqGrid("getRowData", rowId);
                //给标题的input设置内容
                $("#titles").val(row.title);
                //给作者的input设置内容
                $("#guruNames").val(row.guruName);
                //给内容的kindeditor设置内容
                KindEditor.html("#editor_id",row.content);

                //给模态框设置两个按钮
                $("#modalFooter").html("<button onclick='updateArticle(\""+rowId+"\")' class='btn btn-default'>保存</button >" +
                    "<button class='btn btn-primary' data-dismiss='modal'>关闭</button>"
                );
                //展示模态框
                $("#articleModal").modal("show");
                //给模态框设置两个按钮
            }else{
                alert("请选中一行");
            }
        });

        //点击添加文章
        $("#btn2").click(function(){

            //重置表单
            $("#articleForm")[0].reset();

            //给kindeditor设置值
            KindEditor.html("#editor_id","");

            //展示模态框
            $("#articleModal").modal("show");

            //给模态框设置两个按钮
            $("#modalFooter").html("<button onclick='addArticle()' class='btn btn-default'>保存</button >" +
                "<button class='btn btn-primary' data-dismiss='modal'>关闭</button>"
            );

        });

        $("#btn3").click(function () {
            //先选中一行
            var rowId = $("#atTable").jqGrid("getGridParam", "selrow");
            //判断选中行的是否为空
            if (rowId!=null) {
                deleteArticle(rowId);
            }else {
                alert("请选中一行");
            }
        });
    });


    //点击添加文章按钮
    function addArticle(){
        $.ajax({
            url:"${path}/article/change?oper=add",
            type:"post",
            dataType:"text",
            data:$("#articleForm").serialize(),
            success:function(){
                //关闭模态框
                $("#articleModal").modal("hide");
                //刷新表单
                $("#atTable").trigger("reloadGrid");
            }
        });

    }

    //点击修改文章按钮
    function updateArticle(id){
        $.ajax({
            url:"${path}/article/change?id="+id+"&oper=edit",
            type:"post",
            datatype:"json",
            data:$("#articleForm").serialize(),
            success:function(){
                //关闭模态框
                $("#articleModal").modal("hide");
                //刷新表单
                $("#atTable").trigger("reloadGrid");
            }
        });
    }

    //点击删除文章按钮
    function deleteArticle(id){
        $.ajax({
            url:"${path}/article/change?id="+id+"&oper=del",
            type:"post",
            datatype:"json",
            data:$("#articleForm").serialize(),
            success:function(){
                //关闭模态框
                $("#articleModal").modal("hide");
                //刷新表单
                $("#atTable").trigger("reloadGrid");
            }
        });
    }


</script>

<%--面板颜色--%>
<div class="panel panel-success">
    <%--面板标题--%>
    <div class="panel panel-heading">
        <h2>文章管理</h2>
    </div>

    <!-- 标签页      标签头 -->
    <div class="panel panel-body">
        <button id="btn1" class="btn btn-info">修改文章</button>&emsp;
        <button id="btn2" class="btn btn-warning">添加文章</button>&emsp;
        <button id="btn3" class="btn btn-danger">删除文章</button>
    </div>

    <!-- 标签体  初始化表格-->
    <table id="atTable"/>

    <%--分页工具栏--%>
    <div id="atPage"/>


    <!-- 模态框 -->
    <div class="modal fade" id="articleModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <%--模态框标题--%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">文章信息展示</h4>
                </div>
                <%--模态框的内容--%>
                <div class="modal-body">
                    <form id="articleForm" class="form-horizontal">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">标题</span>
                            <input id="titles" name="title" type="text" class="form-control"  aria-describedby="basic-addon1"/>
                        </div><br>


                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon3">作者</span>
                            <input id="guruNames" name="guruName" type="text" class="form-control" aria-describedby="basic-addon1"/>
                        </div><br>

                        <div class="input-group">
                            <%--引入输入框--%>
                            <textarea id="editor_id" name="content" style="width:97%;height:300%;"/>
                        </div>

                    </form>
                </div>
                <!--按钮-->
                <div  id="modalFooter" class="modal-footer">
                    <%--<button type="button" class="btn btn-default">保存</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>--%>
                </div>
            </div>
        </div>
    </div>
</div>
