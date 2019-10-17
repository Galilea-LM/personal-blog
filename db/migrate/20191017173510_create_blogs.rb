class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.string :description
      t.string :body, null: false
      t.string :tags
      t.string :reference
      t.boolean :published, null: false, default: 0
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :blogs, :title, unique: true
  end
end
