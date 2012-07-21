$( function() {

$('#list219').mouseover(function() {
	$('#topic42 img').attr('src', 'http://img.xiami.com/images/album/img18/63018/3388761248768709_2.jpg');
	$('#topic42 span.listtxt').html('声音很甜美很好听，一种乖女生的感觉。');
	});
$('#list219').click(function() {
	$('#musicPlayer h3').html('樱桃女声');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_1769016534,1769016535,1769016530,1769016537,1769016538,1769016532,1769016531,1769016528,1769016529,1769016526,1769016527,1769016533,1769016536,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic42 li').css('color', '#000000');
	$('#list219').css('color', '#CC0052');
	});

}
)
;
