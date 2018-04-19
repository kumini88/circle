class CreateEventcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :eventcomments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
