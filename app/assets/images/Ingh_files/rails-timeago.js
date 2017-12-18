//
// jQuery Timeago bootstrap for rails-timeago helper
//


(function($) {
	var fn = function() {
		$('time[data-time-ago]').timeago();
	};
	$(fn);
	$(document).on('turbolinks:load page:load ajax:success', fn);
})(jQuery);
