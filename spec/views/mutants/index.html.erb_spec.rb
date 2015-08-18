require 'rails_helper'

RSpec.describe "mutants/index", type: :view do
  before(:each) do
    assign(:mutants, [
      FactoryGirl.create(:mutant, :name => "xavier"),
      FactoryGirl.create(:mutant, :name => "wolverine")
    ])
  end

  it "renders a list of mutants" do
    render
    assert_select "tr>td", :text => "xavier", :count => 1
    assert_select "tr>td", :text => "wolverine", :count => 1
  end
end
