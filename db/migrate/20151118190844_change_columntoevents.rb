class ChangeColumntoevents < ActiveRecord::Migration

  def change
    change_column :events, :time, 'time USING CAST(time AS time)'
  end
end
