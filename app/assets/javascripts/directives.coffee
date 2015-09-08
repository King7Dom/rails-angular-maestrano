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
      console.debug response.data
      countries =
        labels: []
        series: []
      regions = []

      for country, region of response.data
        countries.labels.push country
        currentRegion =
          country: country
          labels: []
          series: []
        for key, value of region
          if key is 'total'
            countries.series.push value
          else
            currentRegion.labels.push key
            currentRegion.series.push value
        unless currentRegion.labels.length > 0 and currentRegion.series.length > 0
          currentRegion.labels.push country
          currentRegion.series.push region['total']
        regions.push currentRegion

      $scope.countries = countries
      $scope.countryOption =
        chartPadding: 30
        labelOffset: 120
        labelDirection: 'explode'
        labelInterpolationFnc: (value) -> value

      $scope.regions = regions
      $scope.regionOption =
        distributeSeries: true
