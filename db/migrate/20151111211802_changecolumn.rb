class Changecolumn < ActiveRecord::Migration
  def change
    change_column :events, :day, 'date USING CAST(day AS date)'
  end
end
