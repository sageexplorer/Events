class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :day
      t.integer :time
      t.string :place
      t.string :suggest
      t.string :comment

      t.timestamps null: false
    end
  end
end
