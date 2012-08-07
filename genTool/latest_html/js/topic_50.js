$( function() {

$('#list254').mouseover(function() {
	$('#topic50 img').attr('src', 'http://img.xiami.com/images/artist/1060_2.jpg');
	$('#topic50 span.listtxt').html('小时候一直把谢雨欣幻想成是某个隔壁的大姐姐。很喜欢《谁》这首歌。');
	});
$('#list254').click(function() {
	$('#musicPlayer h3').html('精选');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_151852,151804,151856,151854,151782,151788,151858,151843,151842,151803,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic50 li').css('color', '#000000');
	$('#list254').css('color', '#CC0052');
	});

}
)
;
