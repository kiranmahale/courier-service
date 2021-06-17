class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :weight
      t.string :service_type
      t.float :cost
      t.string :payment_mode
      t.string :status
      t.integer :parcel_number

      t.timestamps
    end
  end
end
