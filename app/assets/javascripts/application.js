// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.easy-autocomplete
//= require bootstrap-sprockets
//= require urban_terms
//= require jquery_ujs
//= require jquery-ui
//= require best_in_place
//= require jquery.raty
//= require jquery.purr
//= require best_in_place.purr
//= require selectize
//= require rails-timeago-all
//= require jquery.turbolinks
//= require app
//= require search
// require posts
//= require comments
//= require turbolinks
//= require ckeditor/init
//= require chosen-jquery
//= require trix
//= require_tree .


$(document).ready(function() {
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Please Wait...");
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
});
