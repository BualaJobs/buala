$(function() {
  
  var moveResume = function(miniResume) {
    $(miniResume).animate({
      "margin-left": "300px",
    }, 1500, function() {
      $(miniResume).css("margin-left", "0");
      moveResume(miniResume);
    });
  };

  var miniResumes = $(".mini-resume");
  var times = [0, 500, 1000];

  var i = 0;
  _.each(times, function(t) {
    setTimeout(function() {
      moveResume(miniResumes[i++]);
    }, t);
  });

  _.each(miniResumes, function(miniResume) {

  });

});