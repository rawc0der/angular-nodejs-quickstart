###*
 # @ngdoc controller
 # @name StateController
###
class StateController
  @$inject: [ '$scope']
  constructor: (@$scope) ->
    console.log('quickstartApp.state.controllers.StateController')

angular.module('quickstartApp.state.controllers.StateController', [])
  .controller 'StateController', StateController
