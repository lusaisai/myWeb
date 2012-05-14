$( function() {

$('#list156').mouseover(function() {
	$('#topic24 img').attr('src', 'http://img.xiami.com/images/album/img38/24238/172607.jpg');
	$('#topic24 span.listtxt').html('听来很有小桥流水人家的感觉，可惜闻婷就只有这么一张专辑。');
	});
$('#list156').click(function() {
	$('#musicPlayer h3').html('烟雨倾城');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_2133306,2133302,2133312,2133308,2133305,2133304,2133303,2133307,2133309,2133313,2133310,2133311,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic24 li').css('color', '#000000');
	$('#list156').css('color', '#CC0052');
	});

}
)
;
