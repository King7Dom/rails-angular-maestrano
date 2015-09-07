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
        console.debug key
        console.debug value
        data.labels.push key
        data.series.push [value]

      console.debug data
      $scope.data = data
