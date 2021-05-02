class Album < ActiveRecord::Base
    #attr_accessible :artist, :rating, :release_date
    def self.all_ratings#possibly all_rating
        ['1','2','3','4','5','0']
    end
end
