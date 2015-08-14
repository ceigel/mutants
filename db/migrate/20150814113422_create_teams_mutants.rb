class CreateTeamsMutants < ActiveRecord::Migration
  def change
    create_table :mutants_teams, id: false do |t|
      t.belongs_to :team, index: true
      t.belongs_to :mutant, index: true
    end
  end
end
