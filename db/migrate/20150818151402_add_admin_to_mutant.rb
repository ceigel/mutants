class AddAdminToMutant < ActiveRecord::Migration
  def change
    add_column :mutants, :admin, :boolean, default: false
  end
end
