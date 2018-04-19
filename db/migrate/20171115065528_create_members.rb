class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.boolean :owner, default: false, null: false

      t.timestamps
      
      t.index [:user_id, :group_id], unique: true
    end
  end
end
