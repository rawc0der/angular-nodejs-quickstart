angular.module('quickstartApp.common.component.directives.componentDirective', [])
  .directive 'componentBox', ($rootScope) ->
    restrict: 'E'
    controller: 'ComponentController'
    templateUrl: 'common/component/templates/layout.html'
    link: (scope, elem, attr) ->
    	console.log('componentBox init')