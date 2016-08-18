class AddForTestToComments < ActiveRecord::Migration
  def change
    add_column :comments, :add_for_test, :integer
  end
end
