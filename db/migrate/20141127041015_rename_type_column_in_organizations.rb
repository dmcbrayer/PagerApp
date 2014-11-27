class RenameTypeColumnInOrganizations < ActiveRecord::Migration
  def change
  	rename_column :organizations, :type, :variety
  end
end
