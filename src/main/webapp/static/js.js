
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
var b = ["success","primary","info","danger","warning"];
$(document).ready(function(){	
	$("table").removeClass("sTable");
	
	//$("table").css("background","#fff");
	$("select,input[type=number],input[type=text],input[type=password],textarea").addClass("form-control");
	$("button,input[type=submit]").addClass("btn btn-"+b[3]);
	$("table th").attr("style","");
	
	$("table th").each(function(){
		$(this).attr("style","text-align:left");
	});
	
	$("table td").each(function(){
		$(this).find("label").attr("style","display:block;width:150px;");
		$(this).attr("style","text-align:left");
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
	$("table").addClass("table table-bordered  row-hover ");
	
	//$(".block a,table td a").addClass("btn btn-"+b[0]);
	$(".block a,table td a").css("color","#fff");
	$(".box h2,.title h6").addClass("alert alert-" + a[rnd(0, a.length - 1)]);
	$(".container_12").find("p").eq(0).css("width","200px");
	$(".container_12").find("p").eq(0).addClass("label label-" + a[rnd(0, a.length - 1)]);
	$(".nNote").addClass("alert alert-"+a[rnd(0,a.length-1)]);
	
	$(".widget").css("border-radius","0px");
	$(".widget").css("padding","20px");
	$(".widget").css("margin","0px");
	$(".widget").css("marginTop","20px");
	//$("body,table>thead>tr>th,.table thead td,.table>thead>tr>th,table>tr>td,table>tr>td a").css("color","#fff");
	$("table td a,.table-operate a").each(function(){
		$(this).addClass("button btn btn-sm btn-"+b[$(this).index()]);
	})
	$(".formRow").css("border","none");
	 $(".widget,.table,input,button").each(function () {
         //$(this).addClass(" animated "+animates[rnd(0,animates.length)]);
		 $(this).addClass(" animated fadeIn");
     });
	 $(".title").hide();
	 $("form").css("width","50%");
	 $("table td.col1").css("width","200px");
	// $(".table thead th").css("background","rgba(63,135,245,0.15)");
	 $(".table thead th").css("color","#FFF");
	 $(".table thead td").css("color","#FFF");
	// $(".table thead ").css("background-color","rgba(63,135,245,0.15)");
	 $(".table thead ").css("color","#222");
	 $(" table td").css("color","#FFF");
	 $("form label,.portlet-title").css("color","#FFF");
	 $("body").css("background","none")
	 
	 $(" table td").css("text-align","left");
	 $("form table td").css("text-align","left");
	 $(".box h2").css("display","none");
	 $(".tpl-portlet-components").css("width","100%");
	 $("body").css("padding","15px");
	 $("a.clear,.table-operate").hide();
	 $(".long-input.ue-clear,.short-input.ue-clear").css("margin-bottom","3px");
	 
	 $("button[type=submit]").css("margin-top","25px");
	 
	 $(".caption ").css({"font-size":"16px","font-weight":"bold","padding":"20px 0"});
	 $("fieldset").css("width","100%")
});


function cfm(e){
	if(confirm("Continue to delete?"))
		{
		location.href=$(e).attr("data-href");
		}
	
}