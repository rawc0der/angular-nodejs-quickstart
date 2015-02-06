gulp            = require 'gulp'
coffee          = require 'gulp-coffee'
concat          = require 'gulp-concat'
coffeeify       = require 'coffeeify'
browserify      = require 'gulp-browserify'
plumber         = require 'gulp-plumber'
templateCache   = require 'gulp-angular-templatecache'
notify          = require 'gulp-notify'
$               = require('gulp-load-plugins')()
gutil           = require 'gulp-util'

gulp.task 'coffee', -> 
  gulp.src('./frontend/app.coffee', { read: false })
    .pipe(plumber())
    .pipe browserify({ transform: ['coffeeify'], debug: true, extensions: [ '.coffee' ] })
    .on 'error', gutil.log
    .pipe concat 'client.build.js'
    .pipe gulp.dest './public/js/'
    .pipe notify {'title': 'Quickstart Service', message: 'Done Coffee build'}

gulp.task 'templates', ->
  gulp.src './frontend/**/*.html'
    .pipe templateCache('templates.build.js', standalone: true)
    .pipe gulp.dest './public/js'
    .pipe notify {'title': 'Quickstart Service', message: 'Templates Generated Successfully'}

gulp.task 'bower', ->
  gulp.src([
    './bower_components/jquery/dist/jquery.js'
    './bower_components/lodash/lodash.min.js'
    './bower_components/angular/angular.js'
    './bower_components/ui-router/release/angular-ui-router.min.js'
    './bower_components/angular-lodash-module/angular-lodash-module.js'
  ]).pipe concat 'vendor.build.js'
  .pipe gulp.dest './public/js/'
  .pipe notify {'title': 'Quickstart Service', message: 'Vendor Scripts Generated Successfully'}

gulp.task 'watch', ->
  gulp.watch 'frontend/app.coffee', [ 'coffee' ] 
  gulp.watch 'frontend/*.coffee', [ 'coffee' ] 
  gulp.watch 'frontend/**/*.coffee', [ 'coffee' ] 
  gulp.watch 'frontend/**/*.html', [ 'templates' ]

# develop task
gulp.task 'default', [
  'watch'
  'templates'
  'bower'
  'coffee'
]
