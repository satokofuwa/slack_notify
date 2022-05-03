require "slack-notify"
require 'clockwork'
require 'active_support/time'
include Clockwork

  module Clockwork
    class  Client
    handler do |job|
      client = SlackNotify::Client.new(
        webhook_url: "https://hooks.slack.com/services/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",
        channel: "#general",
        username: "mybot"
        )
        client.notify("Hello There!")
    end
    every(3.minutes, 'less.frequent.job')
    end
  end 


  