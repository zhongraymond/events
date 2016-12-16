class RemoveColumnToComments < ActiveRecord::Migration
  def change
        remove_column :comments, :location_state, :string
  end
end
