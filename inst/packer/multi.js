/*! For license information please see multi.js.LICENSE.txt */
(()=>{"use strict";var e={3822:(e,t,r)=>{r.d(t,{Z:()=>l});var n=r(8081),a=r.n(n),i=r(3645),o=r.n(i)()(a());o.push([e.id,".multi-wrapper{border:1px solid #ccc;border-radius:3px;width:100%}.multi-wrapper .non-selected-wrapper,.multi-wrapper .selected-wrapper{box-sizing:border-box;display:inline-block;height:200px;overflow-y:scroll;padding:10px;vertical-align:top;width:50%}.multi-wrapper .non-selected-wrapper{background:#fafafa;border-right:1px solid #ccc}.multi-wrapper .selected-wrapper{background:#fff}.multi-wrapper .header{color:#4f4f4f;cursor:default;font-weight:700;margin-bottom:5px;padding:5px 10px}.multi-wrapper .item{cursor:pointer;display:block;padding:5px 10px}.multi-wrapper .item:hover{background:#ececec;border-radius:2px}.multi-wrapper .item-group{padding:5px 10px}.multi-wrapper .item-group .group-label{display:block;font-size:.875rem;opacity:.5;padding:5px 0}.multi-wrapper .search-input{border:0;border-bottom:1px solid #ccc;border-radius:0;display:block;font-size:1em;margin:0;outline:0;padding:10px 20px;width:100%;box-sizing:border-box}.multi-wrapper .non-selected-wrapper .item.selected{opacity:.5}.multi-wrapper .non-selected-wrapper .item.disabled,.multi-wrapper .selected-wrapper .item.disabled{opacity:.5;text-decoration:line-through}.multi-wrapper .non-selected-wrapper .item.disabled:hover,.multi-wrapper .selected-wrapper .item.disabled:hover{background:inherit;cursor:inherit}",""]);const l=o},1629:(e,t,r)=>{r.d(t,{Z:()=>l});var n=r(8081),a=r.n(n),i=r(3645),o=r.n(i)()(a());o.push([e.id,"a.item:focus, a.item:hover {\n  text-decoration: none;\n}\n",""]);const l=o},3645:e=>{e.exports=function(e){var t=[];return t.toString=function(){return this.map((function(t){var r="",n=void 0!==t[5];return t[4]&&(r+="@supports (".concat(t[4],") {")),t[2]&&(r+="@media ".concat(t[2]," {")),n&&(r+="@layer".concat(t[5].length>0?" ".concat(t[5]):""," {")),r+=e(t),n&&(r+="}"),t[2]&&(r+="}"),t[4]&&(r+="}"),r})).join("")},t.i=function(e,r,n,a,i){"string"==typeof e&&(e=[[null,e,void 0]]);var o={};if(n)for(var l=0;l<this.length;l++){var s=this[l][0];null!=s&&(o[s]=!0)}for(var d=0;d<e.length;d++){var p=[].concat(e[d]);n&&o[p[0]]||(void 0!==i&&(void 0===p[5]||(p[1]="@layer".concat(p[5].length>0?" ".concat(p[5]):""," {").concat(p[1],"}")),p[5]=i),r&&(p[2]?(p[1]="@media ".concat(p[2]," {").concat(p[1],"}"),p[2]=r):p[2]=r),a&&(p[4]?(p[1]="@supports (".concat(p[4],") {").concat(p[1],"}"),p[4]=a):p[4]="".concat(a)),t.push(p))}},t}},8081:e=>{e.exports=function(e){return e[1]}},3379:e=>{var t=[];function r(e){for(var r=-1,n=0;n<t.length;n++)if(t[n].identifier===e){r=n;break}return r}function n(e,n){for(var i={},o=[],l=0;l<e.length;l++){var s=e[l],d=n.base?s[0]+n.base:s[0],p=i[d]||0,c="".concat(d," ").concat(p);i[d]=p+1;var u=r(c),m={css:s[1],media:s[2],sourceMap:s[3],supports:s[4],layer:s[5]};if(-1!==u)t[u].references++,t[u].updater(m);else{var h=a(m,n);n.byIndex=l,t.splice(l,0,{identifier:c,updater:h,references:1})}o.push(c)}return o}function a(e,t){var r=t.domAPI(t);return r.update(e),function(t){if(t){if(t.css===e.css&&t.media===e.media&&t.sourceMap===e.sourceMap&&t.supports===e.supports&&t.layer===e.layer)return;r.update(e=t)}else r.remove()}}e.exports=function(e,a){var i=n(e=e||[],a=a||{});return function(e){e=e||[];for(var o=0;o<i.length;o++){var l=r(i[o]);t[l].references--}for(var s=n(e,a),d=0;d<i.length;d++){var p=r(i[d]);0===t[p].references&&(t[p].updater(),t.splice(p,1))}i=s}}},569:e=>{var t={};e.exports=function(e,r){var n=function(e){if(void 0===t[e]){var r=document.querySelector(e);if(window.HTMLIFrameElement&&r instanceof window.HTMLIFrameElement)try{r=r.contentDocument.head}catch(e){r=null}t[e]=r}return t[e]}(e);if(!n)throw new Error("Couldn't find a style target. This probably means that the value for the 'insert' parameter is invalid.");n.appendChild(r)}},9216:e=>{e.exports=function(e){var t=document.createElement("style");return e.setAttributes(t,e.attributes),e.insert(t,e.options),t}},3565:(e,t,r)=>{e.exports=function(e){var t=r.nc;t&&e.setAttribute("nonce",t)}},7795:e=>{e.exports=function(e){var t=e.insertStyleElement(e);return{update:function(r){!function(e,t,r){var n="";r.supports&&(n+="@supports (".concat(r.supports,") {")),r.media&&(n+="@media ".concat(r.media," {"));var a=void 0!==r.layer;a&&(n+="@layer".concat(r.layer.length>0?" ".concat(r.layer):""," {")),n+=r.css,a&&(n+="}"),r.media&&(n+="}"),r.supports&&(n+="}");var i=r.sourceMap;i&&"undefined"!=typeof btoa&&(n+="\n/*# sourceMappingURL=data:application/json;base64,".concat(btoa(unescape(encodeURIComponent(JSON.stringify(i))))," */")),t.styleTagTransform(n,e,t.options)}(t,e,r)},remove:function(){!function(e){if(null===e.parentNode)return!1;e.parentNode.removeChild(e)}(t)}}}},4589:e=>{e.exports=function(e,t){if(t.styleSheet)t.styleSheet.cssText=e;else{for(;t.firstChild;)t.removeChild(t.firstChild);t.appendChild(document.createTextNode(e))}}}},t={};function r(n){var a=t[n];if(void 0!==a)return a.exports;var i=t[n]={id:n,exports:{}};return e[n](i,i.exports,r),i.exports}r.n=e=>{var t=e&&e.__esModule?()=>e.default:()=>e;return r.d(t,{a:t}),t},r.d=(e,t)=>{for(var n in t)r.o(t,n)&&!r.o(e,n)&&Object.defineProperty(e,n,{enumerable:!0,get:t[n]})},r.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),(()=>{const e=jQuery;var t=r.n(e);Shiny;var n,a,i,o=(n=function(e,t){var r=t.limit;if(r>-1){for(var n=0,a=0;a<e.options.length;a++)e.options[a].selected&&n++;if(n===r)for(this.disabled_limit=!0,"function"==typeof t.limit_reached&&t.limit_reached(),a=0;a<e.options.length;a++)(i=e.options[a]).selected||i.setAttribute("disabled",!0);else if(this.disabled_limit){for(a=0;a<e.options.length;a++){var i;"false"===(i=e.options[a]).getAttribute("data-origin-disabled")&&i.removeAttribute("disabled")}this.disabled_limit=!1}}},a=function(e,t,r){var a,i,o=e.options[t.target.getAttribute("multi-index")];o.disabled||(o.selected=!o.selected,n(e,r),a=e,(i=document.createEvent("HTMLEvents")).initEvent("change",!1,!0),a.dispatchEvent(i))},i=function(e,t){if(e.wrapper.selected.innerHTML="",e.wrapper.non_selected.innerHTML="",t.non_selected_header&&t.selected_header){var r=document.createElement("div"),n=document.createElement("div");r.className="header",n.className="header",r.innerText=t.non_selected_header,n.innerText=t.selected_header,e.wrapper.non_selected.appendChild(r),e.wrapper.selected.appendChild(n)}if(e.wrapper.search)var a=e.wrapper.search.value;for(var i=null,o=null,l=0;l<e.options.length;l++){var s=e.options[l],d=s.value,p=s.textContent||s.innerText,c=document.createElement("a");if(c.tabIndex=0,c.className="item",c.innerText=p,c.setAttribute("role","button"),c.setAttribute("data-value",d),c.setAttribute("multi-index",l),s.disabled&&(c.className+=" disabled"),s.selected){c.className+=" selected";var u=c.cloneNode(!0);e.wrapper.selected.appendChild(u)}if("OPTGROUP"==s.parentNode.nodeName&&s.parentNode!=o){if(o=s.parentNode,(i=document.createElement("div")).className="item-group",s.parentNode.label){var m=document.createElement("span");m.innerHTML=s.parentNode.label,m.className="group-label",i.appendChild(m)}e.wrapper.non_selected.appendChild(i)}s.parentNode==e&&(i=null,o=null),(!a||a&&p.toLowerCase().indexOf(a.toLowerCase())>-1)&&(null!=i?i.appendChild(c):e.wrapper.non_selected.appendChild(c))}if(t.hide_empty_groups){var h=document.getElementsByClassName("item-group");for(l=0;l<h.length;l++)h[l].childElementCount<2&&(h[l].style.display="none")}},function(e,t){if((t=void 0!==t?t:{}).enable_search=void 0===t.enable_search||t.enable_search,t.search_placeholder=void 0!==t.search_placeholder?t.search_placeholder:"Search...",t.non_selected_header=void 0!==t.non_selected_header?t.non_selected_header:null,t.selected_header=void 0!==t.selected_header?t.selected_header:null,t.limit=void 0!==t.limit?parseInt(t.limit):-1,isNaN(t.limit)&&(t.limit=-1),t.hide_empty_groups=void 0!==t.hide_empty_groups&&t.hide_empty_groups,null==e.dataset.multijs&&"SELECT"==e.nodeName&&e.multiple){e.style.display="none",e.setAttribute("data-multijs",!0);var r=document.createElement("div");if(r.className="multi-wrapper",t.enable_search){var o=document.createElement("input");o.className="search-input",o.type="text",o.setAttribute("placeholder",t.search_placeholder),o.setAttribute("title",t.search_placeholder),o.addEventListener("input",(function(){i(e,t)})),r.appendChild(o),r.search=o}var l=document.createElement("div");l.className="non-selected-wrapper";var s=document.createElement("div");s.className="selected-wrapper",r.addEventListener("click",(function(r){r.target.getAttribute("multi-index")&&a(e,r,t)})),r.addEventListener("keypress",(function(r){var n=32===r.keyCode||13===r.keyCode;r.target.getAttribute("multi-index")&&n&&(r.preventDefault(),a(e,r,t))})),r.appendChild(l),r.appendChild(s),r.non_selected=l,r.selected=s,e.wrapper=r,e.parentNode.insertBefore(r,e.nextSibling);for(var d=0;d<e.options.length;d++){var p=e.options[d];p.setAttribute("data-origin-disabled",p.disabled)}n(e,t),i(e,t),e.addEventListener("change",(function(){i(e,t)}))}});"undefined"!=typeof jQuery&&function(e){e.fn.multi=function(t){return t=void 0!==t?t:{},this.each((function(){var r=e(this);o(r.get(0),t)}))}}(jQuery);var l=r(3379),s=r.n(l),d=r(7795),p=r.n(d),c=r(569),u=r.n(c),m=r(3565),h=r.n(m),f=r(9216),v=r.n(f),b=r(4589),g=r.n(b),y=r(3822),w={};w.styleTagTransform=g(),w.setAttributes=h(),w.insert=u().bind(null,"head"),w.domAPI=p(),w.insertStyleElement=v(),s()(y.Z,w),y.Z&&y.Z.locals&&y.Z.locals;var x=r(1629),_={};_.styleTagTransform=g(),_.setAttributes=h(),_.insert=u().bind(null,"head"),_.domAPI=p(),_.insertStyleElement=v(),s()(x.Z,_),x.Z&&x.Z.locals&&x.Z.locals;var E=new Shiny.InputBinding;t().extend(E,{initialize:function(e){var r=t()(e).parent().find('script[data-for="'+Shiny.$escape(e.id)+'"]');r=JSON.parse(r.html()),t()(e).multi(r),t()(e).trigger("change")},find:function(e){return t()(e).find(".multijs")},getId:function(e){return e.id},getValue:function(e){return t()(e).val()},setValue:function(e,r){t()(e).val(r),t()(e).multi(),t()(e).trigger("change")},getState:function(e){for(var r=new Array(e.length),n=0;n<e.length;n++)r[n]={value:e[n].value,label:e[n].label};return{label:t()(e).parent().find('label[for="'+Shiny.$escape(e.id)+'"]').text(),value:this.getValue(e),options:r}},receiveMessage:function(e,r){var n=t()(e);r.hasOwnProperty("options")&&n.empty().append(r.options),r.hasOwnProperty("value")&&this.setValue(e,r.value),r.hasOwnProperty("label")&&t()(e).parent().parent().find('label[for="'+Shiny.$escape(e.id)+'"]').text(r.label);var a=new Event("change");t()(e).multi(),n.get(0).dispatchEvent(a),n.trigger("change")},subscribe:function(e,r){t()(e).on("change",(function(e){r()}))},unsubscribe:function(e){t()(e).off(".multiInputBinding")}}),Shiny.inputBindings.register(E,"shinyWidgets.multiInput")})()})();