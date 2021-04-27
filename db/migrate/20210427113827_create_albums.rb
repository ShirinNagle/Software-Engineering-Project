class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
        t.string 'artist'
        t.string 'title'
        t.text 'review'
        t.string 'rating'
        t.datetime 'release_date'
        t.timestamps
    end
  end
end
