require 'rails_helper'

RSpec.describe Mutant, type: :model do
  let(:mutant) {FactoryGirl.create(:mutant)}
  subject { mutant }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :teams }

  it 'is valid when built from parameters' do
    m = FactoryGirl.build(:mutant)
    expect(m).to be_valid
    expect(m.save).to eq true
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:mutant, name: nil)).not_to be_valid
  end

  it 'is invalid with duplicated name' do
    expect(FactoryGirl.build(:mutant, name: mutant.name)).not_to be_valid
  end

  it 'is invalid with duplicated name case insensitive' do
    expect(FactoryGirl.build(:mutant, name: mutant.name.upcase)).not_to be_valid
  end


  describe 'team relationship' do
    let(:team) { FactoryGirl.create(:team) }
    before do
      team.mutants << mutant
      mutant.reload
    end

    it 'can be added to a team' do
      expect(mutant.teams).to eq [team]
    end

    it 'can be removed from a team' do
      team.mutants.delete(mutant)
      mutant.reload
      expect(mutant.teams).to be_empty
    end
  end
end
