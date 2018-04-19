class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :title
      t.string :userstatus
      t.string :content
      t.boolean :public, default: true, null: false

      t.timestamps
    end
  end
end
