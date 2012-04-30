$( function() {

$('#list12').click(function() {
	$('#topic2 span.listtxt').html('世界杯上的遗憾与完美');
	$('#topic2 embed').wrap('<div class="videoWrapper" />');
	$('#topic2 embed').replaceWith('<embed allowFullscreen="true" src="http://player.youku.com/player.php/sid/XMjcyODc3Mzg4/v.swf" quality="high" width="680" height="480" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash"></embed>');
	$('#topic2 li').css('color', '#000000');
	$('#list12').css('color', '#CC0052');
	});
$('#list13').click(function() {
	$('#topic2 span.listtxt').html('罗纳尔多足球生涯全纪录');
	$('#topic2 embed').wrap('<div class="videoWrapper" />');
	$('#topic2 embed').replaceWith('<embed allowFullscreen="true" src="http://player.youku.com/player.php/sid/XMjUxNTk2OTQw/v.swf" quality="high" width="680" height="480" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash"></embed>');
	$('#topic2 li').css('color', '#000000');
	$('#list13').css('color', '#CC0052');
	});
$('#list14').click(function() {
	$('#topic2 span.listtxt').html('速度 力量 技术的完美结合，造就了唯一的罗纳尔多，你是否一度以为巴西人都叫罗纳尔多。');
	$('#topic2 embed').wrap('<div class="videoWrapper" />');
	$('#topic2 embed').replaceWith('<embed allowFullscreen="true" src="http://player.youku.com/player.php/sid/XMzQ3ODQ1NTY4/v.swf" quality="high" width="680" height="480" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash"></embed>');
	$('#topic2 li').css('color', '#000000');
	$('#list14').css('color', '#CC0052');
	});
}
)
;
