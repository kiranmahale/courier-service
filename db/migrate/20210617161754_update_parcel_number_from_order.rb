class UpdateParcelNumberFromOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :parcel_number, :string
  end
end
