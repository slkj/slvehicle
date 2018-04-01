$(function() {
	$("img[original]").lazyload({
		placeholder : ""
	});
});

function lazyloadForPart(container) {
	container.find('img').each(function() {
		var original = $(this).attr("original");
		if (original) {
			$(this).attr('src', original).removeAttr('original');
		}
	});
}

$(function() {

	var navBox = $('.tabTagBox'), navList = $('.tabTagList'), navs = navList
			.children('li'), upBtn = $('.uPrev'), downBtn = $('.dNext');
	var opts = {
		moveH : 58,
		moveSpeed : 200,
		curMoveH : 0,
		curSumH : 0,
		curNavIndex : 0
	}

	opts.curSumH = (opts.moveH * navs.size()) - navBox.height();

	var navToContentBox = function() {
		navs.removeClass('current');
	}

	var navMove = function() {

		var _arg = arguments.length > 0 ? arguments[0] : '';
		navToContentBox();
		navs.eq(opts.curNavIndex).addClass('current');
		navList.animate({
			top : opts.curMoveH + 'px'
		}, opts.moveSpeed);
	}

	upBtn.click(function() {
		navMove('down');
	});

	downBtn.click(function() {
		navMove('up');
	});

	navs.click(function() {
		opts.curNavIndex = $(this).index();
		navToContentBox();
		$(this).addClass('current');
		lazyloadForPart(contentBoxs);
	});

});