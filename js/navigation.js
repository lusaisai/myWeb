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
});
