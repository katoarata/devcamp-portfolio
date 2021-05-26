class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :title
      has_many :blogs
      t.timestamps
    end
  end
end
