class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :place
      t.string :content
      t.string :image
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
