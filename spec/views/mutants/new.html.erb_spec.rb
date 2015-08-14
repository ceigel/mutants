require 'rails_helper'

RSpec.describe "mutants/new", type: :view do
  before(:each) do
    assign(:mutant, Mutant.new(
      :name => "Xavier",
    ))
  end

  it "renders new mutant form" do
    render

    assert_select "form[action=?][method=?]", mutants_path, "post" do

      assert_select "input#mutant_name[name=?]", "mutant[name]"
    end
  end
end
