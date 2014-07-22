#
# * grunt-hipchat-notifier
# * https://github.com/logankoester/grunt-hipchat-notifier
# *
# * Copyright (c) 2013-2014 Logan Koester
# * Licensed under the MIT license.
#
module.exports = (grunt) ->
  HipchatClient = require 'hipchat-client'

  grunt.registerMultiTask 'hipchat_notifier', 'Send a message to a Hipchat room', ->
    grunt.config.requires 'hipchat_notifier.options.authToken'
    grunt.config.requires 'hipchat_notifier.options.roomId'

    options = @options(
      from: 'GruntJS'
      color: 'yellow'
      notify: 0
      message_format: 'html'
    )

    grunt.verbose.writeflags options, 'Options'

    grunt.verbose.writeln "Token: #{options.authToken}"
    done = @async()
    hipchat = new HipchatClient(options.authToken)

    grunt.verbose.writeln "Room: #{options.roomId}"
    grunt.log.writeln 'Sending Hipchat notification...'

    params =
      from: options.from?() ? options.from
      color: options.color?() ? options.color
      message: options.message?() ? options.message
      notify: options.notify
      message_format: options.message_format
      room_id: options.roomId

    hipchat.api.rooms.message params, (err, res) ->
        throw err if (err)
        grunt.log.writeln('Notification sent!');
        return done();
