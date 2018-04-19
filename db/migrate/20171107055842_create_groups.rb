class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_id
      t.string :profile
      t.string :image
      t.string :twitter, default: ""
      t.string :facebook, default: ""
      t.string :instagram, default: ""
      t.string :otherlinka, default: ""
      t.string :otherlinkb, default: ""

      t.timestamps
    end
  end
end
