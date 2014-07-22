(function() {
  module.exports = function(grunt) {
    var HipchatClient;
    HipchatClient = require('hipchat-client');
    return grunt.registerMultiTask('hipchat_notifier', 'Send a message to a Hipchat room', function() {
      var done, hipchat, options, params, _ref, _ref1, _ref2;
      grunt.config.requires('hipchat_notifier.options.authToken');
      grunt.config.requires('hipchat_notifier.options.roomId');
      options = this.options({
        from: 'GruntJS',
        color: 'yellow',
        notify: 0,
        message_format: 'html'
      });
      grunt.verbose.writeflags(options, 'Options');
      grunt.verbose.writeln("Token: " + options.authToken);
      done = this.async();
      hipchat = new HipchatClient(options.authToken);
      grunt.verbose.writeln("Room: " + options.roomId);
      grunt.log.writeln('Sending Hipchat notification...');
      params = {
        from: (_ref = typeof options.from === "function" ? options.from() : void 0) != null ? _ref : options.from,
        color: (_ref1 = typeof options.color === "function" ? options.color() : void 0) != null ? _ref1 : options.color,
        message: (_ref2 = typeof options.message === "function" ? options.message() : void 0) != null ? _ref2 : options.message,
        notify: options.notify,
        message_format: options.message_format,
        room_id: options.roomId
      };
      return hipchat.api.rooms.message(params, function(err, res) {
        if (err) {
          throw err;
        }
        grunt.log.writeln('Notification sent!');
        return done();
      });
    });
  };

}).call(this);
