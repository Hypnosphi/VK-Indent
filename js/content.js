// Generated by CoffeeScript 1.7.1
(function() {
  var scriptElement;

  scriptElement = document.createElement('script');

  scriptElement.src = chrome.extension.getURL('js/inject.js');

  scriptElement.addEventListener('load', function(e) {
    return document.body.removeChild(scriptElement);
  });

  document.body.appendChild(scriptElement);

}).call(this);