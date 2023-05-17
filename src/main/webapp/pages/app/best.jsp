<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>
<div class="main-container content-expand">
            <div class="main_content_inner">

<style>
.albox{overflow:hidden;}
.albox:hover{border:0px solid #c00;background:#fff;cursor:pointer;}
.albox img{ transition: all 0.6s;  }
.albox img:hover{ transform: scale(1.4);  }
</style>
    <!--content start-->


<section class="blog-list" style="padding-top:50px">
    <div class="container">
        <div class="row">
        
        

<style>
.tags-widget ul {
    margin-left: 15px;
}
.tags-widget ul {
    margin-top: 0px;
    width: 92%;
    padding-left: 0px;
}
.tags-widget ul, .tags-widget h2 {
    margin-bottom: 0px;
    float: left;
    vertical-align: top;
}.tags-widget ul.tags-list li {
    display: inline-block;
    margin-bottom: 15px;
    margin-right: 7px;
}
.tags-widget ul.tags-list li a:hover,
.tags-widget ul.tags-list li a.active {
    color: #ff9900;
    font-weight: bold;
    border: 0px solid #ff9900;
}
.tags-widget ul.tags-list li a {
    padding: 4px 10px;
    color: #333;display:block;
    font-size: 18px;
    letter-spacing: 2px;
    font-family: "PingFang SC", "Lantinghei SC", "Microsoft YaHei", "HanHei SC", "Helvetica Neue", "Open Sans", Arial, "Hiragino Sans GB", 微软雅黑, STHeiti, "WenQuanYi Micro Hei", SimSun, sans-serif;
    /* background: #f1f1f1; */
    -webkit-border-radius: 1px;border: 0px solid #ffF;
    -moz-border-radius: 1px;
    -ms-border-radius: 1px;
    border-radius: 1px;
    display: block;
    margin: 0 auto;
    border: 1px solid #4381fd;
    font-weight: 400;
    color: #4381fd;
    text-align: center;
    transition: all ease .3s;
}

</style>

<div id="" style="position:absolute;right:20px;z-index:9999;background:#e90101;">
<ul>
	<c:forEach items="${list}" var="item">
	<li style="list-style:none">
	<a style="display:block;padding:15px;color:#fff" href="<%=basePath %>app/detail?id=${item.id}">${item.product_name } -- 播放${item.click }次</a>
	</li>
	</c:forEach>
	</ul>
</div>


                        <div class="tags-widget col-md-12">
                            
                      <ul class="tags-list nav " role="">
               <!-- <li role="presentation" class="active"><a href="javascript:loadChart2();" >默认</a></li>
                -->
               
    <li role="presentation" class="active"><a href="javascript:loadChart('line');" >默认</a></li>
    <li role="presentation" class="active"><a href="javascript:loadChart('areaspline');" >叠加</a></li>
    <li role="presentation" class="active"><a href="javascript:loadChart('bar');" >柱状图1</a></li>
    <li role="presentation" class="active"><a href="javascript:loadChart('column');" >柱状图2</a></li>
    <li role="presentation" class="active"><a href="javascript:loadChart('area');" >面积图</a></li>
    
    

</ul>	</div>		
</div>
<div style="position:relative">
<c:if test="${false}">
<div style="position:absolute;background:rgba(255,255,255,.8);filter:blur(10px);z-index:999;width:100%;height:400px;left:0;top:0"></div>
</c:if>
	<div id="container" style="min-width:100%;height:400px"></div>
	</div>	
        
        
        
   
           </div></div> 
        </section>
        
         <div class="clear"></div>
         
    </div>    </div>
    <!--content end-->

<jsp:include page="footer.jsp"></jsp:include>
            
<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>

	<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
	<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
	
<!-- 
        <script src="https://code.highcharts.com.cn/highstock/highstock.js"></script> -->
	<script>
	/**
  * Highcharts 在 4.2.0 开始已经不依赖 jQuery 了，直接用其构造函数既可创建图表
 **/
 loadChart();
 function loadChart(type){
	 <c:if test="${empty userid }">
	 //alert("请你登录");
	// return false;
	 </c:if>
var chart = new Highcharts.Chart('container', {
	chart:{type:type,
		zoomType: 'x'	
	},
    title: {
        text: '播放排行',
        x: -20
    },
    subtitle: {
        text: '',
        x: -20
    },
    xAxis: {
        categories: [ <c:forEach items="${list}" var="item">
        '${item.product_name}',
        </c:forEach>
        ]        
    },
    yAxis: {
        title: {
            text: '/'
        },
        plotLines: [{
            value: 0,
            width: 1,
            color: '#808080'
        }]
    },
    tooltip: {
        valueSuffix: '.'
    },
    plotOptions: {
        line: {
            dataLabels: {
                // 开启数据标签
                enabled: true          
            },
            // 关闭鼠标跟踪，对应的提示框、点击事件会失效
            enableMouseTracking: false
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle',
        borderWidth: 0
    },
    series: [{
        name: '播放量',
        data: [<c:forEach items="${list}" var="item">
        ${item.click},
        </c:forEach>]
    }
    ]
});
 }
 
 function loadChart2(){
	 
	 
	 Highcharts.stockChart('container', {
			rangeSelector : {
					selected : 1
			},
			title : {
					text : '播放比重'
			},xAxis: {
		        categories: [ <c:forEach items="${list}" var="item">
		        '${item.product_name}',
		        </c:forEach>
		        ]        
		    },
			series : [{
					type : 'candlestick',
					name : '播放',
					data :[ <c:forEach items="${list}" var="item">
			        [${item.click}],
			        </c:forEach>],
					color: 'green',
					lineColor: 'green',
					upColor: 'red',
					upLineColor: 'red',
					navigatorOptions: {
							color: Highcharts.getOptions().colors[0]
					},
					dataGrouping : {
							units : [
									[
											'week', // unit name
											[1] // allowed multiples
									], [
											'month',
											[1, 2, 3, 4, 6]
									]
							]
					}
			}]
	});
	 
 }
</script>

                                    
                                    </div></div>
                                    
                                    </div>
                                
                    </div><!-- /.col-left -->
                </div>
            </div>
        </div>    
                    
        
        


<script>
$(".mega-menu-category").css("display","none");


$("#addnum").click(function(){
	
	var cartNum = $("#cartnum").val();
	cartNum = parseInt(cartNum);
	var n = cartNum-1;
	n=n>0?n:1;
	$("#cartnum").val(n);


});



$("#sunum").click(function(){
	
	var cartNum = $("#cartnum").val();
	cartNum = parseInt(cartNum);
	$("#cartnum").val(cartNum+1);


});


</script>

<link rel="stylesheet" type="text/css" href="<%=basePath %>ui/confirm/css/xcConfirm.css"/>
		
		<script src="<%=basePath %>ui/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<script>
<c:if test="${not empty message}">
window.wxc.xcConfirm("${message}", window.wxc.xcConfirm.typeEnum.info);
setTimeout(function(){
	location.href="<%=basePath %>app/detail?id=${id}"
}, 1500)
</c:if>
</script>	