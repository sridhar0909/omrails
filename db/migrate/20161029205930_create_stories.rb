class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.references :user, foreign_key: true
      t.datetime :date
      t.string :title
      t.text :story

      t.timestamps
    end
  end
end
 