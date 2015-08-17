require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:team) {FactoryGirl.create(:team)}
  let(:task) {FactoryGirl.create(:task, team: team)}
  subject { task }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :team }

  it 'is valid when built from parameters' do
    m = FactoryGirl.build(:task, team: team)
    expect(m).to be_valid
    expect(m.save).to eq true
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:task, name: nil, team: team)).not_to be_valid
  end

  it 'is invalid with duplicated name' do
    expect(FactoryGirl.build(:task, name: task.name, team: team)).not_to be_valid
  end

  it 'is invalid with duplicated name case insensitive' do
    expect(FactoryGirl.build(:task, name: task.name.upcase, team: team)).not_to be_valid
  end

  it 'is valid with duplicated name when team is different' do
    t = FactoryGirl.create(:team)
    expect(FactoryGirl.build(:task, name: task.name, team: t)).to be_valid
  end

  describe 'team relationship' do
    it 'is present in the team tasks list' do
      expect(team.tasks).to eq Array(task)
    end

    it 'is destroyed when team is destroyed' do
      task.save
      expect { team.destroy }.to change { Task.count}.by(-1)
    end
  end
end
