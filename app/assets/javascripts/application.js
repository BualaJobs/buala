//= require jquery
//= require jquery_ujs
//= require_tree ./gmaps4rails
//= require lodash
//= require angular/angular
//= require restangular/dist/restangular.min
//= require_self
//= require_tree ./directives
//= require_tree ./controllers
//= require twitter/bootstrap/modal
//= require twitter/bootstrap/tooltip
//= require twitter/bootstrap/dropdown

var buala = angular.module('Buala', ['restangular']);

+function ($) {"use strict"

  var stickFooter = function () {
    var documentHeight = $(document).height();
    var navbarHeight = $('.navbar-buala').outerHeight();

    var minimumHeightRequired = documentHeight - navbarHeight;

    var adjustableSectionHeight = $('.adjustable').outerHeight();

    if (minimumHeightRequired > adjustableSectionHeight) {
      $('.adjustable').height(minimumHeightRequired);
    }
  };

  var initializeFileBtns = function () {
    $(document)
    .on('change', '.btn-file :file', function() {
      var input = $(this),
      numFiles = input.get(0).files ? input.get(0).files.length : 1,
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
      input.trigger('fileselect', [numFiles, label]);
    });

    $('.btn-file :file').on('fileselect', function (event, numFiles, label) {
      $('.btn-file :file').parent().parent().children('.file-info').text(label);
    });
  };

  $(function () {
    stickFooter();
    initializeFileBtns();
  });

}(window.jQuery);
