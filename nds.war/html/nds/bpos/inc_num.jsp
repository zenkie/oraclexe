<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div id="TMPnum_content">
<table width="400" border="0" cellspacing="0" cellpadding="0"> 
<tbody>
  <tr>
    <td><div id="TMPtreatment_table"><div class="center">
      <table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="103" height="30" align="right"><div class="desc-txt">数量：</div></td>
          <td width="247"><input type="text" id="TMPretail_num
           	<input type="hidden" id="TMPretail_id" name="TMPretail_id" value="" />
          </td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
          <td><input  type="button" class="qinput" value="确定" onclick="javascript:bpos.changnum();"/>
            &nbsp;
            <input  type="button" class="qinput" value="取消" onclick="javascript:bpos.cancelnum();"/></td>
        </tr>
      </table>
    </div></div></td>
  </tr>
</tbody>
</table>
</div>