require 'rails_helper'

RSpec.describe "mutants/index", type: :view do
  before(:each) do
    assign(:mutants, [
      Mutant.create!(
        :name => "Xavier",
      ),
      Mutant.create!(
        :name => "Wolverine",
      )
    ])
  end

  it "renders a list of mutants" do
    render
    assert_select "tr>td", :text => "Xavier".to_s, :count => 1
    assert_select "tr>td", :text => "Wolverine".to_s, :count => 1
  end
end
