require './controllers/component_controller'
require './services/component_service'
require './directives/component_directive'
###*
 # @name component
###
angular.module 'quickstartApp.common.component', [
	'quickstartApp.common.component.services.ComponentService'
	'quickstartApp.common.component.controllers.ComponentController'
	'quickstartApp.common.component.directives.componentDirective'
] 
