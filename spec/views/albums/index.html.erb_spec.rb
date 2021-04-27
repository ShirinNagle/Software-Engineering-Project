require 'rails_helper'

RSpec.describe "albums/index", type: :view do
  before(:each) do
    assign(:albums, [
      Album.create!(
        :artist => "Artist",
        :title => "Title",
        :review => "Review",
        :rating => "Rating",
        :release_date => "Release Date"
      ),
      Album.create!(
        :artist => "Artist",
        :title => "Title",
        :review => "Review",
        :rating => "Rating",
        :release_date => "Release Date"
      )
    ])
  end

  it "renders a list of albums" do
    render
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Review".to_s, :count => 2
    assert_select "tr>td", :text => "Rating".to_s, :count => 2
    assert_select "tr>td", :text => "Release Date".to_s, :count => 2
  end
end
