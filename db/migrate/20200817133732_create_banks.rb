class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :bank_name
      t.string :street_address
      t.string :city
      t.string :zipcode 
      t.float :atm_fee
    end
  end
end
