require 'rails_helper'

RSpec.describe "mutants/edit", type: :view do
  before(:each) do
    @mutant = assign(:mutant, Mutant.create!(
      :name => "Xavier",
    ))
  end
  it "renders the edit mutant form" do
    render
    assert_select "form[action=?][method=?]", mutant_path(@mutant), "post" do
      assert_select "input#mutant_name[name=?]", "mutant[name]"
    end
  end
end