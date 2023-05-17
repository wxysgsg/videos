!function(a){a(["jquery"],function(a){return function(){function b(a,b,c){return o({type:u.error,iconClass:p().iconClasses.error,message:a,optionsOverride:c,title:b})}function c(b,c){return b||(b=p()),r=a("#"+b.containerId),r.length?r:(c&&(r=l(b)),r)}function d(a,b,c){return o({type:u.info,iconClass:p().iconClasses.info,message:a,optionsOverride:c,title:b})}function e(a){s=a}function f(a,b,c){return o({type:u.success,iconClass:p().iconClasses.success,message:a,optionsOverride:c,title:b})}function g(a,b,c){return o({type:u.warning,iconClass:p().iconClasses.warning,message:a,optionsOverride:c,title:b})}function h(a){var b=p();r||c(b),k(a,b)||j(b)}function i(b){var d=p();return r||c(d),b&&0===a(":focus",b).length?void q(b):void(r.children().length&&r.remove())}function j(b){for(var c=r.children(),d=c.length-1;d>=0;d--)k(a(c[d]),b)}function k(b,c){return b&&0===a(":focus",b).length?(b[c.hideMethod]({duration:c.hideDuration,easing:c.hideEasing,complete:function(){q(b)}}),!0):!1}function l(b){return r=a("<div/>").attr("id",b.containerId).addClass(b.positionClass).attr("aria-live","polite").attr("role","alert"),r.appendTo(a(b.target)),r}function m(){return{tapToDismiss:!0,toastClass:"toast",containerId:"toast-container",debug:!1,showMethod:"fadeIn",showDuration:300,showEasing:"swing",onShown:void 0,hideMethod:"fadeOut",hideDuration:1e3,hideEasing:"swing",onHidden:void 0,extendedTimeOut:1e3,iconClasses:{error:"toast-error",info:"toast-info",success:"toast-success",warning:"toast-warning"},iconClass:"toast-info",positionClass:"toast-top-right",timeOut:5e3,titleClass:"toast-title",messageClass:"toast-message",target:"body",closeHtml:"<button>&times;</button>",newestOnTop:!0}}function n(a){s&&s(a)}function o(b){function d(b){return!a(":focus",j).length||b?j[g.hideMethod]({duration:g.hideDuration,easing:g.hideEasing,complete:function(){q(j),g.onHidden&&"hidden"!==o.state&&g.onHidden(),o.state="hidden",o.endTime=new Date,n(o)}}):void 0}function e(){(g.timeOut>0||g.extendedTimeOut>0)&&(i=setTimeout(d,g.extendedTimeOut))}function f(){clearTimeout(i),j.stop(!0,!0)[g.showMethod]({duration:g.showDuration,easing:g.showEasing})}var g=p(),h=b.iconClass||g.iconClass;"undefined"!=typeof b.optionsOverride&&(g=a.extend(g,b.optionsOverride),h=b.optionsOverride.iconClass||h),t++,r=c(g,!0);var i=null,j=a("<div/>"),k=a("<div/>"),l=a("<div/>"),m=a(g.closeHtml),o={toastId:t,state:"visible",startTime:new Date,options:g,map:b};return b.iconClass&&j.addClass(g.toastClass).addClass(h),b.title&&(k.append(b.title).addClass(g.titleClass),j.append(k)),b.message&&(l.append(b.message).addClass(g.messageClass),j.append(l)),g.closeButton&&(m.addClass("toast-close-button").attr("role","button"),j.prepend(m)),j.hide(),g.newestOnTop?r.prepend(j):r.append(j),j[g.showMethod]({duration:g.showDuration,easing:g.showEasing,complete:g.onShown}),g.timeOut>0&&(i=setTimeout(d,g.timeOut)),j.hover(f,e),!g.onclick&&g.tapToDismiss&&j.click(d),g.closeButton&&m&&m.click(function(a){a.stopPropagation?a.stopPropagation():void 0!==a.cancelBubble&&a.cancelBubble!==!0&&(a.cancelBubble=!0),d(!0)}),g.onclick&&j.click(function(){g.onclick(),d()}),n(o),g.debug&&console&&console.log(o),j}function p(){return a.extend({},m(),v.options)}function q(a){r||(r=c()),a.is(":visible")||(a.remove(),a=null,0===r.children().length&&r.remove())}var r,s,t=0,u={error:"error",info:"info",success:"success",warning:"warning"},v={clear:h,remove:i,error:b,getContainer:c,info:d,options:{},subscribe:e,success:f,version:"2.0.3",warning:g};return v}()})}("function"==typeof define&&define.amd?define:function(a,b){"undefined"!=typeof module&&module.exports?module.exports=b(require("jquery")):window.toastr=b(window.jQuery)});

