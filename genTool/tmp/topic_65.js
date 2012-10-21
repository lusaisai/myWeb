$( function() {

$('#list308').mouseover(function() {
	$('#topic65 img').attr('src', 'http://img.xiami.com/images/artistlogo/19/13180533253319.png');
	$('#topic65 span.listtxt').html('胡彦斌的音乐里带有一种既古典又现代的浪漫，我很喜欢~~~');
	});
$('#list308').click(function() {
	$('#musicPlayer h3').html('胡彦斌精选');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_31384,381804,2118488,2118494,2118489,381784,1769248469,1770435491,2118491,393491,1770435492,1770435493,2118501,2118493,2118492,1769248461,1769248460,31382,381805,381811,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic65 li').css('color', '#000000');
	$('#list308').css('color', '#CC0052');
	});

}
)
;
