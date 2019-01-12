// loaders
window.efcRegistrationWidget.htmlLoader = function (parent, list) {
  list.forEach(function(id) {
    var child = document.createElement('div');
    child.id = id;
    parent.appendChild(child);
  });
}
window.efcRegistrationWidget.cssLoader = function (parent, list) {
  list.forEach(function(url) {
    var child = document.createElement('link');
    child.rel = 'stylesheet';
    child.href = url;
    parent.appendChild(child);
  });
}
window.efcRegistrationWidget.jsLoader = function (parent, list) {
  list.forEach(function(file) {
    var child = document.createElement('script');
    child.type = 'text/javascript';
    child.src =  file;
    child.async = false;
    parent.appendChild(child);
  });
}

// load html
window.efcRegistrationWidget.htmlLoader(document.body, [
  'efcRegistrationWidget'
]);

// load css (injected at build time)
window.efcRegistrationWidget.cssLoader(document.body, [
  window.efcRegistrationWidget.url + '/static/css/font-awesome.min.css',
  window.efcRegistrationWidget.url + '/static/css/main.3aa667fb.css',
]);
// load js (injected at build time)
window.efcRegistrationWidget.jsLoader(document.body, [
  window.efcRegistrationWidget.url + '/properties.js',
  window.efcRegistrationWidget.url + '/static/js/main.4181fab4.js'
]);
