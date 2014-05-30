#
# * grunt-hipchat-notifier
# * https://github.com/logankoester/grunt-hipchat-notifier
# *
# * Copyright (c) 2013-2014 Logan Koester
# * Licensed under the MIT license.
# 

module.exports = (grunt) ->
  
  # Project configuration.
  grunt.initConfig
    clean:
      tasks: ['tasks']
      tests: ['tmp']

    coffee:
      tasks:
        expand: true
        cwd: 'src/tasks/'
        src: '**/*.coffee'
        dest: 'tasks/'
        ext: '.js'

    bump:
      options:
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: false

  grunt.loadTasks 'tasks'
  
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-bump'
  
  grunt.registerTask 'build', ['clean', 'coffee']
  grunt.registerTask 'default', ['build']
