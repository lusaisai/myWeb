$( function() {

$('#list168').mouseover(function() {
	$('#topic29 img').attr('src', 'http://img.xiami.com/images/album/img57/657/4881641336011100.jpg');
	$('#topic29 span.listtxt').html('甄嬛传看了让人心情不爽，这背景音乐肯定有几分罪过。');
	});
$('#list168').click(function() {
	$('#musicPlayer h3').html('甄嬛传');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_1770742760,1770742761,1770742762,1770744375,1770744362,1770984746,1770742759,1770984747,1770984748,1770984749,1770984753,1770984754,1770984755,1770984756,1770984757,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic29 li').css('color', '#000000');
	$('#list168').css('color', '#CC0052');
	});

}
)
;
