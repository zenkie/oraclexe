<%@page errorPage="/html/nds/error.jsp"%>
<%@ include file="/html/portlet/nds/init.jsp" %>
<%!
	/**
	*  max length to be display for the news' subject,
	*  if greater than that, will append ".."
	*/
 	private final static DateFormat df = new java.text.SimpleDateFormat("MM-dd HH");
	private final static DateFormat longdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH");
%>
<%
org.hibernate.Session hsession= null;
UNewsDAO dao=new UNewsDAO();
try{
 int objectId=Tools.getInt(nds.portlet.util.PortletUtils.findRequestParameter(renderRequest,"id"),-1);
 hsession=dao.createSession();
 QueryResult result;
 int oid;
 String subject,style, contenturl,clientName;
 String date;
 int scrollWidth;
 int columnsPerRow,i=0, recordCount;
 int maxSubjectLength=40;

 // prepare url for scroll.jsp
 PortletURL portletURL =renderResponse.createRenderURL();
 //portletURL.setWindowState(WindowState.MAXIMIZED);
 portletURL.setPortletMode(PortletMode.VIEW);
 portletURL.setParameter("id","NEWSOBJECTID");
 String portletURLToString=JS.encodeURIComponent(portletURL.toString());
 
%>
<script>
 function opw_<%=renderResponse.getNamespace()%>(oid){
 	//window.location="<%=portletURL.toString()%>".replace( /NEWSOBJECTID/g , oid);
 	window.location="/web/guest/news?id="+oid;
 }
</script>
<style>
.dateview{FONT-SIZE: 9px; COLOR: <%=colorScheme.getPortletTitleBg()%>;}
</style>
<%
if(objectId==-1){
	QueryResult headlineResult= dao.getHeadLines(request);
	if(headlineResult.next()){
 		objectId=((java.math.BigDecimal)headlineResult.getObject(1)).intValue();
	}
}
if ( objectId!=-1){
/**
* View single news object 
*/
UNews newsObject=dao.load(new Integer(objectId),hsession);
String errNewsMessage= null;
if(newsObject==null){
	errNewsMessage=PortletUtils.getMessage(pageContext, "object-not-exists",null);
}
if(!"Y".equals(newsObject.getIsPublic())){
	if( dao.isGuest(userWeb)){
		//is guest and news is not public
		errNewsMessage=PortletUtils.getMessage(pageContext, "login-to-read-private-news",null);
	}else if(!userWeb.hasObjectPermission("u_news",objectId, nds.security.Directory.READ)){
		errNewsMessage=PortletUtils.getMessage(pageContext, "no-permission",null);
	}
}

 if(errNewsMessage!=null){	
%>
<div class="errormsg"><%=errNewsMessage%></div>
<%}else{// not error, show show the news object
	String content= UNewsDAO.getContent(newsObject.getId().intValue());
	UNews parentNews =  newsObject.getParentNews();
	
%>
            <table border=0 cellSpacing=2 cellPadding=0 width="95%" border=0>
              <% if(parentNews!=null ||userWeb.isGuest() ){
              %>
              <tr>
              	<td><table width="100%" cellSpacing=2 cellPadding=2>
              		<tr>
              		<%if(parentNews!=null){%>
              		<td align="left"><font class='gamma'><%=PortletUtils.getMessage(pageContext, "belong-topic",null)%>:&nbsp;
              		<a class="redlink" href="javascript:opw_<%=renderResponse.getNamespace()%>(<%=newsObject.getParentId()%>)">
 						<%=parentNews.getSubject()%>
 					</a></font></td>
 					<%}
 					if(userWeb.isGuest()){%>
 					<td align="right"><%=newsObject.getAdClient().getDescription()%></td>
 					<%}%>
 					</tr></table>
 					
              	</td>
              </tr>
              <%}%>
              <tr>
              	<td align='center'  valign="bottom" height="25">
              		<div class="news-title"><%=newsObject.getSubject() %> </div>
              	</td> 
              </tr>
              <tr>
              	<td align='center'  valign="middle" height="14">
              		<div class="news-source">
              		<%= (newsObject.getPublisher()==null?"":newsObject.getPublisher())%>
              		&nbsp;&nbsp;<%= (newsObject.getAuthor()==null?"":newsObject.getAuthor())%>
              		&nbsp;&nbsp;<%=((java.text.SimpleDateFormat)QueryUtils.dateFormatter.get()).format(newsObject.getModifiedDate())%>
              		 </div>
              		
              	</td> 
              </tr>
              <tr height=20>
              	<td align='center' >
              	</td> 
              </tr>
              <TR>
                <TD><DIV>
                <%=content%>
                </DIV></TD>
              </TR>
              
              <tr><td>
        			<%@ include file="/html/portlet/nds/news/inc_toplink.jsp" %> 
              </td>
              </tr>
              <tr><td>
              
        			<%@ include file="/html/portlet/nds/news/inc_relatelink.jsp" %> 
              </td>
              </tr>

              </table>
<%}//end if acitve
 }else{// else if ( objectId==-1){
%>
	<div class="errormsg"><%=PortletUtils.getMessage(pageContext, "object-not-exists",null)%></div>
<%}

}catch(Exception exyp){
	System.out.println("Found error in news.view.jsp");
	exyp.printStackTrace();
}finally{
	if(hsession!=null){
    	try{ dao.closeSession();}catch(Exception ex){}
    }
}
%>


