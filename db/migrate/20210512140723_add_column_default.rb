class AddColumnDefault < ActiveRecord::Migration[6.1]
  def change
  	change_column_default :blogs, :status, 0
  end
end
