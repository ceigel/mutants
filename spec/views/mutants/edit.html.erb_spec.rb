require 'rails_helper'
require 'support/current_user_stub'

RSpec.describe "mutants/edit", type: :view do
  before(:each) do
    @mutant = assign(:mutant, FactoryGirl.create(:mutant, :name => "xavier"))
  end

  it "renders the edit mutant form" do
    render
    assert_select "form[action=?][method=?]", mutant_path(@mutant), "post" do
      assert_select "input#mutant_name[name=?]", "mutant[name]"
    end
  end
end
