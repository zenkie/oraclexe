<%@ include file="/html/common/init.jsp" %>
<%/**
 本文件内容使用ant task 进行javascript, css 文件的合并和压缩操作，对本文件进行的修改需要更新对应的ant build 文件
*/
%>
<%@ include file="/html/common/themes/top_meta.jsp" %>
<%@ include file="/html/common/themes/top_meta-ext.jsp" %>
<link rel="Shortcut Icon" href="/html/nds/images/portal.ico" />
<%if(GetterUtil.getBoolean(PropsUtil.get(PropsUtil.JAVASCRIPT_FAST_LOAD)) ){ %>
<script language="javascript" src="/html/nds/js/object_aio_<%=locale.toString()%>_min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=userWeb.getThemePath()%>/css/object_aio_min.css">
<%}else{%>
<script language="javascript" src="/html/nds/js/top_css_ext.js"></script>
<script language="javascript" language="javascript1.5" src="/html/nds/js/ieemu.js"></script>
<script language="javascript" src="/html/nds/js/cb2.js"></script>
<script language="javascript" src="/html/nds/js/xp_progress.js"></script>
<script language="javascript" src="<%=NDS_PATH%>/js/helptip.js"></script>
<%/*
if(BrowserSniffer.is_mozilla(request)){%>
	<script language="javascript" src="/html/nds/js/xmenu.js"></script>
	<script language="javascript" src="/html/nds/js/cssexpr.js"></script>
	<link type="text/css" rel="stylesheet" href="/html/nds/css/xmenu.css"  />
	<link type="text/css" rel="stylesheet" href="/html/nds/css/xmenu.windows.css" />
<%}else{%>	
	<link type="text/css" rel="StyleSheet" href="/html/nds/js/menu4/skins/officexp/officexp.css" />
	<script language="javascript" src="/html/nds/js/menu4/poslib.js"></script>
	<script language="javascript" src="/html/nds/js/menu4/scrollbutton.js"></script>
	<script language="javascript" src="/html/nds/js/menu4/menu4.js"></script>
	<%if ( ParamUtil.get(request, "enable_context_menu", false)==false){%>
	<script language="javascript" src="/html/nds/js/initctxmenu_<%=locale.toString()%>.js"></script>
	<%}else{%>
	<script>
	 //disable context menu control in top_css_ext.js 
	  document.detachEvent( "oncontextmenu",noContextMenu );
	</script>
	<%}
}*/
%>
	<script language="javascript" src="/html/nds/js/common.js"></script>
	<script language="javascript" src="/html/nds/js/print.js"></script>
	<script language="javascript" src="/html/nds/js/prototype.js"></script>
	<!--script language="javascript" src="/html/nds/js/jquery1.2.3/jquery.js"></script-->
	<!--script language="javascript" src="/html/nds/js/jquery1.3.2/jquery-1.7.2.min.js"></script-->
	<script language="javascript" src="/html/nds/js/jquery1.3.2/jquery-1.7.2.js"></script>
	<!--script language="javascript" src="/html/nds/js/jquery1.2.3/hover_intent.js"></script>
	<script language="javascript" src="/html/nds/js/jquery1.3.2/jquery.ui.tabs.js"></script-->
	<script language="javascript" src="/html/nds/js/jquery1.3.2/hover_intent.min.js"></script>
	<!--script language="javascript" src="/html/nds/js/jquery1.2.3/ui.tabs.js"></script-->
<script>
	jQuery.noConflict();
</script>		
	<script language="javascript" src="/html/js/sniffer.js"></script>
	<script language="javascript" src="/html/js/ajax.js"></script>
	<script language="javascript" src="/html/js/util.js"></script>
	<script language="javascript" src="/html/js/portal.js"></script>
<!--
<script type="text/javascript" src="/html/nds/js/xloadtree111/xtree.js"></script>
<script type="text/javascript" src="/html/nds/js/xloadtree111/xmlextras.js"></script>
<script type="text/javascript" src="/html/nds/js/xloadtree111/xloadtree.js"></script>
<link type="text/css" rel="stylesheet" href="/html/nds/js/xloadtree111/xtree.css" />
-->
<script language="javascript" src="/html/nds/js/objdropmenu.js"></script>
<script language="javascript" src="/html/nds/js/formkey.js"></script>
<!--script type="text/javascript" src="/html/nds/js/selectableelements.js"></script>
<script type="text/javascript" src="/html/nds/js/selectabletablerows.js"></script-->
<!--script language="javascript" src="/html/js/dragdrop/coordinates.js"></script>
<script language="javascript" src="/html/js/dragdrop/drag.js"></script-->
<!--script language="javascript" src="/html/js/dragdrop/dragdrop.js"></script-->
<!--script language="javascript" src="/html/nds/js/calendar.js"></script-->
<script language="javascript" src="/html/nds/js/jdate/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/html/nds/js/dwr.Controller.js"></script>
<script type="text/javascript" src="/html/nds/js/dwr.engine.js"></script>
<script type="text/javascript" src="/html/nds/js/dwr.util.js"></script>
<script language="javascript" src="/html/nds/js/application.js"></script>
<!--script language="javascript" src="/html/nds/js/alerts.js"></script-->
<script language="javascript" src="/html/nds/js/dw_scroller.js"></script>
<script language="javascript" src="/html/nds/js/init_objcontrol_<%=locale.toString()%>.js"></script>
<script language="javascript" src="/html/nds/js/objcontrol.js"></script>
<script language="javascript" src="/html/nds/js/obj_ext.js"></script>
<script language="javascript" src="/html/nds/js/gridcontrol.js"></script>
<script type="text/javascript" src="/html/nds/js/object_query.js"></script>
<script language="javascript" src="/html/nds/js/jquery1.3.2/jquery-ui-1.8.21.custom.min.js"></script>
<script language="javascript" src="/html/nds/js/artDialog4/jquery.artDialog.js?skin=chrome"></script>
<script language="javascript" src="/html/nds/js/artDialog4/plugins/iframeTools.js"></script>
<script type="text/javascript" src="/html/nds/js/jplay/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="/html/nds/js/jqzoom/jquery.jqzoom-core.js"></script>
<script language="javascript" src="/html/nds/js/potips/jquery.poshytip.js"></script>
<!--script language="javascript" src="/html/nds/js/artdialog/artDialog.js"></script-->
<!--link type="text/css" rel="stylesheet" href="/html/nds/js/artdialog/skin/chrome.css" /-->
<!--link type="text/css" rel="StyleSheet" href="<%=userWeb.getThemePath()%>/css/jquery-ui-1.7.3.custom.css" /-->
<!--link type="text/css" rel="stylesheet" href="/html/nds/css/nds_header.css"-->
<link type="text/css" rel="stylesheet" href="<%=userWeb.getThemePath()%>/css/objdropmenu.css">
<link type="text/css" rel="stylesheet" href="<%=userWeb.getThemePath()%>/css/portal.css">
<link type="text/css" rel="StyleSheet" href="/html/nds/css/cb2.css">
<link type="text/css" rel="stylesheet" href="<%=userWeb.getThemePath()%>/css/nds_portal.css">
<link type="text/css" rel="StyleSheet" href="<%=userWeb.getThemePath()%>/css/custom-ext.css" />
<!--link type="text/css" rel="stylesheet" href="<%=userWeb.getThemePath()%>/css/ui.tabs.css"-->
<link type="text/css" rel="stylesheet" href="<%=userWeb.getThemePath()%>/css/aple_menu.css">
<link type="text/css" rel="stylesheet" href="<%=userWeb.getThemePath()%>/css/object.css">
<link type="text/css" rel="stylesheet" href="/html/nds/js/jqzoom/css/jquery.jqzoom.css"/>
<link type="text/css" rel="StyleSheet" href="/html/nds/js/potips/tip-yellowsimple/tip-yellowsimple.css">
<!--link type="text/css" rel="stylesheet" href="/html/nds/js/artdialog4/skins/chrome.css" /-->
<link type="text/css" rel="StyleSheet" href="/html/nds/js/jdate/My97DatePicker/skin/WdatePicker.css"/>
<%}%>
<!--script type="text/javascript" src="/flash/FABridge.js"></script>
<script type="text/javascript" src="/flash/playErrorSound.js"></script-->

<title><%=table==null?"Object":table.getCategory().getName()+ " - "+ table.getDescription(locale)%> - Agile NEA</title>
<%
String fkURLTarget= ((Configurations)WebUtils.getServletContextManager().getActor(nds.util.WebKeys.CONFIGURATIONS)).getProperty("object.url.target");
if(nds.util.Validator.isNotNull(fkURLTarget)){
	fkURLTarget="target=\""+ fkURLTarget+"\"";
}else{
	fkURLTarget="";
}
%>
