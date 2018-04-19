class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :link
      t.string :img
      t.string :date
      t.string :source
      t.string :category

      t.timestamps
    end
  end
end
