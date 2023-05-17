
//$("body").hide();
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
var b = ["success"];
$(document).ready(function(){	
	$("table").removeClass("sTable");
	
	$("table").css("background","#fff");
	$("input[type=number],input[type=text],input[type=password],textarea").addClass("form-control");
	$("button,input[type=submit]").addClass("btn btn-"+b[rnd(0,b.length-1)]);
	$("table th").attr("style","");
	
	$("table th").each(function(){
		$(this).attr("style","text-align:center");
	});
	
	$("table td").each(function(){
		$(this).find("label").attr("style","display:block;width:150px;");
		$(this).attr("style","text-align:center");
		var html =$(this).html();
		
	});
	$("table").addClass("table table-striped  row-hover ");
	
	$(".block a,table td a").addClass("btn btn-"+b[rnd(0,b.length-1)]);
	$(".title h6").addClass("alert alert-" + a[rnd(0, a.length - 1)]);
	$(".container_12").find("p").eq(0).css("width","200px");
	$(".container_12").find("p").eq(0).addClass("label label-" + a[rnd(0, a.length - 1)]);
	$(".nNote").addClass("alert alert-"+a[rnd(0,a.length-1)]);
	$(".title h2,.box h2,.card-head .left,.caption ").addClass("badge badge-"+a[rnd(0,a.length-1)]);
	$(".widget").css("border-radius","0px");
	$(".portlet-title,.widget").css("padding","20px 0");
	$(".widget").css("margin","0px");
	
	$(".article").css("padding","20px");
	$(".widget").css("marginTop","20px");
	//$("body,table>thead>tr>th,.table thead td,.table>thead>tr>th,table>tr>td,table>tr>td a").css("color","#fff");
	$("table td a,a.clear,a.add").each(function(){
		$(this).addClass("button btn btn-"+b[rnd(0,b.length)]);
	})
	$(".formRow").css("border","none");
	 $(".widget,.table,input,button").each(function () {
         //$(this).addClass(" animated "+animates[rnd(0,animates.length)]);
		 $(this).addClass(" animated fadeIn");
     });
	// $("form").css("width","40%");
	 $("form table td").css("text-align","left");   
	 $("form table td").css("padding","6px");   
	 $("table tr:last").css("border-bottom","1px solid #ddd");
	 $("table tr:first").css("border-top","1px solid #ddd");
	 $("form p").css("line-height","10px");
	// $("table th").css("background","#323742");
	// $("table th").css("color","#fff");
	 setTimeout(function(){
		 $("body").show();		 
	 },500);
});