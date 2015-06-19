class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.integer :event_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
