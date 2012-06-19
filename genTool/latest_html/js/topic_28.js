$( function() {

$('#list167').mouseover(function() {
	$('#topic28 img').attr('src', 'http://img.xiami.com/images/album/img3/2003/5102351335426111.jpg');
	$('#topic28 span.listtxt').html('这样温柔的声音现如今已经很少了。');
	});
$('#list167').click(function() {
	$('#musicPlayer h3').html('月亮公主孟庭苇');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_135635,135430,135647,135423,135658,135645,135539,135428,1769039512,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic28 li').css('color', '#000000');
	$('#list167').css('color', '#CC0052');
	});

}
)
;
