require 'test_helper'
# require 'spec_helper'

class ScreenCastTest < ActiveSupport::TestCase
  setup do
    @screencast_defaults = {
      title:        'Facebook Authentication',
      summary:      'This will show how to create a new facebook application and configure it. Then add some authentication with the omniauth-facebook gem and top it off with a client-side authentication using the JavaScript SDK.',
      duration:     '12:09',
      link:         'http://railscasts.com/episodes/360-facebook-authentication',
      published_at: Date.parse('Mon, 25 Jun 2012 00:00:00 -0700'),
      source:       'railscasts',
      video_url:    'http://media.railscasts.com/assets/episodes/videos/360-facebook-authentication.mp4'
    }
  end

  test "should be invalid if missing required data" do
    screencast = ScreenCast.new
    assert !screencast.valid?
    [:title, :summary, :duration, :link, :published_at, :source, :video_url].each do |field_name|
      assert screencast.errors.keys.include? field_name
    end
  end

  test "should be valid if required data exists" do
    screencast = ScreenCast.new(@screencast_defaults)
    assert screencast.valid?
  end

  test "should only allow one screencast with the same video url" do
    screencast = ScreenCast.new(@screencast_defaults)
    screencast.video_url = 'http://media.railscasts.com/assets/episodes/videos/360-facebook-authentication.mp4'
    screencast.errors.should have_error(:video_url)
  end
end
