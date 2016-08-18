class ChangeAddForTestInComments < ActiveRecord::Migration
  def change
  	change_column :comments, :add_for_test, :string
  	rename_column :comments, :add_for_test, :notes 
  end
end
