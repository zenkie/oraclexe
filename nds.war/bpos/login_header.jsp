<%@ page language="java" import="nds.query.*" pageEncoding="utf-8"%>
<%
String fastLoad=(String)QueryEngine.getInstance().doQueryOne("select value from ad_param where name='webpos.fastLoad'");

if("true".equals(fastLoad)){
%>
<link href="webpos.min.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="webpos.login.min.js"></script>
<%
}else{
%>
<link href="bpos.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="prototype.js"></script>
<script language="javascript" src="jquery.js"></script>
<script language="javascript" src="jquery.jmpopups.js"></script>
<script language="javascript" src="jQueryConflict.js"></script>

<script language="javascript" src="sniffer.js"></script>
<script language="javascript" src="alerts.js"></script>
<script language="javascript" src="CookieUtil.js"></script>
<script type='text/javascript' src='dwr.engine.js'></script>
<script language="javascript" src="dwr.util.js"></script>
<script language="javascript" src="util.js"></script>
<script language="javascript" src="init_objcontrol_zh_CN.js"></script>
<script language="javascript" src="login.js"></script>
<%}%>

