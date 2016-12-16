class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.date :date
      t.string :location
      t.string :location_state

      t.timestamps
    end
  end
end
