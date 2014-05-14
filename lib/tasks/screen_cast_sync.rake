require "screen_cast_importer"
namespace :screen_cast_sync do
  desc "SYNC all missing screen cast from railscast.com"
  task start: :environment do
  	total = ScreenCastImporter.import_railscasts
  	 puts "There are now #{total} screencasts from Railscasts.com"
  end
end
