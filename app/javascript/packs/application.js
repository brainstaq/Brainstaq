// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


var jQuery = require("jquery");

// import jQuery from "jquery";
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

//= require("jquery")
//= require("jquery-ui/core")
//= require popper
//= require activestorage
//= require local-time
//= require tinymce
//= require social-share-buttons
//= require shuffle
//= require_tree .


require("@rails/ujs").start()
//require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap")
require("pesky_scrolly_stuff")

require("slick-carousel")

// require("alpinejs")
// import "../stylesheets/application.scss"
// import "../stylesheets/brainstorms.scss"

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import "slick-carousel/slick/slick.scss"
import "slick-carousel/slick/slick-theme.scss"

import "controllers"
import "@fortawesome/fontawesome-free/js/all";

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
  });

setTimeout(function() {
    $('.flash-message').fadeOut('fast');
}, 5000);

function validateFiles(inputFile) {
    var maxExceededMessage = "This file exceeds the maximum allowed file size (1 MB)";
    var extErrorMessage = "Only image file with extension: .jpg, .jpeg, .gif or .png is allowed";
    var allowedExtension = ["jpg", "jpeg", "gif", "png", "pdf"];

    var extName;
    var maxFileSize = $(inputFile).data('max-file-size');
    var sizeExceeded = false;
    var extError = false;

    $.each(inputFile.files, function() {
        if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) { sizeExceeded = true; };
        extName = this.name.split('.').pop();
        if ($.inArray(extName, allowedExtension) == -1) { extError = true; };
    });
    if (sizeExceeded) {
        window.alert(maxExceededMessage);
        $(inputFile).val('');
    };

    if (extError) {
        window.alert(extErrorMessage);
        $(inputFile).val('');
    };
}

document.addEventListener("turbolinks:load", function() {
    $('.scroller').slick()
})

$(function() {
    $('#slider2').slick({
        autoplay: true,
        autoplaySpeed: 4000,
        slidesToShow: 3, //Number of slides to display
        slidesToScroll: 3, //Number of slides switched by scrolling
  
        //If you want to make it responsive, also describe the following
        responsive: [{
          breakpoint: 768, //The following settings with a screen width of 768px
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2,
          }
        }]
    });
  });

// script.js