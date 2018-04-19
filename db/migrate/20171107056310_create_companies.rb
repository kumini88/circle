class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :profile
      t.string :image
      t.string :twitter, default: ""
      t.string :facebook, default: ""
      t.string :officiallink, default: ""

      t.timestamps
    end
  end
end
