$( function() {

$('#list200').mouseover(function() {
	$('#topic36 img').attr('src', 'http://img.xiami.com/images/artist//11968205877884_2.jpg');
	$('#topic36 span.listtxt').html('无论快乐悲伤，她的声音里总带有一种特别的浪漫。');
	});
$('#list200').click(function() {
	$('#musicPlayer h3').html('侯湘婷精选');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_111357,2078895,111329,111328,111353,111358,111359,111343,111346,111327,111330,111331,111333,111342,2078897,2078899,2078883,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic36 li').css('color', '#000000');
	$('#list200').css('color', '#CC0052');
	});

}
)
;
