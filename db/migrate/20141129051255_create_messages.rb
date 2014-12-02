class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.text :content
      t.integer :recipient

      t.timestamps

    end
  end
end
