// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

//$(".navbar-collapse").css({ maxHeight: $(window).height() - $(".navbar-header").height() + "px" });

$(function () {
  $("#navbar li.dropdown").click( function() {
        if ($(this).hasClass('open')){
          $("#navbar.navbar-collapse.collapse.in li.linav").show();
          $(this).css('background-color', '#0099cc !important')
          alert("titi");
        }
        else {
          /*$("#navbar.navbar-collapse.collapse.in").hide();*/
          $("#navbar.navbar-collapse.collapse.in li.linav").hide();
          $(this).show();
          alert("toto");
        }
  });
  $("button.navbar-toggle").click( function() {
    $("#navbar.navbar-collapse.collapse li.linav").show();
  });
  return false;
});
