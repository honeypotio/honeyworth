class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :name
      t.string :email
      t.string :profile_link
      t.string  :dev_link

      t.timestamps null: false
    end
  end
end
