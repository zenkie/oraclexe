if(window.moz==true&&(typeof window.emulateAttachEvent!="function"||typeof window.extendEventObject!="function")){alert("Error! IE Emulation file not included.")}if(window.moz){emulateAttachEvent();extendEventObject()}function createButton(a){a.attachEvent("onmouseover",createButton.overCoolButton);a.attachEvent("onmouseout",createButton.outCoolButton);a.attachEvent("onmousedown",createButton.downCoolButton);a.attachEvent("onmouseup",createButton.upCoolButton);a.attachEvent("onclick",createButton.clickCoolButton);a.attachEvent("ondblclick",createButton.clickCoolButton);a.attachEvent("onkeypress",createButton.keypressCoolButton);a.attachEvent("onkeyup",createButton.keyupCoolButton);a.attachEvent("onkeydown",createButton.keydownCoolButton);a.attachEvent("onfocus",createButton.focusCoolButton);a.attachEvent("onblur",createButton.blurCoolButton);a.className="coolButton";a.setEnabled=createButton.setEnabled;a.getEnabled=createButton.getEnabled;a.setValue=createButton.setValue;a.getValue=createButton.getValue;a.setToggle=createButton.setToggle;a.getToggle=createButton.getToggle;a.setAlwaysUp=createButton.setAlwaysUp;a.getAlwaysUp=createButton.getAlwaysUp;a._enabled=true;a._toggle=false;a._value=false;a._alwaysUp=false;return a}createButton.LEFT=window.moz?0:1;createButton.overCoolButton=function(){var a=createButton.getParentCoolButton(window.event.toElement);var b=createButton.getParentCoolButton(window.event.fromElement);if(a==b||a==null){return}a._over=true;if(!a._enabled){return}createButton.setClassName(a)};createButton.outCoolButton=function(){var a=createButton.getParentCoolButton(window.event.toElement);var b=createButton.getParentCoolButton(window.event.fromElement);if(a==b||b==null){return}b._over=false;b._down=false;if(!b._enabled){return}createButton.setClassName(b)};createButton.downCoolButton=function(){if(window.event.button!=createButton.LEFT){return}var a=createButton.getParentCoolButton(window.event.srcElement);if(a==null){return}a._down=true;if(!a._enabled){return}createButton.setClassName(a)};createButton.upCoolButton=function(){if(window.event.button!=createButton.LEFT){return}var a=createButton.getParentCoolButton(window.event.srcElement);if(a==null){return}a._down=false;if(!a._enabled){return}if(a._toggle){a.setValue(!a._value)}else{createButton.setClassName(a)}};createButton.clickCoolButton=function(){var a=createButton.getParentCoolButton(window.event.srcElement);a.onaction=a.getAttribute("onaction");if(a==null||!a._enabled||a.onaction==""||a.onaction==null){return}if(typeof a.onaction=="string"){a.onaction=new Function("event",a.onaction)}a.onaction(window.event)};createButton.keypressCoolButton=function(){var a=createButton.getParentCoolButton(window.event.srcElement);if(a==null||!a._enabled||window.event.keyCode!=13){return}a.setValue(!a._value);if(a.onaction==null){return}if(typeof a.onaction=="string"){a.onaction=new Function("event",a.onaction)}a.onaction(window.event)};createButton.keydownCoolButton=function(){var a=createButton.getParentCoolButton(window.event.srcElement);if(a==null||!a._enabled||window.event.keyCode!=32){return}createButton.downCoolButton()};createButton.keyupCoolButton=function(){var a=createButton.getParentCoolButton(window.event.srcElement);if(a==null||!a._enabled||window.event.keyCode!=32){return}createButton.upCoolButton();if(a.onaction==null){return}if(typeof a.onaction=="string"){a.onaction=new Function("event",a.onaction)}a.onaction(window.event)};createButton.focusCoolButton=function(){var a=createButton.getParentCoolButton(window.event.srcElement);if(a==null||!a._enabled){return}createButton.setClassName(a)};createButton.blurCoolButton=function(){var a=createButton.getParentCoolButton(window.event.srcElement);if(a==null){return}createButton.setClassName(a)};createButton.getParentCoolButton=function(b){if(b==null){return null}try{if(/coolButton/.test(b.className)){return b}return createButton.getParentCoolButton(b.parentNode)}catch(a){return null}};createButton.setClassName=function(b){var d=b._over;var e=b._down;var c;try{c=(b==document.activeElement&&b.tabIndex>0)}catch(a){c=false}if(!b._enabled){if(b._value){b.className="coolButtonActiveDisabled"}else{b.className=b._alwaysUp?"coolButtonUpDisabled":"coolButtonDisabled"}}else{if(b._value){if(d||e||c){b.className="coolButtonActiveHover"}else{b.className="coolButtonActive"}}else{if(e){b.className="coolButtonActiveHover"}else{if(d||b._alwaysUp||c){b.className="coolButtonHover"}else{b.className="coolButton"}}}}};createButton.setEnabled=function(a){if(this._enabled!=a){this._enabled=a;createButton.setClassName(this,false,false);if(!window.moz){if(a){this.innerHTML=this.firstChild.firstChild.innerHTML}else{this.innerHTML="<span class='coolButtonDisabledContainer'><span class='coolButtonDisabledContainer'>"+this.innerHTML+"</span></span>"}}}};createButton.getEnabled=function(){return this._enabled};createButton.setValue=function(a,b){if(this._toggle&&this._value!=a){this._value=a;createButton.setClassName(this,false,false);this.onchange=this.getAttribute("onchange");if(this.onchange==null||this.onchange==""||b){return}if(typeof this.onchange=="string"){this.onchange=new Function("",this.onchange)}this.onchange()}};createButton.getValue=function(){return this._value};createButton.setToggle=function(a){if(this._toggle!=a){this._toggle=a;if(!a){this.setValue(false)}}};createButton.getToggle=function(){return this._toggle};createButton.setAlwaysUp=function(a){if(this._alwaysUp!=a){this._alwaysUp=a;createButton.setClassName(this,false,false)}};createButton.getAlwaysUp=function(){return this._alwaysUp};