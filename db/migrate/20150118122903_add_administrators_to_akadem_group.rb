class AddAdministratorsToAkademGroup < ActiveRecord::Migration
  def change
    add_column :akadem_groups, :praepostor_id, :integer
    add_column :akadem_groups, :curator_id, :integer
    add_column :akadem_groups, :administrator_id, :integer
  end
end
