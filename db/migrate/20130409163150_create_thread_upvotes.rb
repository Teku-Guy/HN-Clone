class CreateThreadUpvotes < ActiveRecord::Migration
  def change
    create_table :thread_upvotes do |t|
      t.integer :submission_id
      t.integer :user_id
      t.timestamps
    end
  end
end
