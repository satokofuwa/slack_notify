module SlackNotify
  class Payload
    attr_accessor :username, :text, :channel, :icon_url, :icon_emoji, :link_names

    def initialize(options = {})
      @username   = options[:username] || "webhookbot"
      @channel    = options[:channel]  || "#general"
      @text       = options[:text]
      @icon_url   = options[:icon_url]
      @icon_emoji = options[:icon_emoji]
      @link_names = options[:link_names]

      unless channel[0] =~ /^(#|@)/
        @channel = "##{@channel}"
      end
    end

    def to_hash
     hash = {
        text:       text,
        username:   username,
        channel:    channel,
        icon_url:   icon_url,
        icon_emoji: icon_emoji,
        link_names: link_names
      }

      hash.delete_if { |_,v| v.nil? }
    end
  end
end
