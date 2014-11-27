class CreateOrgUsers < ActiveRecord::Migration
  def change
    create_table :org_users do |t|
      t.belongs_to :organization
      t.belongs_to :user

      t.timestamps
    end
  end
end