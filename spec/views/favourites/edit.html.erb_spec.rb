require 'rails_helper'

RSpec.describe "favourites/edit", type: :view do
  before(:each) do
    @favourite = assign(:favourite, Favourite.create!(
      :uri => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit favourite form" do
    render

    assert_select "form[action=?][method=?]", favourite_path(@favourite), "post" do

      assert_select "input[name=?]", "favourite[uri]"

      assert_select "input[name=?]", "favourite[title]"
    end
  end
end
