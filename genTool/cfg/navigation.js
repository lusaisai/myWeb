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
});
