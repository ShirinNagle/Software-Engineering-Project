require 'rails_helper'

RSpec.describe "albums/show", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :artist => "Artist",
      :title => "Title",
      :review => "Review",
      :rating => "Rating",
      :release_date => "Release Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Artist/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Review/)
    expect(rendered).to match(/Rating/)
    expect(rendered).to match(/Release Date/)
  end
end
