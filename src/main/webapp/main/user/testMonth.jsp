<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<meta charset="utf-8">
<!-- 引入 ECharts 文件 -->
<script type="text/javascript" src="${path}/Echarts-js/goEasy.js"></script>
<script src="${path}/Echarts-js/echarts.min.js"></script>
<script type="text/javascript">
    /*初始化GoEasy对象*/
    var goEasy = new GoEasy({
        host: 'hangzhou.goeasy.io', //应用所在的区域地址: 【hangzhou.goeasy.io |singapore.goeasy.io】
        appkey: "BC-c96482e7a80c44278bc50bb4081d5ea0"//替换为你的应用appkey
    });
    /*接收消息*/
    goEasy.subscribe({
        channel: "xch",//替换为您自己的channel(渠道)
        onMessage: function (massage) {
            alert("channel:" + massage.channel + " content:" + massage.content);

            var data = massage.content;
            statisticsMonth(data);
            alert("完事了");
        }
    });
    function statisticsMonth(datas) {
        // 指定图表的配置项和数据
        alert("运行了statisticsMonth方法"+datas);
        var data = JSON.parse(datas);
        alert("data.months--"+data.months);
        alert("data.boys--"+data.boys);
        alert("data.girls--"+data.girls);
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main2'));

        var option = {
            title: {
                text: '月份用户注册数量'
            },
            tooltip: {},
            legend: {
                data: ['男', '女']
            },
            xAxis: {
                data: data.months
            },
            yAxis: {},
            series: [{
                name: '男',
                type: 'bar',
                data: data.boys
            }, {
                name: '女',
                type: 'line',
                data: data.girls
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
</script>
<script>
    $("#main2").load($(function () {

        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main2'));

        $.get('${path}/user/queryStatisticsMonth', function (data) {
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '月份用户注册数量'
                },
                tooltip: {},
                legend: {
                    data: ['男', '女']
                },
                xAxis: {
                    data: data.months
                },
                yAxis: {},
                series: [{
                    name: '男',
                    type: 'bar',
                    data: data.boys
                }, {
                    name: '女',
                    type: 'line',
                    data: data.girls
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }, "json");
    }));
</script>
<script>
    /*$(function () {

        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main2'));

        $.get('/user/queryStatisticsMonth', function (data) {
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '月份用户注册数量'
                },
                tooltip: {},
                legend: {
                    data: ['男', '女']
                },
                xAxis: {
                    data: data.months
                },
                yAxis: {},
                series: [{
                    name: '男',
                    type: 'bar',
                    data: data.boys
                }, {
                    name: '女',
                    type: 'line',
                    data: data.girls
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }, "json");
    });*/
</script>

<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main2" style="width: 600px;height:400px;"></div>

