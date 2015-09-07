'user strict'

angular.module 'mtImpact.directives', [
  'templates'
  'angular-chartist'
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
      # Parse the response into chartist data format
      data =
        labels: []
        series: []

      for key, value of response.data
        data.labels.push key
        data.series.push [value]

      $scope.data = data

.directive 'salesFlow', ->
  scope: {}
  restrict: 'E'
  templateUrl: 'salesFlow.html'
  controller: ($scope, $http) ->
    $http.get '/api/salesflow',
      responseType: 'json'
    .then (response) ->
      data =
        labels: []
        series: []

      for key, value of response.data
        data.labels.push key
        data.series.push value['total']

      $scope.data = data
      $scope.option =
        chartPadding: 30
        labelOffset: 120
        labelDirection: 'explode'
        labelInterpolationFnc: (value) -> value
