<?php
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
$query = "select music_id from d_id_map order by rand() limit 15;";
$embed_pre='<embed src="http://www.xiami.com/widget/4097932_';
$embed_suf='_235_346_000000_494949_1/multiPlayer.swf" type="application/x-shockwave-flash" width="235" height="346" wmode="opaque"></embed>';

$mysqli = new mysqli('localhost','imsixthr_myweb','imsixthr_myweb','imsixthr_myweb01');
$mysqli->set_charset("utf8");
$result = $mysqli->query($query);
$music_ids = '';

while( $row = $result->fetch_object()) {
	$music_ids = $music_ids . "," . $row->music_id;
}

echo '<h3>随便听听 ...</h3>' . $embed_pre . $music_ids . $embed_suf;
$mysqli->close();
?>
