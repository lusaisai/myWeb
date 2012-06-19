$( function() {

$('#list185').mouseover(function() {
	$('#topic32 img').attr('src', 'http://img.xiami.com/images/artist//12175707394523.jpg');
	$('#topic32 span.listtxt').html('她们的歌声并不像她们的名字所描述的那样，相反，听起来很舒服。');
	});
$('#list185').click(function() {
	$('#musicPlayer h3').html('Spice');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_1289309,1289242,1289243,1289244,1289245,1289246,1289247,1289272,1289273,1289274,1289275,1289374,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic32 li').css('color', '#000000');
	$('#list185').css('color', '#CC0052');
	});

}
)
;
