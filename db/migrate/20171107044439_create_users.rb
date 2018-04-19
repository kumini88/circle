class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :name
      t.string :email
      t.string :profile
      t.string :image
      t.string :highschool
      t.string :college
      t.string :grschool
      t.string :major
      t.string :job
      t.string :gyokai
      t.string :occupation
      t.string :twitter, default: ""
      t.string :facebook, default: ""
      t.string :instagram, default: ""
      t.string :linkedin, default: ""
      t.string :otherlinka, default: ""
      t.string :otherlinkb, default: ""
      t.string :password_digest

      t.timestamps
    end
  end
end
