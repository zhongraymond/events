class RenameColumnContToComments < ActiveRecord::Migration
  def change
    rename_column :comments, :location, :content
  end
end
