# Load all required libraries.
gulp            = require 'gulp'
coffee          = require 'gulp-coffee'
concat          = require 'gulp-concat'
# prefix          = require 'gulp-autoprefixer'
# cssmin          = require 'gulp-cssmin'

coffeeify       = require 'coffeeify'
browserify      = require 'gulp-browserify'
plumber         = require 'gulp-plumber'
templateCache   = require 'gulp-angular-templatecache'
notify          = require 'gulp-notify'
$               = require('gulp-load-plugins')()

# Modules required for the livereload - express, connect, tiny-lr, etc
gutil           = require 'gulp-util'


# watch for changes inside application assets and run various tasks
gulp.task 'watch', ->
  gulp.watch 'frontend/*.coffee', [ 'coffee' ] # main config file

gulp.task 'coffee', -> 
  gulp.src('./frontend/app.coffee', { read: false })
    .pipe(plumber())
    .pipe browserify({ transform: ['coffeeify'], debug: true, extensions: [ '.coffee' ] })
    .on 'error', gutil.log
    .pipe concat 'client.build.js'
    .pipe gulp.dest './public/js/'
    .pipe notify {'title': 'SicKtuber Service', message: 'Coffee delivered to your desk ;)'}

# load every template to $templateCache
gulp.task 'templates', ->
  gulp.src './frontend/**/*.html'
    .pipe templateCache('templates.build.js', standalone: true)
    .pipe gulp.dest './public/js'
    .pipe notify {'title': 'SicKtuber Service', message: 'Templates Generated Successfully'}

# load all bower components
gulp.task 'bower', ->
  gulp.src([
    './bower_components/jquery/dist/jquery.js'
    './bower_components/lodash/lodash.min.js'
    './bower_components/angular/angular.js'
    './bower_components/ui-router/release/angular-ui-router.min.js'
    './bower_components/angular-lodash-module/angular-lodash-module.js'
  ]).pipe concat 'vendor.build.js'
  .pipe gulp.dest './public/js/'
  .pipe notify {'title': 'SicKtuber Service', message: 'Vendor Scripts Generated Successfully'}

# watch for changes inside application assets and run various tasks
gulp.task 'watch', ->
  gulp.watch 'frontend/app.coffee', [ 'coffee' ] # main config file
  gulp.watch 'frontend/**/*.coffee', [ 'coffee' ] # states, controllers, app specific, mostly
  gulp.watch 'frontend/**/*.html', [ 'templates' ]


# develop task
gulp.task 'default', [
  'watch'
  'templates'
  'bower'
  'coffee'
]
