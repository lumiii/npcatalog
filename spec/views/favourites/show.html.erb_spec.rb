require 'rails_helper'

RSpec.describe "favourites/show", type: :view do
  before(:each) do
    @favourite = assign(:favourite, Favourite.create!(
      :uri => "Uri",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uri/)
    expect(rendered).to match(/Title/)
  end
end
