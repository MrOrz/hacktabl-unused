exec        = require 'child_process' .exec
execFile    = require 'child_process' .execFile
connect     = require 'connect'

gulp        = require 'gulp'
slim        = require 'gulp-slim'
notify      = require 'gulp-notify'
compass     = require 'gulp-compass'
livescript  = require 'gulp-livescript'
rjs         = require 'gulp-requirejs'
livereload  = require 'gulp-livereload'

gulp.task \default, ->
  console.log "GULP RUNNING!"

# Slim tempalte compilation
#
gulp.task \slim, ->
  gulp.src 'app/slim/*.slim'
    .pipe slim()
    .pipe notify()
    .pipe gulp.dest 'public/templates/'

  gulp.src 'index.slim'
    .pipe slim()
    .pipe notify()
    .pipe gulp.dest ''

# Sass compilation using compass
#
gulp.task \compass, ->
  gulp.src 'app/sass/*.sass'
    .pipe compass do
      config_file: 'config/compass.rb'
      css: 'public/stylesheets'
      sass: 'app/sass'
    .pipe notify()
    .pipe gulp.dest 'public/stylesheets'

# Livescript compilation
#
gulp.task \livescript, ->
  gulp.src 'app/livescript/*.ls'
    .pipe livescript()
    .pipe notify()
    .pipe gulp.dest 'public/javascripts/'

gulp.task \clean !(cb) ->
  exec 'rm -rf build'
  cb(null)

# r.js project building
#
gulp.task \build, <[clean]>, !(cb) ->
  buildProcess = exec 'node script/r.js -o config/build.js', cb
  buildProcess.stdout.pipe process.stdout
  buildProcess.stderr.pipe process.stderr

# Push to github
#
gulp.task \push, <[build]>,  !(cb) ->
  pushProcess = execFile 'script/push.sh', cb
  pushProcess.stdout.pipe process.stdout
  pushProcess.stderr.pipe process.stderr

# Spin up a localhost server, default port = 5000
#
gulp.task \server, !(cb) ->
  server = connect()
  port = process.env.PORT || 3000
  console.log "Connect server starting at http://localhost:#port"
  server.use connect.static('./') .listen(port, cb)


# watchers & servers
#
gulp.task \watch, <[server]>, ->
  server = livereload()

  gulp.watch ['app/slim/*.slim', 'index.slim'], <[slim]>
  gulp.watch ['app/sass/*.sass'], <[compass]>

  gulp.watch ['index.html', 'public/**/*']
      .on 'change', (file) -> server.changed file.path

gulp.task \deploy, <[clean build push]>