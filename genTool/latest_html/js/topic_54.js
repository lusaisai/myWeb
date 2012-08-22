$( function() {

$('#list270').mouseover(function() {
	$('#topic54 img').attr('src', 'http://img.xiami.com/images/artistlogo/13/13217922564813_2.jpg');
	$('#topic54 span.listtxt').html('我一直觉得伊能静很漂亮，没想到栽在哈林手里了。她唱歌挺可爱的，《你是我的幸福吗》很不错。');
	});
$('#list270').click(function() {
	$('#musicPlayer h3').html('伊能静精选');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_374086,374068,159665,159678,374079,374168,374190,159913,159914,374102,159671,374100,374069,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic54 li').css('color', '#000000');
	$('#list270').css('color', '#CC0052');
	});

}
)
;
