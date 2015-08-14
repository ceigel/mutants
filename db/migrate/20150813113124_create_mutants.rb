class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :mutants, :name
  end
end
