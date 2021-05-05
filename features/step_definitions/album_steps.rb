Given /the following albums exist/ do |albums_table|
    albums_table.hashes.each do |album|
        Album.create album
    end
end

Then /(.*) seed albums should exist/ do |n_seeds|
    Album.count.should be n_seeds.to_i
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list| 
  rating_list.split(',').each do |rating| 
  step "I #{uncheck}check \"ratings_#{rating.strip}\""
  end
end

Then /I should see all albums/ do
  fail "Unimplemented"
end