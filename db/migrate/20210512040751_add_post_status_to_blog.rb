class AddPostStatusToBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :status,  :default=> 0, :integer,  :null => false,
  end
end
