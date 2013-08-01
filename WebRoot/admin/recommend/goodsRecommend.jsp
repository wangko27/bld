<%@ page import="com.cnarj.ttxs.util.RecommendArea" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">

    <title>商品推荐</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="<%=basePath %>admin/skin/css/main.css" type="text/css" rel="stylesheet" />
    <script language="javascript" src="<%=basePath %>js/jquery-1.4.2.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" defer="defer"></script>
    <script type="text/javascript"src="<%=basePath%>admin/recommend/js/goodsRecommend.js"></script>
</head>
<body>

<div class="maindiv">
    <h1>
        商品推荐管理&mdash;&mdash;商品推荐</h1>
</div>
<input type="hidden" value="<%=basePath %>" id="path">
<form action="<%=basePath %>admin/recommend/recommend.action" method="post" id="form_advLocation">
    <table width="98%" border="0" cellpadding="0" cellspacing="1"
           align="center">
        <input type="hidden" id="isSucc" value="${isSucc }">
        <tr>
            <td height="26" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <input type="hidden" name="goodsRecommend.goods.goodsid" value="${goodsRecommend != null ? goodsRecommend.goods.goodsid : goods.goodsid}">
                    <input type="hidden" name="goodsRecommend.admin.adminid" value="${goodsRecommend != null ? goodsRecommend.admin.adminid : admin.adminid}">
                    <tr>
                        <td align="left" width="150">商品类别:
                        </td>
                        <td>
                            <%--<input id="categoryname" name="goods.goodesCategory.categoryname"--%>
                                   <%--value="${goodsRecommend != null ? goodsRecommend.goods.goodesCategory.categoryname :goods.goodesCategory.categoryname}"--%>
                                   <%--type="text" size="50" readonly="true">--%>
                        <select id="gSrot">
                            <option value=" ">请选择商品类型</option>
                        </select>


                        </td>
                    </tr>
                    <tr>
                        <td align="left" width="150">商品名:
                        </td>
                        <td>
                            <input id="goodsname" name="goodsRecommend.goods.goodsname" value="${goodsRecommend != null ? goodsRecommend.goods.goodsname : goods.goodsname}"
                                   type="text" size="50">
                        </td>
                    </tr>
                    <tr>
                        <td align="left">上架时间:</td>
                        <td>
                            <input id="createdate" name="goodsRecommend.goods.createdate" value="${goodsRecommend != null ? goodsRecommend.goods.createdate : goods.createdate}"
                                   type="text" size="50" readonly="true">
                        </td>
                    </tr>
                    <tr>
                        <td align="left">推荐人:</td>
                        <td>
                            <input id="recommend" name="goodsRecommend.admin.username"  type="text" size="50"
                                   value="${goodsRecommend != null ? goodsRecommend.admin.username : admin.username}" readonly="true">
                        </td>
                    </tr>
                    <tr>
                        <td align="left">推荐至秒杀商品</td>
                        <td>
                            <div id="miaoSha">
                                <input type="radio" id="isMiaoSha"   name="ms" value="1">是&nbsp;
                                <input type="radio" id="noMiaoSha"   name="ms" value="0" checked>否
                            </div>
                        </td>
                    </tr>
                    <tr id="miaoShaDate">
                        <td align="left">秒杀开始时间</td>
                        <td>
                            <input type="text" class="Wdate" id="beginDate" name="miaoSha.beginDate"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                   size="30" maxlength="30" readonly="readonly"><span style="color: red;">(请至少提前一小时设置开始时间)</span>
                        </td>
                        <td align="left">秒杀结束时间</td>
                        <td>
                            <input type="text" class="Wdate" id="endDate"   name="miaoSha.endDate"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                   size="30" maxlength="30" readonly="readonly" >
                        </td>
                    </tr>
                    <tr id="miaoPrice">
                        <td align="left">秒杀价</td>
                        <td>
                            <select id="miaoShaPriceSelect" name="miaoSha.miaoPrice">
                                <option value="0">--请选择折扣--</option>
                                <option value="0.1">1折秒杀</option>
                                <option value="0.15">1.5折</option>
                                <option value="0.2">2折</option>
                                <option value="0.25">2.5折</option>
                                <option value="0.3">3折</option>
                                <option value="0.3.5">3.5折</option>
                                <option value="0.4">4折</option>
                                <option value="0.45">4.5折</option>
                                <option value="0.5">5折</option>
                                <option value="0.55">5.5</option>
                                <option value="0.6">6折</option>
                                <option value="0.6.5">6.5折</option>
                                <option value="0.7">7折</option>
                                <option value="0.75">7.5折</option>
                                <option value="0.8">8折</option>
                                <option value="0.85">8.5折</option>
                                <option value="0.9">9折</option>
                                <option value="0.95">9.5折</option>
                            </select>
                        </td>
                    </tr>
                    <%--<tr id="isHot">--%>
                        <%--<td>是否推荐位热销商品</td>--%>
                        <%--<td>--%>
                            <%--<input type="radio"   name="hot" value="1" checked>是&nbsp;--%>
                            <%--<input type="radio"   name="hot" value="0" >否--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <tr id="recommendAreaId">
                        <td align="left">推荐区域:</td>
                        <td>
                            <select id="recommendArea" name="goodsRecommend.recommendArea" >
                                <option value="0">————请选择推荐区域————</option>
                                <c:if test="${!empty recommendAreaMap}">
                                    <c:forEach items="${recommendAreaMap}" var="map">
                                        <option value="${map.key}">${map.value}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" id="tjBut" value="保存" class="sst">
                            <input type="reset" name="czBut" value="重置" class="sst_1">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
