class ChangeColumnWorkStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :ordered_products, :work_status, from: nil, to: "0"
  end
end
