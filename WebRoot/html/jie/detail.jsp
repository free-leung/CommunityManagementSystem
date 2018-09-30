<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
	<script src="${pageContext.request.contextPath}/res/js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="pp-header layui-bg-black">
  <div class="layui-container">
    <a class="pp-logo" href="/">
      <img src="${pageContext.request.contextPath}/res/images/logo.png" alt="layui">
    </a>
    <ul class="layui-nav pp-nav layui-hide-xs">
      <li class="layui-nav-item layui-this">
        <a href="${pageContext.request.contextPath}/html/index.jsp"><i class="iconfont icon-jiaoliu"></i>主页</a>
      </li>
      <li class="layui-nav-item">
        <a href=""><i class="iconfont icon-iconmingxinganli"></i>我的社团</a>
      </li>
    </ul>
    
    <ul class="layui-nav pp-nav-user">
      <c:if test="${empty sessionScope.Student}">
	      <!-- 未登入的状态 -->
	      <li class="layui-nav-item">
	        <a class="iconfont icon-touxiang layui-hide-xs" href="${pageContext.request.contextPath}/user/login.html"></a>
	      </li>
	      <li class="layui-nav-item">
	        <a href="${pageContext.request.contextPath}/user/login.html">登入</a>
	      </li>
      </c:if>
      
      <c:if test="${not empty sessionScope.Student}">
	      <!-- 登入后的状态 -->
	      <li class="layui-nav-item">
		    <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">${sessionScope.Student.studentInfo.name}</a>
		    <dl class="layui-nav-child">
		      <dd><a href="">修改信息</a></dd>
		      <dd><a href="">安全管理</a></dd>
		      <dd><a href="">退了</a></dd>
		    </dl>
		  </li>
      </c:if>
      
    </ul>
  </div>
</div>

<div class="pp-panel pp-column">
  <div class="layui-container">
    <ul class="layui-clear">
      <li class="layui-hide-xs layui-this"><a href=""><span id="asso"></span>的活动</a></li> 
    </ul> 
    
    <div class="pp-column-right layui-hide-xs"> 
      <span class="pp-search"><i class="layui-icon"></i></span> 
      <a href="jie/add.html" class="layui-btn">搜索活动</a> 
    </div> 
    <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;"> 
      <a href="jie/add.html" class="layui-btn">搜索活动</a> 
    </div> 
  </div>
</div>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8 content detail">
      <div class="pp-panel detail-box">
        <h1 id="activityName"></h1>
        <div class="pp-detail-info">
          <!-- <span class="layui-badge">审核中</span>
          <div class="pp-admin-box" data-id="123">
            <span class="layui-btn layui-btn-xs jie-admin" type="del">删除</span>
            
            <!-- <span class="layui-btn layui-btn-xs jie-admin" type="set" field="stick" rank="1">置顶</span>  -->
            <!-- <span class="layui-btn layui-btn-xs jie-admin" type="set" field="stick" rank="0" style="background-color:#ccc;">取消置顶</span> -->
            
          </div>
        </div>
        <div class="detail-about">
          <a class="pp-avatar" href="${pageContext.request.contextPath}/user/home.html">
            <img src="头像" alt="">
          </a>
          <div class="pp-detail-user">
            <a href="${pageContext.request.contextPath}/user/home.html" class="pp-link">
              <cite>用户名</cite>
            </a>
            <span id="time"></span>
          </div>
          <div class="detail-hits" id="LAY_jieAdmin" data-id="123">
            <span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="add.html">编辑此贴</a></span>
          </div>
        </div>
        <div class="detail-body photos">
          <p id="explains"></p>
          <p>
            <img src="${pageContext.request.contextPath}/res/images/fly.jpg" alt="##">
          </p>
        </div>
      </div>

    </div>
    
  </div>
</div>

<div class="pp-footer">
  <p><a href="" target="_blank">PP技术支持</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">pp出品</a></p>
  <p>
	<a href="" target="_blank">如</a>
    <a href="" target="_blank">商业合作</a>
	<a href="" target="_blank">或</a>
    <a href="" target="_blank">招聘我们</a>
	<a href="" target="_blank">请</a>
    <a href="" target="_blank">加我微信</a>
  </p>
</div>

<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>

layui.config({
  version: "3.0.0"
  ,base: '${pageContext.request.contextPath}/res/mods/'
}).extend({
  pp: 'index'
}).use('pp'); 

//进入页面时加载活动详情
ajaxActivity(${param.activityId});

//异步请求获取某社团活动的详细信息
function ajaxActivity(activityId){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/findActivityById.action?activityId="+activityId,
		dataType:"json",
		processData:false,
		success:function(data){
			$("#activityName").text(data.associationActivity.activityName);
			$("#explains").text(data.associationActivity.explains);
			$("#asso").text(data.associationActivity.association.name);
			$("#").text();
			$("#").text();
		}
	});
	
}

</script>

</body>
</html>