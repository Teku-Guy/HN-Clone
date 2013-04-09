class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :url
      t.string :title
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
