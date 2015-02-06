###*
 #  ComponentController
###

class ComponentController  
  @$inject: [ '$scope' ]
  constructor: ( $scope ) ->
    console.log('%c quickstartApp.common.component.controllers.ComponentController', 'color:green')

angular.module('quickstartApp.common.component.controllers.ComponentController', [])
  .controller 'ComponentController', ComponentController