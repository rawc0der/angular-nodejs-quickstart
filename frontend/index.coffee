###*
 # Index file 
 ## declare dependency modules
###
require './app/state/index'
require './common/component/index'

angular
  .module('application', [
    'templates'
    # 'ngAnimate'
    # 'ngResource'
    'lodash'
    'ui.router'
    
    'quickstartApp.common.component'
    'quickstartApp.state' 

  ])
