$(function() {
 
 $('#nav a').stop().animate({'marginLeft':'-110px'},1500);
 
 $('#nav > li').hover(
  function () {
   $('a',$(this)).stop().animate({'marginLeft':'-2px'},200);
  },
  function () {
   $('a',$(this)).stop().animate({'marginLeft':'-110px'},200);
  }
 );
 
 $('.list li').mousedown( function() {
	$(this).css('box-shadow','none');
	}
).mouseup( function() {
	$(this).css('box-shadow','1px 1px 2px 1px #5F9FFF');
	}
)
;

 $('#randomListen li').mousedown( function() {
	$(this).css({'box-shadow' :'none', 'color': 'lightgreen'});
	}
).mouseup( function() {
	$(this).css({'box-shadow':'1px 1px 2px 1px #5F9FFF', 'color' : 'white'});
	}
)
;

$('#randomListen li').click(function() {
	$('#musicPlayer').load("randomListen.php");
	});

var $scrollingDiv = $("#left_panel");
var end = $(document).height();
 
$(window).scroll(function(){
	if ( $.trim($("#searchResult").text()) == "" && ($("#searchResult").position().top + 300 <= end ) ) {
   $scrollingDiv.stop().animate({"marginTop": ($(window).scrollTop() + 0) + "px"}, "slow" );
}
});

$(".list > li").click(function(){
   if ( $.trim($("#searchResult").text()) == "" && ($("#searchResult").position().top + 300 <= end ) ) {
   $scrollingDiv.stop().animate({"marginTop": ($(window).scrollTop() + 0) + "px"}, "slow" );
}
}
);

});
