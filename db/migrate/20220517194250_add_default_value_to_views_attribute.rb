class AddDefaultValueToViewsAttribute < ActiveRecord::Migration[6.1]
  def up
    change_column_default :articles, :views, 0
  end
end
