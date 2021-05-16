class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_id
      t.integer :shipping
      t.integer :total_price
      t.integer :payment_method
      t.string :address_name
      t.string :residence
      t.string :postal_code
      t.integer :order_status

      t.timestamps
    end
  end
end
