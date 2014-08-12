module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        options:
          join: true
        files:
          'build/compiled.js': 'src/**/*.coffee'

    less:
      compile:
        options:
          cleancss: true
          compress: true
        files: 'build/compiled.css': 'src/**/*.less'

    copy:
      index:
        src: 'src/index.html'
        dest: 'index.html'
    
    uglify:
      build:
        src: 'build/compiled.js'
        dest: 'build/compiled.js'

    watch:
      coffee:
        files: 'src/**/*.coffee'
        tasks: ['coffee', 'uglify']
      less:
        files: 'src/**/*.less'
        tasks: 'less'
      index:
        files: 'src/index.html'
        tasks: 'copy'
      gruntfile:
        files: 'Gruntfile.coffee'
        options:
          reload: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', 'watch'