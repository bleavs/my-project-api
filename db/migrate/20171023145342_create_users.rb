class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :password
      t.string :first
      t.string :last
      t.string :city
      t.string :state

      t.string :title
      t.string :picture
      t.string :gender
      t.string :postcode
      t.string :street

      t.timestamps
    end
  end
end
