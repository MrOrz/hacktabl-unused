define ['angular'], (angular) ->
  app = angular.module 'app.controller', []

  app.controller 'TestCtrl', ['$scope', !($scope)->
    console.log 'TestCtrl Operational'
    $scope.test = "Angular also works!"
  ]