animates = [
    "bounce",
    "flash",
    "pulse",
    "rubberBand",
    "shake",
    "swing",
    "tada",
    "wobble",
    "jello",
    "bounceIn",
    "bounceInDown",
    "bounceInLeft",
    "bounceInRight",
    "bounceInUp",

    "fadeIn",
    "fadeInDown",
    "fadeInDownBig",
    "fadeInLeft",
    "fadeInLeftBig",
    "fadeInRight",
    "fadeInRightBig",
    "fadeInUp",
    "fadeInUpBig",

    "flip",
    "flipInX",
    "flipInY",

    "lightSpeedIn",

    "rotateIn",
    "rotateInDownLeft",
    "rotateInDownRight",
    "rotateInUpLeft",
    "rotateInUpRight",

    "slideInUp",
    "slideInDown",
    "slideInLeft",
    "slideInRight",

    "zoomIn",
    "zoomInDown",
    "zoomInLeft",
    "zoomInRight",
    "zoomInUp",


    "jackInTheBox",
    "rollIn",

];


function rnd(n, m){
    var random = Math.floor(Math.random()*(m-n+1)+n);
    return random;
}

var a = ["success","info","danger","warning"];
var b = ["success","primary","info","danger","warning","default"];

$(document).ready(function(){


    $("table").removeClass("sTable");

   // $("table").css("background","#fff");
    $("input[type=text],input[type=number],input[type=password],textarea").addClass("form-control");
    $("button,button[type=submit],input[type=submit]").addClass("btn-round  btn btn-primary");
    $("table th").attr("style","");
    $("table td").each(function(){
        $(this).attr("style","");
        var html =$(this).html();
        html = html.replace("[","");
        html = html.replace("[","");
        html = html.replace("[","");	html = html.replace("[","");
        html = html.replace("[","");
        html = html.replace("[","");
        html = html.replace("]","");
        html = html.replace("]","");
        html = html.replace("]","");html = html.replace("]","");
        html = html.replace("]","");
        html = html.replace("|","");
        html = html.replace("|","");
        html = html.replace("|","");
        html = html.replace("|","");
        $(this).html(html);
    });
    $("table").addClass("table table-striped ");
   // $("table td a").addClass("btn btn-"+b[rnd(0,b.length-1)]);
    $(".title h6").addClass("alert alert-" + a[rnd(0, a.length - 1)]);
    $(".container_12").find("p").eq(0).css("width","200px");
    $(".container_12").find("p").eq(0).addClass("label label-" + a[rnd(0, a.length - 1)]);
    $(".nNote").addClass("alert alert-"+a[rnd(0,a.length-1)]);

    $(".widget").css("border-radius","0px");
    //$(".widget").css("padding","20px");
    $(".widget").css("margin","0px");
    //$(".widget").css("marginTop","20px");
    //$("body,table>thead>tr>th,.table thead td,.table>thead>tr>th,table>tr>td,table>tr>td a").css("color","#fff");
    $("table td a,.table-operate a").each(function(){
        $(this).addClass(" btn-round btn- btn btn-"+b[$(this).index()]);
    })
    $(".formRow").css("border","none");
    $(".widget,.table,input,button").each(function () {
        //$(this).addClass(" animated "+animates[rnd(0,animates.length)]);
        $(this).addClass(" animated fadeIn");
    });
    $("form").css("width","50%");
    $(".table thead th").css("background","rgba(63,135,245,0.15);");
	 $(".table thead th").css("color","#222");
    $("table thead tr,thead td").css("font-weight","bold");
    $("table thead td").css("border-bottom","none");
   // $("table,table td").css("border-color","#455360");
    $(".page-content").css("background","none");
    $("body").css("background","#fff"); $("body").css("padding","18px 10px");
    $("table").css("background","#fff");
    $(".page-header").css("border-bottom","none");
    $(".page-header h1").css("color","#455360");
    $(".page-header h1").css("margin-left","0px");
    $(".page-header h1").css("padding-left","10px");
    $(".page-header h1").css("border-left","4px solid #455360");
    $(".form-horizontal .control-label").css("text-align","left");
    $(".form-actions,input.form-control").css("background","none");
    $(".form-actions,input.form-control").css("border","none");
    $(".form-control").css("border","1px solid #ddd");
    $(".card,hr").css("border","none!important");
    $("a.clear,.d-flex a,.card-header,hr,.hr,#breadcrumbs").hide();
    //$(".card").hide();
 //   $("#breadcrumbs,.page-header").hide();
    $(".portlet-title,.title").hide();//addClass("alert alert-" + a[rnd(0, a.length - 1)]);
    $(".tpl-portlet-components").css("width","100%");
    
    $("button[type=submit]").css("margin-top","15px");
    $(".form-group").css({"display":"inline-block","width":"45%"})
});
