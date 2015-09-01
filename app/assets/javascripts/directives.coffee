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

.directive 'employeesLocation', ->
  scope: {}
  restrict: 'E'
  templateUrl: 'employeesLocation.html'
  controller: ($scope, $http) ->
    $http.get '/api/employeesloc',
      responseType: 'json'
    .then (response) ->
      console.debug response
      $scope.data = response.data
