class CreateUserbanks < ActiveRecord::Migration[5.2]
  def change
    create_table :userbanks do |t|
      t.integer :user_id
      t.integer :bank_id
      t.boolean :user_fav
    end
  end
end
