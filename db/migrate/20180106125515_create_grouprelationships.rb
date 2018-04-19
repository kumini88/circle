class CreateGrouprelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :grouprelationships do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :group_id], unique: true
    end
  end
end
