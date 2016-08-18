class DeleteNotesFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :notes
  end
end
