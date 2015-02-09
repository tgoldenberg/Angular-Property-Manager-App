
klass = ($scope, $http)->
  console.log "Hello world!"
  req = $http
    method: 'GET'
    url: '/api/v1/listings'
  req.success (data, status, headers, config)=>
    $scope.listings = data
    console.log data
app.controller 'listings/index', ['$scope', '$http', klass]
