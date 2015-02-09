class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :address
      t.text :references
      t.string :pay_type

      t.timestamps null: false
    end
  end
end
