<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- 引入 ECharts 文件 -->
    <script src="${path}/Echarts-js/echarts.min.js"></script>
    <script>
        $.ajax()
        $(function () {

            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('monthMain'));

            $.get('${path}/user/queryStatisticsMonth', function (data) {
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '月份用户注册数量'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
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
        });
    </script>
</head>

<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="monthMain" style="width: 600px;height:400px;"></div>
</body>
</html>
