/*
Template Name: Color Admin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.7
Version: 2.1.0
Author: Sean Ngu
Website: http://www.seantheme.com/color-admin-v2.1/admin/html/
*/

var handleLoginPageChangeBackground = function() {
    $('[data-click="change-bg"]').live('click', function(e) {
        e.preventDefault();
        var targetImage = '[data-id="login-cover-image"]';
        var targetImageSrc = $(this).find('img').attr('src');
        var targetImageHtml = '<img src="'+ targetImageSrc +'" data-id="login-cover-image" />';
        
        $('.login-cover-image').prepend(targetImageHtml);
        $(targetImage).not('[src="'+ targetImageSrc +'"]').fadeOut('slow', function() {
            $(this).remove();
        });
        $('[data-click="change-bg"]').closest('li').removeClass('active');
        $(this).closest('li').addClass('active');	
    });
};

var LoginV2 = function () {
	"use strict";
    return {
        //main function
        init: function () {
            handleLoginPageChangeBackground();
        }
    };
}();