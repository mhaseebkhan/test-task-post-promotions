class ChangeDefaultValueToColumn < ActiveRecord::Migration
  def change
    change_column :posts, :current_clicks, :integer, default: 0
  end
end
