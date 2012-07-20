/**
 * grid UI
 */
(function($) {
    /**
     * $ is an alias to jQuery object
     *
     */
    $.fn.vtgrid = function(options) {
        this.each(function() {
	    var settings = $.extend({
	    },options);
            var $this = $(this);
            $.fn.vtgrid.render($this.find('tr.pointer'));
        });
    };
    // 渲染表格的基础响应效果
    $.fn.vtgrid.render = function(rows) {
        rows.hover(
            function() {
                $(this).addClass('on-mouse');
            }, function() {
                $(this).removeClass('on-mouse');
            });
    }
})(jQuery);

$(document).ready(function() {$('.grid').vtgrid({})});