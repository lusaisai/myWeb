function space_remove(name) {
    name = name.replace(/\++/g, '+'); // convert (continuous) whitespaces to one -
	 name = name.replace(/^\++|\++$/g, ''); // remove leading and trailing whitespaces
    return name;
}

function searching() {
	$('#searchResult').html("");
	$('#searchResult').load("searching.php", space_remove($('#searchForm').serialize()));
	return false;
}

$( function() {
	$('#searchForm').submit(searching);
});
