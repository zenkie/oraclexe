var submitCountdown=0;function check(d,a,c){for(var b=0;b<d.elements.length;b++){var f=d.elements[b];if((f.name==a)&&(f.type=="checkbox")){f.checked=c}}}function checkAll(f,c,a){if(checkIsArray(c)){for(var d=0;d<f.elements.length;d++){var g=f.elements[d];if(g.type=="checkbox"){for(var b=0;b<c.length;b++){if(g.name==c[b]){g.checked=a.checked}}}}}else{for(var d=0;d<f.elements.length;d++){var g=f.elements[d];if((g.name==c)&&(g.type=="checkbox")){g.checked=a.checked}}}}function checkAllBox(f,c,a){var k=0;var h=0;if(checkIsArray(c)){for(var d=0;d<f.elements.length;d++){var g=f.elements[d];if((g.name!=a.name)&&(g.type=="checkbox")){for(var b=0;b<c.length;b++){if(g.name==c[b]){k++;if(g.checked){h++}}}}}}else{for(var d=0;d<f.elements.length;d++){var g=f.elements[d];if((g.name!=a.name)&&(g.name==c)&&(g.type=="checkbox")){k++;if(g.checked){h++}}}}if(k==h){a.checked=true}else{a.checked=false}}function checkMaxLength(b,a){if((b.value.length)>=a){b.value=b.value.substring(0,a-1)}}function checkTab(a){if((document.all)&&(event.keyCode==9)){a.selection=document.selection.createRange();setTimeout('processTab("'+a.id+'")',0)}}function cloneObject(b,a){for(i in b){if(typeof b[i]=="object"&&a){this[i]=new cloneObject(b[i],true)}else{this[i]=b[i]}}}var Cookie={create:function(c,d,e){if(e){var b=new Date();b.setTime(b.getTime()+(e*24*60*60*1000));var a="; expires="+b.toGMTString()}else{var a=""}document.cookie=c+"="+d+a+"; path=/"},read:function(b){var e=b+"=";var a=document.cookie.split(";");for(var d=0;d<a.length;d++){var f=a[d];while(f.charAt(0)==" "){f=f.substring(1,f.length)}if(f.indexOf(e)==0){return f.substring(e.length,f.length)}}return null},erase:function(a){createCookie(a,"",-1)}};document.createInputElement=function(a){if(is_ie){var b=document.createElement("<input name='"+a+"'></input>")}else{var b=document.createElement("input");b.name=a}return b};function disableEsc(){if((document.all)&&(event.keyCode==27)){event.returnValue=false}}if(typeof(Element)=="undefined"){Element=new Object()}Element.disable=function(c){c=$(c);var a=c.getElementsByTagName("*");for(var b=0;b<a.length;b++){var d=a[b];var e=d.nodeName.toLowerCase();d.onclick=function(){};d.onmouseover=function(){};d.onmouseout=function(){};if(is_ie){d.onmouseenter=function(){};d.onmouseleave=function(){}}if(e=="a"){d.href="javascript: void(0)"}else{if(e=="input"||e=="select"||e=="script"){d.disabled="true"}else{if(e=="form"){d.action="";d.onsubmit=function(){return false}}}}d.style.cursor="default"}};Element.changeOpacity=function(b,a){a=(a>=100)?99.999:a;a=(a<0)?0:a;b.style.opacity=(a/100);b.style.MozOpacity=(a/100);b.style.KhtmlOpacity=(a/100);b.style.filter="alpha(opacity="+a+")"};if(typeof(Event)=="undefined"){Event=new Object()}Event.addHandler=function(d,b,c){if(b.indexOf("on")!=0){b="on"+b}var a=d[b];if(typeof d[b]!="function"){d[b]=c}else{d[b]=function(){if(a){a()}c()}}};Event.enterPressed=function(b){if(!b){b=window.event}var a=b.keyCode;if(a==13){return true}else{return false}};function getSelectedIndex(a){for(var b=0;b<a.length;b++){if(a[b].checked==true){return b}}return -1}function getSelectedRadioName(a){var b=getSelectedIndex(a);if(b==-1){var c=a.name;if(c==null){c=""}return c}else{return a[b].name}}function getSelectedRadioValue(b){var c=getSelectedIndex(b);if(c==-1){var a=b.value;if(a==null){a=""}return a}else{return b[c].value}}function checkIsArray(a){if(!window.Array){return false}else{return a.constructor==window.Array}}function LinkedList(){this.head=null;this.tail=null}LinkedList.prototype.add=function(c){c.listInfo=new Object();var a=this.tail;var b=this.head;if(this.head==null){this.head=c;this.tail=c}else{this.tail.listInfo.next=c;c.listInfo.prev=this.tail;this.tail=c}};LinkedList.prototype.remove=function(c){if(this.head){var a=c.listInfo.next;var b=c.listInfo.prev;if(a){a.listInfo.prev=b}if(b){b.listInfo.next=a}if(this.head=c){this.head=a}if(this.tail=c){this.tail=b}}};LinkedList.prototype.each=function(c){var d=this.head;var b=0;while(d){b++;var a=d.listInfo.next;if(c){c(d)}d=a}return b};LinkedList.prototype.size=function(){return this.each()};function listChecked(c){var b="";for(var a=0;a<c.elements.length;a++){var d=c.elements[a];if((d.type=="checkbox")&&(d.checked==true)&&(d.value>"")){b+=d.value+","}}return b}function listCheckedExcept(d,c){var b="";for(var a=0;a<d.elements.length;a++){var f=d.elements[a];if((f.type=="checkbox")&&(f.checked==true)&&(f.value>"")&&(f.name.indexOf(c)!=0)){b+=f.value+","}}return b}function listSelect(d,a){var c="";if(a==null){a=","}if(d==null){return""}for(var b=0;b<d.length;b++){if(d.options[b].value>""){c+=d.options[b].value+a}}if(c==".none,"){return""}else{return c}}function listUnchecked(c){var b="";for(var a=0;a<c.elements.length;a++){var d=c.elements[a];if((d.type=="checkbox")&&(d.checked==false)&&(d.value>"")){b+=d.value+","}}return b}function listUncheckedExcept(d,c){var b="";for(var a=0;a<d.elements.length;a++){var f=d.elements[a];if((f.type=="checkbox")&&(f.checked==false)&&(f.value>"")&&(f.name.indexOf(c)!=0)){b+=f.value+","}}return b}function moveItem(a,b,e){var g=null;var h=null;var f=null;if(a.selectedIndex>=0){for(var d=0;d<a.length;d++){if(a.options[d].selected){g=a.options[d].text;h=a.options[d].value;f=new Option(g,h);b[b.length]=f}}for(var d=0;d<b.length;d++){for(var c=0;c<a.length;c++){if(a[c].value==b[d].value){a[c]=null;break}}}}if(g!=null){if(e==true){sortBox(b)}}}function processTab(a){document.getElementById(a).selection.text=String.fromCharCode(9);document.getElementById(a).focus()}function reelHome(a,l,k,d,f,h){if(isNaN(l)||isNaN(k)){return}var e=document.getElementById(a);if(e==null){return}var j=parseInt(e.style.top,10);var b=parseInt(e.style.left,10);if(f==null){f=1}if(d==null){d==20}if(h==null){h=Math.PI/(2*d);e.style.zIndex=10}if(f<d){var g=1-Math.sin(f*h);e.style.left=(l*g)+"px";e.style.top=(k*g)+"px";setTimeout('reelHome("'+a+'",'+l+","+k+","+d+","+(++f)+","+h+")",16)}else{e.style.top="0px";e.style.left="0px";e.style.zIndex=0}}function removeItem(b,c){if(c==null){for(var a=b.length-1;a>=0;a--){if(b.options[a].selected){b[a]=null}}}else{for(var a=b.length-1;a>=0;a--){if(b.options[a].value==c){b[a]=null}}}}function reorder(d,e){var b=d.selectedIndex;if(b==-1){d.selectedIndex=0}else{sText=d.options[b].text;sValue=d.options[b].value;if((d.options[b].value>"")&&(b>0)&&(e==0)){d.options[b].text=d.options[b-1].text;d.options[b].value=d.options[b-1].value;d.options[b-1].text=sText;d.options[b-1].value=sValue;d.selectedIndex--}else{if((b<d.length-1)&&(d.options[b+1].value>"")&&(e==1)){d.options[b].text=d.options[b+1].text;d.options[b].value=d.options[b+1].value;d.options[b+1].text=sText;d.options[b+1].value=sValue;d.selectedIndex++}else{if(b==0){for(var c=0;c<(d.length-1);c++){d.options[c].text=d.options[c+1].text;d.options[c].value=d.options[c+1].value}d.options[d.length-1].text=sText;d.options[d.length-1].value=sValue;d.selectedIndex=d.length-1}else{if(b==(d.length-1)){for(var a=(d.length-1);a>0;a--){d.options[a].text=d.options[a-1].text;d.options[a].value=d.options[a-1].value}d.options[0].text=sText;d.options[0].value=sValue;d.selectedIndex=0}}}}}}function resubmitCountdown(b){if(submitCountdown>0){submitCountdown--;setTimeout("resubmitCountdown('"+b+"')",1000)}else{submitCountdown=0;if(!is_ns_4){document.body.style.cursor="auto"}var c=document.forms[b];for(var a=0;a<c.length;a++){var d=c.elements[a];if(d.type&&(d.type.toLowerCase()=="button"||d.type.toLowerCase()=="reset"||d.type.toLowerCase()=="submit")){d.disabled=false}}}}function selectAndCopy(a){a.focus();a.select();if(document.all){var b=a.createTextRange();b.execCommand("copy")}}function setBox(c,a){for(var b=c.length-1;b>-1;b--){c.options[b]=null}for(var b=0;b<a.length;b++){c.options[b]=new Option(a[b].value,b)}c.options[0].selected=true}function setCursorPosition(d,c,b){if(d.setSelectionRange){d.setSelectionRange(c,b)}else{if(d.createTextRange){var a=d.createTextRange();a.collapse(true);a.moveEnd("character",b);a.moveStart("character",c);a.select()}}}function setSelectedValue(a,c){for(var b=0;b<a.length;b++){if((a[b].value!="")&&(a[b].value==c)){a.selectedIndex=b;break}}}function setSelectVisibility(c,b){if(is_ie){if(b){b=$(b)}else{b=document.getElementsByTagName("body")[0]}selectList=b.getElementsByTagName("select");for(var a=0;a<selectList.length;a++){selectList[a].style.visibility=c}}}function slideMaximize(e,b,c){var d=document.getElementById(e);var a=d.getElementsByTagName("DIV")[0];b+=c;if(b<(a.offsetHeight)){d.style.height=b+"px";setTimeout('slideMaximize("'+e+'",'+b+","+c+")",10)}else{d.style.overflow="";d.style.height=""}}function slideMinimize(d,a,b){var c=document.getElementById(d);a-=b;if(a>0){c.style.height=a+"px";setTimeout('slideMinimize("'+d+'",'+a+","+b+")",10)}else{c.style.display="none"}}function sortBox(c){var a=new Array();for(var b=0;b<c.length;b++){a[b]=new Array(c[b].value,c[b].text)}a.sort(sortByAscending);for(var b=c.length-1;b>-1;b--){c.options[b]=null}for(var b=0;b<a.length;b++){c.options[c.length]=new Option(a[b][1],a[b][0])}}function sortByAscending(d,c){if(d[1].toLowerCase()>c[1].toLowerCase()){return 1}else{if(d[1].toLowerCase()<c[1].toLowerCase()){return -1}else{return 0}}}function sortByDescending(d,c){if(d[1].toLowerCase()>c[1].toLowerCase()){return -1}else{if(d[1].toLowerCase()<c[1].toLowerCase()){return 1}else{return 0}}}function submitForm(c,d,a){if(submitCountdown==0){submitCountdown=10;setTimeout("resubmitCountdown('"+c.name+"')",1000);if(a==null||a){submitCountdown++;for(var b=0;b<c.length;b++){var f=c.elements[b];if(f.type&&(f.type.toLowerCase()=="button"||f.type.toLowerCase()=="reset"||f.type.toLowerCase()=="submit")){f.disabled=true}}}if(d!=null){c.action=d}if(!is_ns_4){document.body.style.cursor="wait"}c.submit()}else{if(this.submitFormAlert!=null){submitFormAlert(submitCountdown)}}}if(is_ns_4){encodeURIComponent=new function(a){return escape(a)};decodeURIComponent=new function(a){return unescape(a)}}function startsWith(b,a){if(b.indexOf(a)==0){return true}else{return false}}function endsWith(b,a){if(b.lastIndexOf(a)==b.length-a.length){return true}else{return false}}function toHTML(a){a=a.replace(/\&/g,"&amp;");a=a.replace(/</g,"&lt;");a=a.replace(/>/g,"&gt;");a=a.replace(/\n/g,"<br>");a=a.replace(/  /g," &nbsp;");return a}function toText(a){a=a.replace(/\&nbsp;/gi," ");a=a.replace(/<br>/gi,"\n");a=a.replace(/&gt;/gi,">");a=a.replace(/\&lt;/gi,"<");a=a.replace(/\&amp;/gi,"&");return a}function toggleById(d,b,a){var c=document.getElementById(d);if(b){return toggleByObject(c,b,a)}else{toggleByObject(c,null,a)}}function toggleByIdSpan(c,d){var b=toggleById(d,true);var a=c.getElementsByTagName("span");if(b){a[0].style.display="none";a[1].style.display=""}else{a[0].style.display="";a[1].style.display="none"}}function toggleByObject(e,b,a){var c=false;var d="block";if(a!=null){d=a}if(e!=null){if(!e.style.display||!e.style.display.toLowerCase().match("none")){e.style.display="none"}else{e.style.display=d;c=true}}if(b){return c}}function trimString(b){b=b.replace(/^\s+/g,"").replace(/\s+$/g,"");var a=b.charCodeAt(0);while(a==160){b=b.substring(1,b.length);a=b.charCodeAt(0)}a=b.charCodeAt(b.length-1);while(a==160){b=b.substring(0,b.length-1);a=b.charCodeAt(b.length-1)}return b}String.prototype.trim=trimString;var Viewport={frame:function(){var a,b;if(self.innerHeight){a=self.innerWidth;b=self.innerHeight}else{if(document.documentElement&&document.documentElement.clientHeight){a=document.documentElement.clientWidth;b=document.documentElement.clientHeight}else{if(document.body){a=document.body.clientWidth;b=document.body.clientHeight}}}return(new Coordinate(a,b))},scroll:function(){var a,b;if(self.pageYOffset){a=self.pageXOffset;b=self.pageYOffset}else{if(document.documentElement&&document.documentElement.scrollTop){a=document.documentElement.scrollLeft;b=document.documentElement.scrollTop}else{if(document.body){a=document.body.scrollLeft;b=document.body.scrollTop}}}return(new Coordinate(a,b))},page:function(){var a,d;var c=document.body.scrollHeight;var b=document.body.offsetHeight;if(c>b){a=document.body.scrollWidth;d=document.body.scrollHeight}else{a=document.body.offsetWidth;d=document.body.offsetHeight}return(new Coordinate(a,d))}};var ZINDEX={ALERT:100,CHAT_BOX:11,DRAG_ITEM:10,DRAG_ARROW:9};
function zeroize(v,len){
	 if (!len) len = 2;     
      v = String(v); 
      for (var i = 0, zeros = ''; i < (len - v.length); i++) {
          zeros += '0'; 
      }     
   return zeros + v;    
}