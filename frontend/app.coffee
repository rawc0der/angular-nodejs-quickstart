require './index'

###*
 # # Quickstart Application
###
class MainApplication
  run: -> ( $rootScope, $state ) ->
    console.log('MainApplication init');
    $rootScope.$state = $state
    
    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) =>
      console.log(event, toState, toParams, fromState, fromParams) 
    $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
      console.error(event, toState, toParams, fromState, fromParams) 
    
  config: -> ($urlRouterProvider, $provide) ->
    
    $urlRouterProvider
      .otherwise '/'
    $provide.decorator '$exceptionHandler', ($delegate) ->
      (exception, cause) ->
        $delegate exception, cause
        errorData =
          exception: exception,
          cause: cause
        #### @TODO PROVIDE PROPPER HANDLING AND LOGGING
        console.error '$exceptionHandler::ERROR:', exception.msg, errorData

app = new MainApplication()

angular
  .module('quickstartApp',['application']).config( app.config() ).run app.run()

