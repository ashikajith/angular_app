require "feedjira"

class ScreenCastImporter
  def self.import_railscasts

    # because the Railscasts feed is targeted at itunes, there is additional metadata that
    # is not collected by Feedjirra by default. By using add_common_feed_entry_element,
    # we can let Feedjirra know how to map those values. See more information at
    # http://www.ruby-doc.org/gems/docs/f/feedjirra-0.1.2/Feedjirra/Feed.html
    Feedjira::Feed.add_common_feed_entry_element(:enclosure, :value => :url, :as => :video_url)
    Feedjira::Feed.add_common_feed_entry_element('itunes:duration', :as => :duration)

    # Capture the feed and iterate over each entry
    feed = Feedjira::Feed.fetch_and_parse("http://feeds.feedburner.com/railscasts")
    feed.entries.each do |entry|

      # Strip out the episode number from the title
      title = entry.title.gsub(/^#\d+\s/, '')

      # Find or create the screencast data into our database
      # ScreenCast.where(video_url: entry.video_url).first_or_create(
      #   title:        title,
      #   summary:      entry.summary,
      #   duration:     entry.duration,
      #   link:         entry.url,
      #   published_at: entry.published,
      #   source:       'railscasts' # set this manually
      # )
    end

    # Return the number of total screencasts for the source
    ScreenCast.where(source: 'railscasts').count
  end
end