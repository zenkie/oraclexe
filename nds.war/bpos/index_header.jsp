<%@ page language="java" import="nds.query.*" pageEncoding="utf-8"%>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="0"> 
<%
String fastLoad=(String)QueryEngine.getInstance().doQueryOne("select value from ad_param where name='webpos.fastLoad'");
 
if("true".equals(fastLoad)){
%>
<link href="webpos.min.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="webpos.min.js"></script>
<%
}else{
%>
	<link rel="stylesheet" type="text/css" href="ui.all.css" />
	<link rel="stylesheet" type="text/css" href="bpos.css"  />
	
	<script language="javascript" src="prototype.js"></script>
	<script language="javascript" src="jquery.js"></script>
	<script language="javascript" src="jquery.jmpopups.js"></script>
	<script language="javascript" src="jquery.tipInput.js"></script>
	<script language="javascript" src="jquery.autocomplete.js"></script>
	<script language="javascript" src="ui.core.js"></script>
	<script language="javascript" src="jQueryConflict.js"></script>
	
	<script type="text/javascript" src="dwr.Controller.js"></script>
  <script type="text/javascript" src="dwr.engine.js"></script>
  <script type="text/javascript" src="dwr.util.js"></script>
  <script language="javascript" src="application.js"></script> 
  
	<script language="JavaScript" src="formkey.js"></script>
  <script language="javascript" src="WdatePicker.js"></script>		
	<script language="JavaScript" src="floatoperation.js"></script>   
	<script language="JavaScript" src="EleGetFocusEvent.js"></script>    
  <script language="javascript" src="sniffer.js"></script>
  <script language="javascript" src="ajax.js"></script>
	<script type='text/javascript' src='util.js'></script>
  <script language="javascript" src="alerts.js"></script>
  
  <script language="javascript" src="init_objcontrol_zh_CN.js"></script>
  <script type="text/javascript" src="object_query.js"></script>
  <script language="javascript" src="jsCssEffect.js"></script>
  <script language="javascript" src="calendar.js"></script>
  <script language="javascript" src="newsquery.js"></script>
	<script language="javascript" src="webpos.js"></script>
	<script language="javascript" src="bxl.js"></script>
	<script language="javascript" src="zody.js"></script>
	<script language="javascript" src="drawUtil.js"></script>
		
<%}%>