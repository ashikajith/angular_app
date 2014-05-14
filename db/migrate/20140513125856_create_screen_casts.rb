class CreateScreenCasts < ActiveRecord::Migration
  def change
    create_table :screen_casts do |t|
      t.string :title
      t.text :summary
      t.string :duration
      t.string :link
      t.datetime :published_at
      t.string :source
      t.string :video_url

      t.timestamps
    end
  end
end
