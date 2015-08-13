class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :name
      t.string :capability

      t.timestamps null: false
    end
    add_index :mutants, :name
  end
end
