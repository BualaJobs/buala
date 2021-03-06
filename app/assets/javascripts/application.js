//= require jquery
//= require jquery_ujs
//= require_tree ./gmaps4rails
//= require lodash
//= require modernizr/modernizr
//= require angular/angular
//= require angular-resource/angular-resource
//= require_self
//= require_tree ./services
//= require_tree ./directives
//= require_tree ./controllers
//= require twitter/bootstrap/modal
//= require twitter/bootstrap/tooltip
//= require twitter/bootstrap/dropdown

var buala = angular.module('Buala', ['ngResource'])
  .config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }]);

buala.filter('escape', function() {
  return window.escape;
});

+function ($) {"use strict"

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

  var retinaImages = function () {
    if (!Modernizr.svg) {
      $('img[src*="svg"]').attr('src').replace('.svg', '.png');
    }
  };

  $(function () {
    initializeFileBtns();
    retinaImages();
  });

}(window.jQuery);
