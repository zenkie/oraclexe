<%-- Provides a simple searchbox that can be easily included anywhere
     on the page --%>

<DIV class="searchbox">
  <FORM action="<wiki:Variable var="baseURL"/>Search.jsp"
      ACCEPT-CHARSET="ISO-8859-1,UTF-8">
    <wiki:LinkTo page="FindPage"><i18n:message key="SearchBox.searchWiki" />:</wiki:LinkTo>
    <INPUT type="text" name="query" size="15">
    <INPUT type="submit" name="ok" value="<i18n:message key="SearchBox.find" />">
  </FORM>
</DIV>


