do ->
  # アプリケーションモジュールを定義（依存するモジュールをインジェクション）
  app = angular.module 'MyRoutesApp', ['ngResource', 'ngRoute', 'leaflet-directive']

  # Rails CSRFトークンを使用するように設定
  app.config ['$httpProvider', ($httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    $httpProvider.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest"
  ]

  # ルーティングの設定
  app.config ['$routeProvider', ($routeProvider) ->
    $routeProvider.when('/', {
      templateUrl: 'list.html',
      controller: 'ListController'

    }).when('/routes/new', {
      templateUrl: 'route_detail.html',
      controller: 'RouteDetailController'

    }).when('/routes/:id', {
      templateUrl: 'route.html',
      controller: 'RouteController'

    }).when('/routes/:id/edit', {
      templateUrl: 'route_detail.html',
      controller: 'RouteDetailController'

    }).otherwise({
      redirectTo: '/'
    })
  ]

  # Routesテーブルに対するRESTfulのマッパーを定義
  app.factory 'Route', ['$resource', ($resource) ->
    $resource '/routes/:id.json', {id: '@id'}, {
      update: {method: 'PUT'}
    }
  ]

  # Coordinatesテーブルに対するRESTfulのマッパーを定義
  app.factory 'Coordinate', ['$resource', ($resource) ->
    $resource '/coordinates/:id.json', {id: '@id'}
  ]

  # 一覧画面のコントローラ
  app.controller 'ListController', ['$scope', 'Route',
    ($scope, Route) ->
      $scope.routes = Route.query()
  ]

  # 地図表示画面のコントローラ
  app.controller 'RouteController', ['$scope', '$routeParams', 'Route',
    ($scope, $routeParams, Route) ->
      angular.extend $scope, {
        center: {
          lat: 35.65889587036083,
          lng: 139.75466072559357,
          zoom: 12
        },
        paths: {
          p1: {
            color: '#FF9966',
            weight: 5,
            latlngs: []
          }
        },
        defaults: {
          scrollWheelZoom: false
        }
      }
      $scope.route = Route.get {id: $routeParams.id}, ->
        if $scope.route.coordinates? and $scope.route.coordinates.length > 0
          $scope.center.lat = +$scope.route.coordinates[0].latitude
          $scope.center.lng = +$scope.route.coordinates[0].longitude
        $scope.paths.p1.latlngs = ({lat: +i.latitude, lng: +i.longitude} for i in $scope.route.coordinates)
  ]

  # ルート編集画面のコントローラ
  app.controller 'RouteDetailController', ['$scope', '$routeParams', '$location', 'Route', 'Coordinate',
    ($scope, $routeParams, $location, Route, Coordinate) ->
      angular.extend $scope, {
        center: {
          lat: 35.65889587036083,
          lng: 139.75466072559357,
          zoom: 12
        },
        paths: {
          p1: {
            color: '#FF9966',
            weight: 5,
            latlngs: []
          }
        },
        defaults: {
          scrollWheelZoom: false
        }
      }

      if $routeParams?.id?
        $scope.route = Route.get {id: $routeParams.id}, ->
          if $scope.route.coordinates? and $scope.route.coordinates.length > 0
            $scope.center.lat = +$scope.route.coordinates[0].latitude
            $scope.center.lng = +$scope.route.coordinates[0].longitude
          $scope.paths.p1.latlngs = ({lat: +i.latitude, lng: +i.longitude} for i in $scope.route.coordinates)
        $scope.prevUrl = "/#/routes/#{$routeParams.id}"
      else
        $scope.route = new Route {
          title: '',
          description: '',
          coordinates: []
        }
        $scope.prevUrl = '/#/'

      $scope.register = ->
        if $scope.route.id?
          $scope.route.$update ->
            alert('done.')
            $location.path("/routes/#{$routeParams.id}")
        else
          $scope.route.$save ->
            alert('done')
            $location.path('/')
  ]