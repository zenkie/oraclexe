<%
    int columnsPerRow =ParamUtils.getIntAttributeOrParameter( request,"column", 2);// default Columns Per Row
    
    /**
      Whether to show checkbox or select when column display type is checkbox.
      Since checkbox input can not determine the status that user not confirmed(neither yes nor no),
      This situation occurs when doing batch update and create template. By default, it will show checkbox.
      Note: it's untested when this parameter set to true while doing normal operation such as Object.Add
    */
    boolean bShowCheckBox=ParamUtils.getBooleanAttribute(request, "showcheckbox",true);

    TableQueryModel model= new TableQueryModel(tableId, actionType,isInput,true,locale);
    if(result!=null)result.next();

    //ArrayList columns=table.getShowableColumns(actionType);
   FKObjectQueryModel fkQueryModel;
   
%>
<table align="center" border="0" cellpadding="1" cellspacing="1" width="100%">
	<input type="hidden" name="id" value="<%=objectId %>">
    <input type="hidden" name="table" value="<%=tableId %>">
    <%

    int widthPerColumn= (int)(100/(columnsPerRow*2));
    String data=null;// result item data for display
    String dataWithoutNBSP=null;
    Object dataDB= null; // raw db data 
    String dataValue = null;//Hawke: data's value in select option
    int coid=-1;  // object id if result item will have a URL
	int tabIndex=0; 
	String fixedColumnMark; boolean isFixedColumn;
	
	DisplaySetting ds;
	int colIdx=-1; // colIdx max to columnsPerRow(equal), each row has (columnsPerRow x 2) <td>;
    for(int i=0;i< columns.size();i++){
    	colIdx++;
        Column column=(Column)columns.get(i);
        if(column.getSQLType()!=22){
        ds= column.getDisplaySetting();
        if(colIdx%columnsPerRow == 0){
        	colIdx=0;
%>        
	<tr<%=(ds.getObjectType()==DisplaySetting.OBJ_BLANK?" class='blankrow'":"")%>>
<%     }   
        if(ds.isUIController()){
        	if (ds.getObjectType()==DisplaySetting.OBJ_HR){
        		// occupy whole row
        		if(colIdx !=0){
        			for(int ri=0;ri< columnsPerRow-colIdx;ri++) out.print("<td>&nbsp;</td><td>&nbsp;</td>");
        			out.print("</tr><tr>");
        		}
        		out.print("<td height=18 valign='bottom' align='left' colspan='"+(columnsPerRow*2)+"'><font class='beta'><b>"+column.getDescription(locale)+"</b></font><div class='hrRule'><span/></div></td>");
        		out.print("</tr>");
        		colIdx=-1;
       			
        	}else{
        		// blank
        		if( ds.getColumns()> columnsPerRow-colIdx){
        			// occupy whole row
        			if(colIdx !=0){
        				for(int ri=0;ri< columnsPerRow-colIdx;ri++) out.print("<td></td><td></td>");
        				out.print("</tr><tr class='blankrow'>");
        			}
        		}
        		out.print("<td colspan='"+(ds.getColumns()*2)+"'>&nbsp;</td>");
        		if(colIdx+ds.getColumns()>columnsPerRow-1 ){
        			colIdx=-1;
        			out.print("</tr>");
        		}// colIdx will be increment 1 after continue
        	}
       		continue;

        }
        
        dataValue = "";
		fixedColumnMark= (fixedColumns.get(new Integer(column.getId())) ==null)?"":"DISABLED";
		isFixedColumn= (fixedColumns.get(new Integer(column.getId())) ==null)?false:true;
		
        String desc=  model.getDescriptionForColumn(column);
        dataWithoutNBSP=null;
        if(result !=null){
              data=result.getString(i+1,true);
              dataWithoutNBSP=result.getString(i+1,false);
              coid=result.getObjectID( i+1);
              dataDB =result.getObject(i+1);
        }else{
        	dataWithoutNBSP=prefs.getProperty(column.getName(),column.getDefaultValue(bReplaceVariable));
        	if(bReplaceVariable)dataWithoutNBSP=userWeb.replaceVariables(dataWithoutNBSP);
        	dataDB = dataWithoutNBSP;
        }
        Table refTable= column.getReferenceTable();
/**Note : the inputName should not get from model, which is for Query, not this one*/
//                          String inputName=model.getNameForInput(column);
        String inputName=column.getName().toLowerCase();
	    String column_acc_Id="column_"+column.getId();
        
        String type=model.toTypeIndicator(column,column_acc_Id,locale);
        
        if( refTable !=null) {
               inputName=inputName+"__"+ refTable.getAlternateKey().getName().toLowerCase();
               
        }
        int inputSize=bReplaceVariable?model.getSizeForInput(column):4000;// if show variable, which may be script,so should be longer

        nds.util.PairTable values = column.getValues(locale);
        
		if( ds.getColumns()> columnsPerRow-colIdx){      
			// start from first column  
		 	// occupy previous whole row
        	if(colIdx !=0){
        		for(int ri=0;ri< columnsPerRow-colIdx;ri++) out.print("<td></td><td></td>");
        		out.print("</tr><tr>");
        		colIdx=0;
        	}
        	
        }
		colIdx=colIdx+ds.getColumns()-1; 
%>
    <td height="18" width="<%=widthPerColumn*2/3%>%" nowrap align="left" valign='top'>
	<%
	// if button, or checkbox type(modify mode), will not display desc td
	if(!(ds.getObjectType()==DisplaySetting.OBJ_BUTTON ) ){
    %>
    <%=desc%>:
    <%}%>
    </td>
    <td height="18" width="<%=widthPerColumn*4/3%>%" nowrap align="left" valign='top' colspan='<%=(ds.getColumns()-1)*2+1%>'>
      <%
      
    if(values != null){// combox or check
        //Hawke Begin
        StringHashtable o = new StringHashtable();
        o.put( PortletUtils.getMessage(pageContext, "combobox-select",null),"0");
        Iterator i1 = values.keys();
        Iterator i2 = values.values();
        while(i1.hasNext() && i2.hasNext())
        {
            String tmp1 = String.valueOf(i2.next());
            String tmp2 = String.valueOf(i1.next());
            o.put(tmp1,tmp2);
            
            if(data != null && data.equals(tmp1))
                dataValue = tmp2;
        }
        java.util.HashMap a = new java.util.HashMap();
        a.put("id", column_acc_Id);
        //Hawke end
            if(data !=null){
                data=data.trim();
						
                if( column.isModifiable(actionType)){
                	a.put("tabIndex", (++tabIndex)+"");
                	if(ds.getObjectType()==DisplaySetting.OBJ_CHECK && bShowCheckBox){
                    %>
                    <input:checkbox name="<%=inputName%>" default="<%=dataValue%>" value="Y" attributes="<%=a%>" attributesText="class='cbx2'"/>
                    <%}else{%>
                    <input:select name="<%=inputName%>" default="<%=dataValue%>" attributes="<%= a %>" options="<%= o %>" attributesText="<%=fixedColumnMark%>" />
                    <%
                    }
                }else{
                    out.print(data);
                }
            }else{
                if( column.isModifiable(actionType)){
                	a.put("tabIndex", (++tabIndex)+"");
                	String defaultValue=prefs.getProperty(column.getName(),column.getDefaultValue(bReplaceVariable));
                	if(defaultValue==null) defaultValue="0";
                	if(bReplaceVariable) defaultValue=userWeb.replaceVariables(defaultValue);
                	if(ds.getObjectType()==DisplaySetting.OBJ_CHECK&& bShowCheckBox){
                    %>
                    <input:checkbox name="<%=inputName%>" default="<%=defaultValue%>" value="Y" attributes="<%=a%>" attributesText="class='cbx2'"/>
                    <%}else{%>
                    <input:select name="<%=inputName%>" default="<%=defaultValue%>" attributes="<%= a %>" options="<%= o %>" attributesText="<%=fixedColumnMark%>" />
                    <%}
                }else{
                %>
                    <font color='#999999'><%= PortletUtils.getMessage(pageContext, "maintain-by-sys",null)%></font>
                    <%
                }
            }
    }// end if(value != null)
    else{ // begin if value ==null
          if(column.getReferenceTable() !=null){		
    	  	fkQueryModel=new FKObjectQueryModel(column.getReferenceTable(), column_acc_Id,column);
    	  	fkQueryModel.setQueryindex(-1);
    	  }else{
    	  	fkQueryModel=null;
    	  }
    	  
          if( column.isModifiable(actionType)){
			if(dataWithoutNBSP==null && isFixedColumn){
            	// is fixed column, so will be maintained by system
            	dataWithoutNBSP=PortletUtils.getMessage(pageContext, "maintain-by-sys" ,null);
            }
            if( ds.getObjectType()==DisplaySetting.OBJ_TEXT){
	            java.util.Hashtable h = new java.util.Hashtable();
	            h.put("id", column_acc_Id);
	            h.put("size", "" + ds.getCharsPerRow());
	            h.put("maxlength", String.valueOf(inputSize));
	            h.put("tabIndex", (++tabIndex)+"");
	            
	            if((column.getReferenceTable()!=null && column.getReferenceTable().getAlternateKey().isUpperCase())||
	            	column.isUpperCase()){
	            	h.put("class","inputline ucase");
	            }else
	            	h.put("class","inputline");
	            
	            if(fkQueryModel!=null){
	            	//add key catcher 
	            	h.put("onkeydown",fkQueryModel.getKeyEventScript());
	            }
	            %>
	            <input:text name="<%=inputName%>" attributes="<%= h %>" default="<%=dataWithoutNBSP %>" attributesText="<%=fixedColumnMark%>"/><%= type%>
				<%
			}else if( ds.getObjectType()==DisplaySetting.OBJ_TEXTAREA){
	            java.util.Hashtable htextArea = new java.util.Hashtable();
	            htextArea.put("id", column_acc_Id);
	            htextArea.put("cols", ""+ ds.getCharsPerRow());
	            htextArea.put("rows", ""+  ds.getRows());
	            htextArea.put("wrap", "soft");
	            htextArea.put("tabIndex", (++tabIndex)+"");
	            if((column.getReferenceTable()!=null && column.getReferenceTable().getAlternateKey().isUpperCase())||
	            	column.isUpperCase()){
	            	htextArea.put("class","ucase");
	            }
				%>
				<input:textarea name="<%=inputName%>" attributes="<%= htextArea %>" default="<%=dataWithoutNBSP %>" attributesText="<%=fixedColumnMark%>"/><%= type%>
				
    <%      }else if ( ds.getObjectType()==DisplaySetting.OBJ_FILE){
    %>		
    			<input type='hidden' name="<%=inputName%>" value="<%=dataDB==null?"":dataDB%>">
    			<%=dataWithoutNBSP%>
    <%		}else if( ds.getObjectType()==DisplaySetting.OBJ_IMAGE){
    			int maximagewidth= (ds.getColumns()==1?200:500);
    %>
    			<input type='hidden' name="<%=inputName%>" value="<%=dataDB==null?"":dataDB%>">
    			<%if(!nds.util.Validator.isNull((String)dataDB)){%>
    				<a href="<%=dataDB%>"><img border=0 src="<%=dataDB%>" class="img-<%=columnsPerRow%>-<%=ds.getColumns()%>" onmousewheel="resize_img_by_wheel(this);"></a>
    			<%}%>	
    <%  	}else{
    			throw new NDSException("Unexpected condition flow reached for "+ column +"("+ds.getObjectType()+")!"+ ", values="+ values);
    		}
    		// adding button if possible
            if(column.getReferenceTable() !=null){
                if(isFixedColumn==false){
                %>
                <span id="cbt_<%=column.getId()%>"  onaction="<%=fkQueryModel.getButtonClickEventScript()%>"><img border=0 width=16 height=16 align=absmiddle src='<%=fkQueryModel.getImageURL()%>' alt='<%= PortletUtils.getMessage(pageContext, "open-new-page-to-search" ,null)%>'></span>
                <script>createButton(document.getElementById("cbt_<%=column.getId()%>"));</script>
                <%if (coid !=-1){%>
                	<a href='<%=QueryUtils.getTableRowURL(column.getReferenceTable())+"&id="+coid%>'><%= PortletUtils.getMessage(pageContext, "ref-object-view" ,"|")%></a>
                <%}
                }
            }
            if ( ds.getObjectType()==DisplaySetting.OBJ_FILE ||ds.getObjectType()==DisplaySetting.OBJ_IMAGE ){
            %>
            	<a href="javascript:popup_window('<%=NDS_PATH+"/objext/upload.jsp?table="+tableId+"&column="+column.getId()+"&objectid="+objectId%>')"><img border=0 width=16 height=16 align=absmiddle src='<%=NDS_PATH%>/images/attach.gif' alt='<%= PortletUtils.getMessage(pageContext, "open-new-page-to-config" ,null)%>'></a>
            <%
            }
               
        }// end if column isModifiable()
        else{ // begin column not isModifiable()
            if( column.getReferenceTable() !=null){
                if( data==null || "".equals(data)){%> 
                	<font color='#999999'><%= PortletUtils.getMessage(pageContext, "maintain-by-sys" ,null)%></font>
                	
                <%}else{
                	String objectURL=QueryUtils.getTableRowURL(column.getReferenceTable());
                	%>
                 	<a href='<%=objectURL+"&input=false&id="+coid%>'><%=data%></a>
                 <%}
            }else{
                // button check
                if(ds.getObjectType()==DisplaySetting.OBJ_BUTTON){
                	nds.web.button.ButtonCommandUI uic= (nds.web.button.ButtonCommandUI)column.getUIConstructor();
                	out.print( uic.constructHTML(request, column, objectId));
                }else{// not button
	                if( data ==null || "".equals(data)){%>
						<font color='#999999'><%= PortletUtils.getMessage(pageContext, "maintain-by-sys" ,null)%></font>                                    
	                <%}else{
	                	 if (ds.getObjectType()==DisplaySetting.OBJ_IMAGE){
			        			int maximagewidth= (ds.getColumns()==1?200:500);
			        			if(!nds.util.Validator.isNull((String)dataDB)){
	                	 	%>
	                	 	<a href="<%=dataDB%>"><img border=0 src="<%=dataDB%>" class="img-<%=columnsPerRow%>-<%=ds.getColumns()%>" onmousewheel="resize_img_by_wheel(this);"></a>
	                	<%     }
	                	 }else{
	                		if(ds.getObjectType()==DisplaySetting.OBJ_TEXTAREA){
            					java.util.Hashtable htextArea = new java.util.Hashtable();
            					htextArea.put("cols", ""+ ds.getCharsPerRow());
            					htextArea.put("rows", ""+  ds.getRows());
            					htextArea.put("wrap", "soft");
            					htextArea.put("tabIndex", (++tabIndex)+"");
							%>
								<input:textarea name="<%=inputName%>" attributes="<%= htextArea %>" default="<%=dataWithoutNBSP %>" attributesText="readonly class='readonly-text'"/>
							<%}else{	
	                	 	out.print(data);
	                	 	  }
	                	 }
	                }
                }
           }
        }

      }//end if value ==null
                
  %>
    </td>
<%
   if(colIdx%columnsPerRow == (columnsPerRow -1))out.print("</tr>");
   }//if(column.getSQLType()!=22)clob
   } //for(int i=0;i< columns.size();i++)
%>
    
</table>

