# http://beletsky.net/2013/11/using-angular-dot-js-with-require-dot-js.html

require.config do
  paths:
    angular: '../../vendor/bower_components/angular/angular'

  shim:
    angular:
      exports: 'angular'

# Kickstart
require ['./app']