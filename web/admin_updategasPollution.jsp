<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加废气污染物排放信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-form.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
	<script src="${bathPath}js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <style type="text/css">
         body{font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{}
        .l-button-submit,
        .l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
	    	
	<script type="text/javascript">
	function resetValue(){
		$("#accountTotalEmission").val('');
		$("#mgL").val('');
		$("#monitorDate").val('');
		$("#monitorMothod").val('');
		$("#pLocation").val('');
		$("#pMethod").val('');
		$("#pMouth").val('');
		$("#pName").val('');
		$("#standartMGL").val('');
		$("#totalEmission").val('');
	}
	
	function formSubmit(){
		var pollutionInfoId=$("#pollutionInfoId").val();
		var entUserId=$("#entUserId").val();
		var accountTotalEmission=$("#accountTotalEmission").val();
		var mgL=$("#mgL").val();
		var monitorDate=$("#monitorDate").val();
		var monitorMothod=$("#monitorMothod").val();
		var pLocation=$("#pLocation").val();
		var pMethod=$("#pMethod").val();
		var pMouth=$("#pMouth").val();
		var pName=$("#pName").val();
		var standartMGL=$("#standartMGL").val();
		var totalEmission=$("#totalEmission").val();
		var over=$("#over").val();
		if(pMouth.length<=0){
			parent.$.ligerDialog.warn("亲, [排放口编号或名称] 不能为空");
		}else{
			$.ajax({
				type: "POST",
				dataType:"text" ,
				data:"pollutionInfoId="+pollutionInfoId+"&entUserId="+entUserId+"&accountTotalEmission="+accountTotalEmission+"&mgL="+mgL+"&monitorDate="+monitorDate+"&monitorMothod="+monitorMothod+
					"&pLocation="+pLocation+"&pMethod="+pMethod+"&pMouth="+pMouth+"&pName="+pName+"&standartMGL="+standartMGL+"&totalEmission="+totalEmission+"&over="+over,
				url:"<%=request.getContextPath()%>/updateGasPollutionInfoByPollutionInfoId", 
				isAjaxSubmit: true,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				success: function(data){
					if(data=="success"){
						alert("废气污染物排放信息添加成功!");
						parent.$.ligerDialog.close(); //关闭弹出窗
						parent.window.initBaseInfoGrid();//调父窗口某个方法
						parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
					}else{
					    alert("添加废气污染物排放信息失败!");
					}
				},
				error: function() {
					alert("服务器出错!请联系管理员.");
				},
			});
			return false;
	   }
	}
</script>
</head>
<body style="padding:10px">
    <input name="entUserId" type="hidden" id="entUserId" value="${entprise.entUserId}"/>
    <input name="pollutionInfoId" type="hidden" id="pollutionInfoId" value="${entPollutionInfo.pollutionInfoId}"/>
     <table border="0" cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">单位名称:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="entName" type="text" id="entName" value="${entprise.entName}" disabled="disabled"/>
                </td>
                <td align="right" class="l-table-edit-td">组织机构代码:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="entUsercode" type="text" name="entUsercode" value="${entprise.entUsercode}" disabled="disabled"/>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">排放口编号或名称:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="pMouth" type="text" id="pMouth" value="${entPollutionInfo.pMouth}"/>
                </td>
                <td align="right" class="l-table-edit-td">排放口位置:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="pLocation" type="text" name="pLocation" value="${entPollutionInfo.pLocation}"/>[经纬度]
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">排放方式:</td>
                <td align="left" class="l-table-edit-td" width="320px">
	                <select name="pMethod" id="pMethod">
						<option value="${entPollutionInfo.pMethod}" selected="selected">${entPollutionInfo.pMethod}</option>
						<option value="连续排放">连续排放</option>
						<option value="间断排放">间断排放</option>
					</select>
                </td>
                 <td align="right" class="l-table-edit-td">特征污染物名称: </td>
                <td align="left" class="l-table-edit-td">
                    <input name="pName" type="text" id="pName" value="${entPollutionInfo.pName}" />
                </td>
            </tr>
            <tr>
             	<td align="right" class="l-table-edit-td">排放浓度:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="mgL" type="text" id="mgL" value="${entPollutionInfo.mgL}"/>[mg/m³]
                </td>
                <td align="right" class="l-table-edit-td">监测方式: </td>
                <td align="left" class="l-table-edit-td">
                   <select name="monitorMothod" id="monitorMothod">
							<option value="${entPollutionInfo.monitorMothod}" selected="selected">${entPollutionInfo.monitorMothod}</option>
							<option value="手工方式">手工方式</option>
							<option value="自动方式">自动方式</option>
					</select>
                </td>
            </tr>
            <tr>
            	 <td align="right" class="l-table-edit-td">执行的污染物排放<br/>浓度标准浓度限值:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="standartMGL" type="text" id="standartMGL" value="${entPollutionInfo.standartMGL}" />[mg/m³]
                </td>
                <td align="right" class="l-table-edit-td">监测时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="monitorDate" type="text" id="monitorDate"  value="${entPollutionInfo.monitorDate}" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
            </tr>
            <tr>
            	<td align="right" class="l-table-edit-td">排放总量:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="totalEmission" type="text" id="totalEmission" value="${entPollutionInfo.totalEmission}" />[Kg]
                </td>
                <td align="right" class="l-table-edit-td">核定的排放总量:</td>
                <td align="left" class="l-table-edit-td"> 
                	<input name="accountTotalEmission" type="text" id="accountTotalEmission" value="${entPollutionInfo.accountTotalEmission}" />[Kg]
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">是否超标:</td>
                <td align="left" class="l-table-edit-td" width="320px">
	                <select name="over" id="over">
						<option value="${entPollutionInfo.over}" selected="selected">${entPollutionInfo.over}</option>
						<option value="是">是</option>
						<option value="否">否</option>
					</select>
                </td>
                <td align="left" class="l-table-edit-td"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
               	<input type="button" value="修改" onclick="formSubmit()"/> 
				<input type="button" value="重置" onclick="resetValue()"/>
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>