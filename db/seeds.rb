# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
more_albums = [
    {:artist => 'Radiohead',:title =>'Ok Computer',
    :rating =>'5', :release_date => '10-May-1996'},
    {:artist => 'The Pixies',:title =>'Doolittle',
    :rating =>'5', :release_date => '17-Mar-1990'},
    {:artist => 'Aldous Harding',:title =>'Designer',
    :rating =>'5', :release_date => '30-Apr-2018'},
    {:artist => 'Amy Winehouse',:title =>'Back To black',
    :rating =>'4', :release_date => '12-Sep-2006'}
]

more_albums.each do |album|
    Album.create!(album)
end