require 'rails_helper'

RSpec.describe "favourites/index", type: :view do
  before(:each) do
    assign(:favourites, [
      Favourite.create!(
        :uri => "Uri",
        :title => "Title"
      ),
      Favourite.create!(
        :uri => "Uri",
        :title => "Title"
      )
    ])
  end

  it "renders a list of favourites" do
    render
    assert_select "tr>td", :text => "Uri".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
