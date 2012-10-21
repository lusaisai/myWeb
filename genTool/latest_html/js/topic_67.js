$( function() {

$('#list310').mouseover(function() {
	$('#topic67 img').attr('src', 'http://img.xiami.com/images/album/img43/77443/1680021333258915_2.jpg');
	$('#topic67 span.listtxt').html('大学里看过的韩剧《豪杰春香》的原声带。剧情很感人，男女主角很可爱~~');
	});
$('#list310').click(function() {
	$('#musicPlayer h3').html('豪杰春香O.S.T');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_2072546,2072543,2072545,2072547,2072551,2072548,2072549,2072550,2072544,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic67 li').css('color', '#000000');
	$('#list310').css('color', '#CC0052');
	});

}
)
;
