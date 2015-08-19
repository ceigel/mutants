RSpec.configure do |config|
  config.before(:each) do
    allow(controller).to receive(:current_user).and_return(FactoryGirl.create(:mutant))
  end
end
