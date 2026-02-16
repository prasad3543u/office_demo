class CreateOffices < ActiveRecord::Migration[8.1]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
