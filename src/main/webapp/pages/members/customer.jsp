<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">

	<title></title>

	<link rel="preconnect" href="//fonts.gstatic.com/" crossorigin="">

	<!-- PICK ONE OF THE STYLES BELOW -->
	<link href="<%=basePath%>appstack/css/classic.css" rel="stylesheet">
	<!-- <link href="css/corporate.css" rel="stylesheet"> -->
	<!-- <link href="css/modern.css" rel="stylesheet"> -->

	<!-- BEGIN SETTINGS -->
	<!-- You can remove this after picking a style -->
	<style>
		body {
			opacity: 1;
		}
	</style>
	
	</head>

<body>
	<div class="wrapper">
	

		<div class="main">
			

			<main class="contvent ">
				<div class="container-fluid p-0">

					

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									
								</div>
								<div class="card-body">
								<table class="table card-table table-vcenter text-nowrap table-primary">
											<thead class="bg-danger text-white">
												<tr>
													<th class="text-white">#</th>
													<th class="text-white">账号</th>
													<th class="text-white">性别</th>													
													<th class="text-white">地址</th>
													<th class="text-white">电话</th>
													<th class="text-white">邮箱</th>													

													<th class="text-white">操作</th>
												</tr>
											</thead>
											<tbody>
											 <c:forEach items="${list}" var="item">	
											 <c:if test="${item.type ne 3 }">
												<tr>
													<th scope="row">
													<c:if test="${item.type eq 1 }">
													用户
													</c:if>
													<!-- 
													-<span class="badge badge-danger">积分:${item.jf }</span>
													<c:if test="${item.jf<50 }">
														-<span class="badge badge-primary">会员I级</span>
													</c:if>
													<c:if test="${item.jf<100 && item.jf>50}">
														-<span class="badge badge-primary">会员II级</span>
													</c:if>
													<c:if test="${item.jf>100}">
														-<span class="badge badge-primary">会员IIi级</span>
													</c:if> -->
													
													</th><td>${item.username }</td>
													<td>
													<c:if test="${item.sex==0}">
													<i class="fe fe-female"></i> 女
													</c:if>
													<c:if test="${item.sex==1}">
													<i class="fe fe-male"></i> 男
													</c:if>																			
													</td>
													
													<td>${item.address }</td>
													<td>${item.tel }</td>
													<td>${item.email }</td>													
													<!-- 
													<td>
													<c:if test="${item.grade ne 1}">
													未通过-
												<a class="btn btn-success" href="<%=basePath%>members/ps1?grade=1&id=${item.id}">审核为通过</a>
													</c:if>
													<c:if test="${item.grade eq 1}">
														已通过-
												<a class="btn btn-success" href="<%=basePath%>members/ps1?grade=2&id=${item.id}">设为未通过</a>
													</c:if>	
													</td> -->
													<td>
													<a class="btn btn-success" href="<%=basePath%>members/profile?id=${item.id}">资料</a>
													<a class="btn btn-success" href="<%=basePath%>members/password?id=${item.id}">密码</a>
													<a class="btn btn-danger confirm" href="<%=basePath%>members/delete?id=${item.id}">删除</a>
													</td>
												</tr>
												</c:if>
												</c:forEach>
												
											</tbody>
										</table>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			
		</div>
	</div>

	<script src="<%=basePath%>appstack/js\app.js"></script>
	<script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.js"></script>
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="<%=basePath%>static/animate.css">
<script src="<%=basePath%>static/js.js" charset="utf-8"></script>
<style>
body {
	overflow-x: hidden
}

body::-webkit-scrollbar { /*滚动条整体样式*/
	width: 5px; /*高宽分别对应横竖滚动条的尺寸*/
	height: 1px;
}

body::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	background: #EEE;
}

body::-webkit-scrollbar-track { /*滚动条里面轨道*/
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	background: #DDD;
}

.dataTables_filter input {
	border: 1px solid #ddd;
}
table.dataTable.no-footer,
table.dataTable thead th, table.dataTable thead td{border-bottom-color:#ddd}
</style>
<script>
	$(document).ready(function() {
		$('table').DataTable({
			language : {
				"sProcessing" : "处理中...",
				"sLengthMenu" : "显示 _MENU_ 项结果",
				"sZeroRecords" : "没有匹配结果",
				"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix" : "",
				"sSearch" : "搜索:",
				"sUrl" : "",
				"sEmptyTable" : "表中数据为空",
				"sLoadingRecords" : "载入中...",
				"sInfoThousands" : ",",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "上页",
					"sNext" : "下页",
					"sLast" : "末页"
				},
				"oAria" : {
					"sSortAscending" : ": 以升序排列此列",
					"sSortDescending" : ": 以降序排列此列"
				}
			}
		});

	});
</script>
	<script src="<%=basePath%>scripts/window.js"></script>
   <script>
$().ready(function(){
	$(".uploadImg").click(function(){
		openWindow("<%=basePath%>upload.jsp");
	});
	$("#thumb").on("input",function(){
		$(".oldImg").attr("src","<%=basePath%>"+$("#thumb").val());
	});
});
</script>
	
<script>
		<c:if test="${not empty message}">
		toastr["success"]("${message}", "操作提醒", {
			positionClass : "toast-top-center",
			closeButton : true,
			progressBar : true,
			newestOnTop : true,
			rtl : $("body").attr("dir") === "rtl"
					|| $("html").attr("dir") === "rtl",
			timeOut : 5000
		});
		
		setTimeout(function () {
        		location.href = "<%=basePath%>members/customer";
    			},1000);
		</c:if>
	</script>
</body>

</html>
