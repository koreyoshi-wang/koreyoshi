<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Resource Request Tracking</title>

<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--不支持老版本IE-->
<meta http-equiv="X-UA-Compatible" content="IE=7">
<!--device-width自适应移动端宽度，initial-scale=1不进行缩放-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/font-awesome.min.css">
<script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/dataTables.bootstrap.min.js"></script>
<style>
.container{position:relative;width:100%;min-height:100%;}
.body{padding-bottom:50px;}
.footer{height:10px;position:fixed;bottom:0px;left:0px;width:100%;z-index:999}
</style>
</head>

<body>
	<div class="container">
		<!-----------------------------------------导航条设计开始--------------------------------->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<img alt="" src="<%=path%>/images/dxc_logo_hz_wht_rgb_300.png" style="height:42px;padding-top:7px">
				<!-- <p class="navbar-brand">DXC Technology</p> -->
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" >
				<form class="navbar-form navbar-left pull-right" role="search" >
					<div class="form-group">
						<input type="text" id="searchKey" class="form-control" placeholder="Search In Table" onkeypress="javascript:return gosearch();">
					</div>
					<button type="button" id="searchButton" class="btn btn-default">Search</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>

		<!------------------------------------------导航条结束-------------------------------->
		<!------------------------------------------page-header开始-------------------------------->
		<!-- <div class="page-header">
			<h1>
				Example page header <small>Subtext for header</small>
			</h1>
		</div> -->
		<!------------------------------------------page-header结束-------------------------------->
		<div class="body">
		<div class="panel panel-default" style="padding:5px">
			<!-- Default panel contents -->
			<div class="panel-heading">Resource Request Tracking</div>
			<!-- Table -->
			<table class="table table-striped table-bordered table-hover">
				<thead>
			        <tr>
			        	<th width="5%">Request Date</th>
						<th width="5%">Account</th>
						<th width="15%">Project Name</th>
						<th width="5%">Resource Level</th>
						<th width="5%">Primary Location</th>
						<th width="20%">Job Title</th>
						<th>Job Description</th>
						<th width="3%">View</th>
					</tr>
			    </thead>
			    <tbody>
			    </tbody>
			</table>
		</div>
		</div>
		<div class="footer">
			<footer>
				<div id="copyright">
					<p>2017 © DXC Technology All Rights Reserved.</p>
				</div>
			</footer>
		</div>
		<!--页脚结束-->
	</div>
</body>
<div id="modalContent">
	<jsp:include page="viewModal.jsp"></jsp:include>
</div>
<script type="text/javascript">
	var table ;
	var serverData;
	jQuery(document).ready(function() {
		table =  jQuery('table').DataTable({
			"bLengthChange" : false,
			"bFilter" : false,
			"bSort" : false, 
			"pageLength" : 10,
			"bProcessing": true,
			"serverSide": true,
	        "ajax" : {
	            "dataType" : 'json',
	            "type" : "post",
	            "cache" : false,
	            "url" : "${contextPath}/index/list",
	            "data" : function ( d ) {
            		return $.extend({}, d, serverData);
            	}
	        },
	        "columns": [	 
		        	{data: "requestDate",
	                	render: function (data, type, full, meta){
	    					return "<span class=\"active\" style = \"display:block;\" >"+ new Date(data).Format("yyyy-MM-dd") + '</span>';
	    				}
	                },
	                {data: "account",
	                	render: function (data, type, full, meta){
	    					return "<span class=\"active\" style = \"display:block;\" >"+ data+ '</span>';
	    				}
	                },
	    			{data: "projectName",
	    				render: function (data, type, full, meta){
	    					return "<span class=\"success\" style = \"display:block;\" >"+ data+ '</span>';
	    				}
	    			},
	    			{data: "resourceLevel",
	    				render: function (data, type, full, meta){
	    					return "<span class=\"warning\" style = \"display:block;\" >"+ data+ '</span>';
	    				}
	    			},
	    			{data: "primaryLocation",
	    				render: function (data, type, full, meta){
	    					return "<span class=\"danger\" style = \"display:block;\" >"+ data+ '</span>';
	    				}
	    			},
	    			{data: "jobTitle",
	    				render: function (data, type, full, meta){
	    					return "<span class=\"danger\" style = \"display:block;\" >"+ data+ '</span>';
	    				}
	    			},
	    			{data: "jobDescription",
	    				render: function (data, type, full, meta){
	    					return "<p class=\"danger\" style = \"display:block;\" >"+ data+ '</p>';
	    				}
	    			},
	    			{data: null,
	    				render: function (data, type, full, meta){
	    					return "<button type=\"button\" class = \"btn btn-default btn-block\" onclick=\"viewRequest("+ full.id +")\"  title=\"View this record\"><i class=\"fa fa-eye\"></i></button>";
	    				}
	    			}
	    	],
			"fnDrawCallback" : function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
				//add Number column
				/*this.api().column(0).nodes().each(function(cell, i) {
					cell.innerHTML = i + 1;
				});*/
			}
		});
	});
</script>
<script type="text/javascript">
	function gosearch(){
	    if(window.event.keyCode == 13){
	    	jQuery("#searchButton" ).click();
	        return false;    
	    }
	}
	
	jQuery("#searchButton" ).click(function() {
		var searchKey = jQuery("#searchKey").val();
		serverData = {"searchKey":jQuery.trim(searchKey)};
		table.draw(true);
	});
	
	function viewRequest(id){
		 jQuery.ajax({
		        type: "post",
		        dataType: "html",
		        url: "${contextPath}/index/view?id=" + id,
		        success: function(data) {
		            jQuery("#modalContent").html(data);
		            jQuery("#viewModal").modal("show");
		        },
		        error: function() {
		            alert("Server connection timed out, please try to sign in again.");
		        }
		    });
	}
</script>
<script type="text/javascript">
	Date.prototype.Format = function (fmt) {
	    var o = {
	        "M+": this.getMonth() + 1, //æä»½ 
	        "d+": this.getDate(), //æ¥ 
	        "h+": this.getHours(), //å°æ¶ 
	        "m+": this.getMinutes(), //å 
	        "s+": this.getSeconds(), //ç§ 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //å­£åº¦ 
	        "S": this.getMilliseconds() //æ¯«ç§ 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
</script>
</html>
