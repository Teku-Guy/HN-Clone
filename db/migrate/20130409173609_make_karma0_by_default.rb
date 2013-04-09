class MakeKarma0ByDefault < ActiveRecord::Migration
  def change
    change_column :users, :karma, :integer, :default => 0
  end
end
