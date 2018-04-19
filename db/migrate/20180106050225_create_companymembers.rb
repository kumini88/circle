class CreateCompanymembers < ActiveRecord::Migration[5.0]
  def change
    create_table :companymembers do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.boolean :owner, default: false, null: false

      t.timestamps
      
      t.index [:user_id, :company_id], unique: true
    end
  end
end
