$( function() {

$('#list121').click(function() {
	$('#topic11 span.listtxt').html('声音太清澈了，那一句“看我看一眼吧莫让红颜守空枕”很让人心动。');
	$('#topic11 embed').wrap('<div class="videoWrapper" />');
	$('#topic11 embed').replaceWith('<embed allowFullscreen="true" src="http://player.yinyuetai.com/video/player/260434/v_0.swf" quality="high" width="680" height="480" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash"></embed>');
	$('#topic11 li').css('color', '#000000');
	$('#list121').css('color', '#CC0052');
	});
$('#list122').click(function() {
	$('#topic11 span.listtxt').html('浅浅的吟唱，甜美的细诉。');
	$('#topic11 embed').wrap('<div class="videoWrapper" />');
	$('#topic11 embed').replaceWith('<embed allowFullscreen="true" src="http://player.yinyuetai.com/video/player/278034/v_0.swf" quality="high" width="680" height="480" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash"></embed>');
	$('#topic11 li').css('color', '#000000');
	$('#list122').css('color', '#CC0052');
	});
}
)
;
