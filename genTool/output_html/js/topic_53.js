$( function() {

$('#list263').mouseover(function() {
	$('#topic53 img').attr('src', 'http://img.xiami.com/images/album/img40/2340/2974291312424600_2.jpg');
	$('#topic53 span.listtxt').html('很淘气的一个女孩，很完美的一张专辑。');
	});
$('#list263').click(function() {
	$('#musicPlayer h3').html('I Believe');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_3295284,3295285,3295287,3295289,3295292,3295283,3295286,3295288,3295290,3295291,3295293,3295294,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic53 li').css('color', '#000000');
	$('#list263').css('color', '#CC0052');
	});

$('#list264').mouseover(function() {
	$('#topic53 img').attr('src', 'http://img.xiami.com/images/album/img40/2340/3453731341220802_2.jpg');
	$('#topic53 span.listtxt').html('My ~~ Bloody ~~ Valentine');
	});
$('#list264').click(function() {
	$('#musicPlayer h3').html('Ready For Love');
	$('#musicPlayer embed').replaceWith('<embed src="http://www.xiami.com/widget/4097932_1769097890,1769097889,1769097887,1769097888,1769097891,1769097892,1769097893,1769097894,1769097895,1769097896,1769097897,1769097898,_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>');
	$('#topic53 li').css('color', '#000000');
	$('#list264').css('color', '#CC0052');
	});
}
)
;
