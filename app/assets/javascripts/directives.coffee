'user strict'

angular.module 'mtImpact.directives', [
  'templates'
]
.directive 'helloWorld', ->
  scope: {}
  restrict: 'E'
  templateUrl: 'helloWorld.html'
  controller: ($scope) ->
    $scope.hello = 'Hello World!'
