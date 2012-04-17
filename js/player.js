$( function() {

$('.list li').mousedown( function() {
	$(this).css('box-shadow','none');
	}
).mouseup( function() {
	$(this).css('box-shadow','1px 1px 2px 1px #5F9FFF');
	}
)
;

$('#list1').mouseover(function() {
	$('#music1 img').attr('src', 'http://img.xiami.com/images/album/img89/389/1711.jpg');
	$('#music1 span').html('最早听的品冠的专辑，当时彻底被杜鹃吸引了');
	});
$('#list1').click(function() {
	$('#musicPlayer h3').html('疼你的责任');
	$('#musicPlayer embed').attr('src', 'http://www.xiami.com/widget/4097932_32981,32982,32983,32984,32985,32986,32987,32988,32989,32990,_235_346_000000_494949_0/multiPlayer.swf');
	});

$('#list2').mouseover(function() {
	$('#music1 img').attr('src', 'http://img.xiami.com/images/album/img89/389/1709.jpg');
	$('#music1 span').html('变成熟的一张专辑，很悲情');
	});
$('#list2').click(function() {
	$('#musicPlayer h3').html('U-Turn 180°转弯');
	$('#musicPlayer embed').attr('src', 'http://www.xiami.com/widget/4097932_32966,32967,32968,32969,32970,32971,32972,32973,32974,32975,_235_346_000000_494949_0/multiPlayer.swf');
	});

}
)
;
