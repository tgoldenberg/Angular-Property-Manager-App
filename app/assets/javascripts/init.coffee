console.log 'testing'
window.app = angular.module 'app', []
config = (http) ->
  http.defaults.headers.common['X-CSRF-Token']     = $('meta[name=csrf-token]').attr('content');
  http.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"
app.config ['$httpProvider',config]
