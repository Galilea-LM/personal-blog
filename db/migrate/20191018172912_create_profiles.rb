class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :work
      t.string :biography
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :profiles, :name
  end
end
