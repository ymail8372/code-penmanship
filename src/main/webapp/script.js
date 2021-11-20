function display(value) {
	if (value == 1) {
		$('.cpp').hide();
		$('.java').hide();
		document.write(value);
	}
	else if (value == 2) {
		$('.c').hide();
		$('.java').hide();
		document.write(value);
	}
	else {
		$('.c').hide();
		$('.cpp').hide();
		document.write(value);
	}
}

$(document).ready(function() {
	var num = "<%=lang%>";
	alert(num);
});
