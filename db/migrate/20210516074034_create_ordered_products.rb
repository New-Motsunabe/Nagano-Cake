class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :amount
      t.integer :work_status
      t.integer :tax_price

      t.timestamps
    end
  end
end
