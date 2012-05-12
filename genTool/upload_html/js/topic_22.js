$( function() {

$('#list153').mouseover(function() {
	$('#topic22 img').attr('src', 'http://img.xiami.com/images/album/img0//328681280823281.jpg');
	$('#topic22 span.listtxt').html('实力派，《痒》很好听，她的声音很适合诠释老上海的感觉。');
	});
$('#list153').click(function() {
	$('#musicPlayer h3').html('痒');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_392387,392388,392389,392390,392391,392392,392393,392394,392395,392396,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic22 li').css('color', '#000000');
	$('#list153').css('color', '#CC0052');
	});

$('#list154').mouseover(function() {
	$('#topic22 img').attr('src', 'http://img.xiami.com/images/album/img36/7236/3855591308535807.JPG');
	$('#topic22 span.listtxt').html('听了《骑士》，感觉黄龄挺可爱的，挺小女人的。');
	});
$('#list154').click(function() {
	$('#musicPlayer h3').html('特别');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_1769576510,1769576511,1769576512,1769576513,1769576514,1769576515,1769576516,1769576517,1769576518,1769576519,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic22 li').css('color', '#000000');
	$('#list154').css('color', '#CC0052');
	});
}
)
;
