class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.string :location
      t.string :location_state
      t.references :event, index: true

      t.timestamps
    end
  end
end
