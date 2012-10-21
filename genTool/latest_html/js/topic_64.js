$( function() {

$('#list302').click(function() {
	$('#topic64 span.listtxt').html('泫雅的声音好萌～～');
	$('#topic64 embed').wrap('<div class="videoWrapper" />');
	$('#topic64 embed').replaceWith('<embed allowFullscreen="true" src="http://player.yinyuetai.com/video/player/485220/v_0.swf" quality="high" width="680" height="480" align="middle" allowScriptAccess="sameDomain" allowfullscreen="true" type="application/x-shockwave-flash"></embed>');
	$('#topic64 li').css('color', '#000000');
	$('#list302').css('color', '#CC0052');
	});
$('#list303').click(function() {
	$('#topic64 span.listtxt').html('大家一起跳好，好看又好玩～～');
	$('#topic64 embed').wrap('<div class="videoWrapper" />');
	$('#topic64 embed').replaceWith('<embed allowFullscreen="true" src="http://player.yinyuetai.com/video/player/472501/v_0.swf" quality="high" width="680" height="480" align="middle" allowScriptAccess="sameDomain" allowfullscreen="true" type="application/x-shockwave-flash"></embed>');
	$('#topic64 li').css('color', '#000000');
	$('#list303').css('color', '#CC0052');
	});
}
)
;
