<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri= "/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>"/>
    
    <title>您好，欢迎来到952116综合信息门户网!用户中心-照片详情</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link href="css/common.css" rel="stylesheet" type="text/css" />
	<link href="css/user/common.css" rel="stylesheet" type="text/css" />
	<link href="css/user/pohto.css" rel="stylesheet" type="text/css" />
	
	<style type="text/css">
	.photo { 
	max-width:600px; /* 最大宽度为600px*/ 
	width:expression(width>600?"600px":width "px");max-width: 600px; /* 假如图片的尺寸超过600象素,那么就按600象素显示,高度同比例变化;假如图片的尺寸小于600象素,那么就原尺寸显示。在IE6中有效*/ 
	overflow:hidden; /* 超出的部分隐藏，避免控制图片大小失败而引起的撑开变形*/ 
	}
	</style>
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
	<script type="text/javascript">
	//<![CDATA[
	window.CKEDITOR_BASEPATH='<%=basePath%>/ckeditor/';
	//]]>
	</script>
	<script type="text/javascript"
		src="<%=basePath%>/ckeditor/ckeditor.js?t=B37D54V">
	</script>
	
	<script type="text/javascript">
	//点击回复
	function hffunction(hftable){
		if($("#"+hftable).css("display") == "none"){
			$("#"+hftable).css("display","");
		}
		else{
			$("#"+hftable).css("display","none");
		}
	}
	//回复提交
	//comm:内容ID存放容器ID
	//comid:所回复的留言的Id 
	function hfsubmit(comm,comid){
		//设置提交回复的内容

		var $photoid = $("#photoid");
		var $comcontent = $("#"+comm);
		
		$.ajax({
			type:"post",
			url:"<%=basePath%>myspace/comm/photoCommAdd.action",
			data:{photoid:$photoid.val(),comcontent:$comcontent.val(),comid:comid},
			dataType : "html",
			success : function(data){
			
				if(data == "exception"){	
					alert("留言失败,请稍后!");
				}else{
					$("#form1").html(data);
				}
			  }
		});
	}
	

	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		//事件 发表留言
		$("#addcomment").click(function(){
			//取得ckedit中的内容
		    var oEditor = CKEDITOR.instances.pcomment;
		    var comdata = oEditor.getData();
		    
			var $photoid = $("#photoid");
			var $comcontent = comdata;
			var comnum = Number($("#comnum").text())+1;
			
			$.ajax({
				type:"post",
				url:"<%=basePath%>myspace/comm/photoCommAdd.action",
				data:{photoid:$photoid.val(),comcontent:$comcontent},
				dataType : "html",
				success : function(data){
				
					if(data == "exception"){	
						alert("请登录!");
					}else{					    
						//输入框复位
					    oEditor.setData("我也来评论，左边的头像是要发表评论的用户头像");
					    //修改留言条数
					    $("#comnum").html(comnum);
						//更新留言数据
						$("#form1").html(data);
						alert("留言成功!");
					}
				  }
			});
		});
		
		
		
		//事件 上个图片
		$("#pre").click(function(){
			var go = $("#gotoPage").val();
			go = parseInt(go) - 1;
			if($("#hasPrePage").val() == "false"){
				return;
			}
			if(go < 0) {go = 0;}
			
			$("#gotoPage").val(go);
			$("#formphoto").submit();
		});
		
		//事件 下个图片
		$("#next").click(function(){
			var go = $("#gotoPage").val();
			go = parseInt(go) + 1;
			if($("#hasNextPage").val() == "false"){
				return;
			}
			if(go > ${result.page.totalPage+1}) {go =  ${result.page.totalPage};}
			
			$("#gotoPage").val(go);
			$("#formphoto").submit();
		});
	});
	
	</script>
  </head>
  
  <body>
  	<!-- 头 -->
    <jsp:include page="../header.jsp"></jsp:include> 
    
    <div class="mainbody_1">
	  	<div class="dde">
	    <div class="uuop">
		  <!-- 用户中心中部左边菜单栏 -->
		  <jsp:include page="/myspace/content_leftmenu.jsp"></jsp:include>
		  <!-- 用户中心中部右边内容详细页 -->
	      <div class="right">
	      
	        <div class="bobti">我的相册</div>
	        <div class="lujin"> <a href="myspace/comm/albumList.action">我的相册</a> > <a href="myspace/comm/photoOfAlbum.action?albumid=${album.albumid }">${album.albumname }</a> > <b>${result.content[0].photoname }</b> </div>
	        <div class="poth_1">
	          <ul>
	            <li class="tm"><b>${result.content[0].photoname }</b> 上传于${result.content[0].createdate }</li>
	            <li class="rr"><a href="myspace/comm/photoDel.action?albumid=${result.content[0].albums.albumid }&photoid=${result.content[0].photoid }">删除</a></li>
	          </ul>
	        </div>
	        <div class="poth_5">
	        <form action="myspace/comm/photoDetail.action" method="post" id="formphoto">
			  <input type="hidden" id="gotoPage" name="gotoPagephoto" value="${gotoPage }"/>
	          <input type="hidden" id="albumid_p" name="albumid_p" value="${album.albumid }"/>
	          
	          <input type="hidden" id="hasPrePage" name="page.hasPrePage" value="${result.page.hasPrePage }"/>
	          <input type="hidden" id="hasNextPage" name="page.hasNextPage" value="${result.page.hasNextPage }"/>
	        
	          <table width="738" height="560" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	              <td width="40"><input id="pre" name="" type="button" class="ff1" /></td>
	              <td width="658"><img class="photo"  src="${result.content[0].photopath }" /></td>
	              <td width="40"><input id="next" name="" type="button" class="ff2" /></td>
	            </tr>
	          </table>
	          
	        </form>
	        </div>
	        
	        <form id="form1" action="myspace/comm/photoCommAdd.action" method="post">
	        
	        <div class="poth_1 mari">
	          <ul>
	            <li class="tm" id="commnum"><b>相片评论(共${fn:length(photoComList)}条)</b><a name="Aname" id="Aid"></a></li>
	          </ul>
	        </div>
	        <div class="poth_4">
	        
	        <!-- 处理留言数据 -->
	        <s:iterator value="photoComList" status="st" id = "comm">
	        
		        <!-- 如果是留言 -->
		        <s:if test="#comm.parent == null">
		        	<!-- 如果不是第一条留言,给上一个留言加上结束的div -->
			        <s:if test="#st.index != 0">
			          </div>
			          </div>
			        </s:if>
			        
			        <!-- 显示留言信息和回复框 -->
		            <div class="plun">
		            <div class="cee"><a href="Zone/index.action?TTid=${comm.member.memberid}"><img src="${comm.member.headpath }" onerror="this.src='img/user_img/imgmo.gif'" /></a></div>
		            <div class="cenn">
		            <table width="384" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td><a href="Zone/index.action?TTid=${comm.member.memberid}">${comm.username }</a> <span>${comm.commenteddate }</span></td>
	                  </tr>
	                  <tr>
	                    <td><p>${comm.commentedcontent }</p>
	                      <a href="javascript:;" onclick="hffunction('hftable${st.index }');">回复</a></td>
	                  </tr>
	                </table>
	                <table id="hftable${st.index }" width="384" border="0" cellspacing="0" cellpadding="0" style="display:none">
			            <tr>
			              <td>
			              <textarea id="recomment${st.index}" name="comcontent" cols="" rows="" class="tex"></textarea>
			              </td>
			            </tr>
			            <tr>
			              <td><input name="" type="button" onclick="hfsubmit('recomment${st.index}','${comm.commentedid }');" value="确定" class="quedd"/>
			                <a href="#" class="qqx">取消</a></td>
			            </tr>
		          	</table>
		        </s:if>
		        
		        <!-- 如果是回复 -->
		        <s:else>
		        <!-- 显示回复 -->
		          <ul class="hui">
	                <li class="tou"><a href="Zone/index.action?TTid=${comm.member.memberid}"><img src="${comm.member.headpath }" onerror="this.src='img/user_img/imgmo.gif'" /></a></li>
	                <li>
	                  <dl>
	                    <dt><a href="Zone/index.action?TTid=${comm.member.memberid}">${comm.username }</a> <span>${comm.commenteddate }</span></dt>
	                    <dd>${comm.commentedcontent }</dd>
	                  </dl>
	                </li>
	              </ul>
		        </s:else>
		        
	        </s:iterator>
	        
	        
             
             <s:if test="photoComList.size() > 0">
	          </div>
	          </div>
             </s:if>
	          <!-- 被留言的照片 -->
	          <input type="hidden" value="${result.content[0].photoid }" name="photoid" id="photoid"/>
	          <!-- 被留言的留言 -->
	          <input type="hidden" value="" name="comid" id="comid"/>
	        </form>
	        
	          <div class="plun">
	            <div class="cee"><img src="img/user_img/imgmo.gif" onerror="this.src='img/user_img/imgmo.gif'"/></div>
	            <div class="cenn">
	              <table width="384" border="0" cellspacing="0" cellpadding="0">
	                <tr>
	                  <td>
	                  	<textarea id="pcomment" cols="" rows="" class="tex_1">我也来评论，左边的头像是要发表评论的用户头像</textarea>
	                  
						<script type="text/javascript">
						//<![CDATA[
						CKEDITOR.replace('pcomment',{
							toolbar :
							[
								['Smiley']
							]
						});
						//]]>
						</script>
	                  </td>
	                </tr>
	                <tr>
	                  <td>
	                  <input id="addcomment" type="button"  value="发表评论" class="quedd_1"/></td>
	                </tr>
	              </table>
	            </div>
	          </div>
	          
	        
	        </div>
	      </div>
	    </div>
	  	</div>
    </div>
	<!-- 底 -->
    <jsp:include page="../footer.jsp"></jsp:include> 
  	
	<!-- 消息提示 -->
  	<jsp:include page="/comm/message.jsp"></jsp:include> 
  </body>
</html>
